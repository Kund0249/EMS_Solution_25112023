using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace EMS_25112023.EmployeeContainer
{
    public partial class NewEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDepartments();
            }
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //code to save data

            string CS = @"data source=.;database=Assignement10112023;trusted_connection=true";

            //Step-1 : Establish the connection with DataBase
            SqlConnection connection = new SqlConnection(CS);

            //Step-2 : Specify the command and command type
            //string Query = string.Format("Insert into TEMPLOYEE " +
            //    "Values('{0}',{1},'{2}','{3}'," +
            //    "'{4}','{5}',{6},'{7}')", txtFname.Text, ddlDepartment.SelectedValue,
            //    rdbGender.SelectedValue, txtMob.Text, txtDoj.Text, txtEmail.Text,
            //    txtSalary.Text, txtbankaccount.Text);

            SqlCommand command = new SqlCommand("spAddEmployee", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            command.Parameters.Add(new SqlParameter("@Name",txtFname.Text));
            command.Parameters.AddWithValue("@DepartmentId", ddlDepartment.SelectedValue);
            command.Parameters.AddWithValue("@Gender", rdbGender.SelectedValue);
            command.Parameters.AddWithValue("@ContactNo",txtMob.Text);
            command.Parameters.AddWithValue("@DOJ",txtDoj.Text);
            command.Parameters.AddWithValue("@EmailAddress",txtEmail.Text);
            command.Parameters.AddWithValue("@Salary", txtSalary.Text);
            command.Parameters.AddWithValue("@BankAccount", txtbankaccount.Text);


            //Step-3 : Open the connection,Execute Command and Close the connection
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();


            ClearFormCOntrols();

            string Message = "toastr['success']('Record inserted successfully!', 'Success')";
            ClientScript.RegisterClientScriptBlock(this.GetType(), "S001", Message, true);
            //https://codeseven.github.io/toastr/
            //Client Side Lib : Jquery.js,toastr.js and toastr.css

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearFormCOntrols();
        }

        private void ClearFormCOntrols()
        {
            txtFname.Text = string.Empty;
            txtbankaccount.Text = string.Empty;
            txtrebankaccount.Text = string.Empty;
            txtMob.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtSalary.Text = string.Empty;
            txtDoj.Text = string.Empty;
            rdbGender.ClearSelection();
            ddlDepartment.ClearSelection();
        }

        private void GetDepartments()
        {
            string CS = @"data source=.;database=Assignement10112023;trusted_connection=true";

            //Step-1 : Establish the connection with DataBase
            SqlConnection connection = new SqlConnection(CS);

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