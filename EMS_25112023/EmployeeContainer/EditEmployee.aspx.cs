using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_25112023.EmployeeContainer
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        string cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            cs = ConfigurationManager.ConnectionStrings["EmpDbCon"].ConnectionString;

            if (!IsPostBack)
            {
                GetDepartments();
                if (Request.QueryString["id"] != null)
                {
                    if(int.TryParse(Request.QueryString["id"],out int id))
                        GetEmployee(id);
                    else
                        Response.Redirect("Employees.aspx");
                }
                else
                    Response.Redirect("Employees.aspx");
            }
        }

      

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }

        private void GetEmployee(int id)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetEmployeeById", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@EmpId", id);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        hdfEmpId.Value = reader["EmployeeId"].ToString();
                        txtFname.Text = reader["Name"].ToString();
                        txtMob.Text = reader["ContactNo"].ToString();
                        txtEmail.Text = reader["EmailAddress"].ToString();
                        txtDoj.Text = Convert.ToDateTime(reader["DOJ"]).ToString("yyyy-MM-dd");
                        txtbankaccount.Text = reader["BankAccountNo"].ToString();
                        txtrebankaccount.Text = reader["BankAccountNo"].ToString();
                        txtSalary.Text = reader["Salary"].ToString();
                        rdbGender.SelectedValue = reader["Gender"].ToString();
                        ddlDepartment.SelectedValue = reader["DepartmentId"].ToString();
                    }
                }
                con.Close();
            }
        }
        private void GetDepartments()
        {

            //Step-1 : Establish the connection with DataBase
            SqlConnection connection = new SqlConnection(cs);

            //Step-2 : Specify the command and command type
            SqlCommand command = new SqlCommand("spGetAllDepartments", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            //Step-3 : Open the connection,Execute Command and Close the connection
            connection.Open();
            SqlDataReader dataReader = command.ExecuteReader();
            ddlDepartment.DataSource = dataReader;
            ddlDepartment.DataBind();

            ddlDepartment.Items.Insert(0, new ListItem()
            {
                Value = "-1",
                Text = "Select Department"
            });

            connection.Close();
        }
    }
}