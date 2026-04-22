using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databasemile3.Academic
{
    using System;
    using System.Data.SqlClient;
    using System.Web.Configuration;

    public partial class Login : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int empId;
            if (!int.TryParse(txtEmpID.Text.Trim(), out empId))
            {
                lblMessage.Text = "Enter a valid numeric ID.";
                return;
            }
            string password = txtPassword.Text;

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("SELECT dbo.EmployeeLoginValidation(@id, @pwd)", conn))
            {
                cmd.Parameters.AddWithValue("@id", empId);
                cmd.Parameters.AddWithValue("@pwd", password);
                conn.Open();

                var result = cmd.ExecuteScalar();
                bool ok = false;

                if (result != null && result != DBNull.Value)
                {
                    // Safely converts the result (BIT, bool, or int) to an int for comparison.
                    // true/1 becomes 1; false/0 becomes 0.
                    ok = Convert.ToInt32(result) == 1;
                }

                if (ok)
                {
                    Session["EmpID"] = empId;
                    Response.Redirect("~/Academic/AcademicDashboard.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid credentials.";
                }
            }
        }
    }

}