using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace databasemile3.HR
{
    public partial class HRLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = "SELECT dbo.HRLoginValidation(@employee_ID, @password)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    int empId;
                    if (!int.TryParse(txtEmail.Text.Trim(), out empId))
                    {
                        lblMessage.Text = "Enter a valid numeric HR ID.";
                        return;
                    }

                    cmd.Parameters.AddWithValue("@employee_ID", empId);
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

                    conn.Open();
                    object result = cmd.ExecuteScalar();

                    bool success = false;
                    if (result != null && result != DBNull.Value)
                    {
                        success = (Convert.ToInt32(result) == 1);
                    }

                    if (success)
                    {
                        Session["HR_ID"] = empId;
                        Response.Redirect("HRHome.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Wrong ID or password, or you are not in HR department.";
                    }
                }
            }
        }
    }
}