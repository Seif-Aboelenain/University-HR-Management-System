using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databasemile3.Admin1
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void btnDeptCount_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminEmpPerDept.aspx");
        }
        protected void btnRejectedMed_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminRejectedMedicalLeaves.aspx");
        }


    }
}