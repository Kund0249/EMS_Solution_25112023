using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_25112023.EmployeeContainer
{
    public partial class NewEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //code to save data
            ClearFormCOntrols();
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
        }
    }
}