using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace EMS_25112023.DepartmentContainer
{
    public partial class AddDepartment : System.Web.UI.Page
    {
        string CS = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            CS = ConfigurationManager.ConnectionStrings["EmpDbCon"].ConnectionString;
            if (!IsPostBack)
            {
                GetDepartments();
            }
        }

        private void GetDepartments()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetAllDepartmentList", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                con.Open();
                GridDepartment.DataSource = cmd.ExecuteReader();
                GridDepartment.DataBind();
                con.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spInsertDepartment", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.Add(new SqlParameter("@DeptCode", txtDeptCode.Text));
                cmd.Parameters.AddWithValue("@DeptName", txtDeptName.Text);

                if (btnSubmit.Text == "Update")
                {
                    cmd.Parameters.AddWithValue("@DeptId", hdfDeptId.Value.ToString());
                    cmd.CommandText = "spUpdateDepartment";
                }

                con.Open();
                string StatusCode = (string)cmd.ExecuteScalar();
                con.Close();

                string Message = string.Empty;

                if (StatusCode == "S001")
                    Message = "toastr['success']('Record inserted successfully!', 'Success')";
                else if (StatusCode == "RE01")
                    Message = "toastr['info']('Record already exists!', 'Inrormation')";
                else if (StatusCode == "U001")
                    Message = "toastr['success']('Record Updated successfully!', 'Success')";
                else
                    Message = "toastr['error']('Currently system not able to process your request!', 'Error')";

                ClearFormControl();
                GetDepartments();
                ClientScript.RegisterClientScriptBlock(this.GetType(), "S001", Message, true);

            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearFormControl();
        }

        private void ClearFormControl()
        {
            txtDeptCode.Text = string.Empty;
            txtDeptName.Text = string.Empty;
            hdfDeptId.Value = string.Empty;
            btnSubmit.Text = "Save";
            btnSubmit.CssClass = "btn btn-primary";
        }

        protected void GridDepartment_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridDepartment.DataKeys[e.RowIndex].Value.ToString();
            string StatusCode = string.Empty;
            using (SqlConnection connection = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spRemoveDepartment", connection);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DepartmentId", id);
                connection.Open();
                StatusCode = (string)cmd.ExecuteScalar();
                connection.Close();
            }

            string Message = string.Empty;

            if (StatusCode == "S001")
                Message = "toastr['success']('Department : " + id + " Deleted successfully!', 'Record Deleted')";
            else if (StatusCode == "RN01")
                Message = "toastr['info']('Record Not exists!', 'Inrormation')";
            else
                Message = "toastr['error']('Currently system not able to process your request!', 'Error')";

            GetDepartments();
            ClientScript.RegisterClientScriptBlock(this.GetType(), "S001", Message, true);
        }


        protected void GridDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GridDepartment.SelectedValue.ToString();
            bool IsRecordExist = true;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetDepartmentById", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DeptId", id);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        txtDeptCode.Text = reader["DeptCode"].ToString();
                        txtDeptName.Text = reader["DeptName"].ToString();
                        hdfDeptId.Value = reader["Id"].ToString();
                        btnSubmit.Text = "Update";
                        btnSubmit.CssClass = "btn btn-warning";
                    }
                }
                else
                {
                    IsRecordExist = false;
                }
                con.Close();
            }
        }
    }
}