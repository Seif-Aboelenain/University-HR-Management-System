using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace databasemile3.Admin1
{
    public partial class AdminInitiateAttendance : System.Web.UI.Page
    {
        protected void btnInit_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["HRConn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("Initiate_Attendance", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMsg.Text = "<span style='color:green;'>✔ Attendance successfully initiated for all employees.</span>";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<span style='color:red;'>Error: " + ex.Message + "</span>";
            }
        }
    }
}
