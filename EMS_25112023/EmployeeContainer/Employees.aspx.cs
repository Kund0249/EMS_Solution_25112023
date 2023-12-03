using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace EMS_25112023.EmployeeContainer
{
    public partial class Employees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetEmployee();
            }
        }

        private void GetEmployee()
        {
            string cs = ConfigurationManager.ConnectionStrings["EmpDbCon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spGetAllEmployee", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable table = new DataTable();
                adapter.Fill(table);

                if(table != null)
                {
                    GridEmployee.DataSource = table;
                    GridEmployee.DataBind();
                }
            }

            //50000
        }
    }
}