using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EMS_25112023.Assignement
{
    public partial class BasicCalculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int N1 = Convert.ToInt32(txtfnumber.Text);
            int N2 = Convert.ToInt32(txtsecondnumber.Text);
            int Sum = N1 + N2;
            txtres.Text = Sum.ToString();
        }
    }
}