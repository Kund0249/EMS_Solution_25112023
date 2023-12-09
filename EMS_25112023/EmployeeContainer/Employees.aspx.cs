using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace EMS_25112023.EmployeeContainer
{
    public partial class Employees : System.Web.UI.Page
    {
        string cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            cs = ConfigurationManager.ConnectionStrings["EmpDbCon"].ConnectionString;

            if (!IsPostBack)
            {
                GetEmployee();
            }
        }

        private void GetEmployee()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetAllEmployee", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                if (table != null)
                {
                    GridEmployee.DataSource = table;
                    GridEmployee.DataBind();
                }
            }

            //50000
        }

        protected void GridEmployee_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(GridEmployee.DataKeys[e.RowIndex].Value);
            int Rows = 0;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spDeleteEmployee", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@EmpId", Id);
                con.Open();
                Rows = cmd.ExecuteNonQuery();
                con.Close();
            }

            string Message = string.Empty;
            if (Rows > 0)
            {
                GetEmployee();
                Message = "toastr['success']('Record : " + Id + " is Delete successfully!', 'Success')";
            }
            else
            {
                Message = "toastr['error']('System is not able to process your request, something happen wrongs!', 'Error')";
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "S001", Message, true);

        }
    }
}