using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databasemile3.Admin1
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = txtUsername.Text;
            string pass = txtPassword.Text;

            if (user == "admin" && pass == "123")
            {
                Response.Redirect("AdminHome.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
}
