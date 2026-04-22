using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace databasemile3.Admin1
{
    public partial class AdminUpdateAttendance : System.Web.UI.Page
    {
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";

            // Validate Employee ID
            if (string.IsNullOrWhiteSpace(txtEmpID.Text))
            {
                lblMsg.Text = "<span style='color:red;'>Enter an Employee ID.</span>";
                return;
            }

            if (!int.TryParse(txtEmpID.Text, out int empID))
            {
                lblMsg.Text = "<span style='color:red;'>Employee ID must be numeric.</span>";
                return;
            }

            // Parse Check-in time
            TimeSpan? checkIn = null;
            if (!string.IsNullOrWhiteSpace(txtCheckIn.Text))
            {
                if (TimeSpan.TryParse(txtCheckIn.Text, out TimeSpan tIn))
                {
                    checkIn = tIn;
                }
                else
                {
                    lblMsg.Text = "<span style='color:red;'>Invalid Check-in time format (HH:MM:SS).</span>";
                    return;
                }
            }

            // Parse Check-out time
            TimeSpan? checkOut = null;
            if (!string.IsNullOrWhiteSpace(txtCheckOut.Text))
            {
                if (TimeSpan.TryParse(txtCheckOut.Text, out TimeSpan tOut))
                {
                    checkOut = tOut;
                }
                else
                {
                    lblMsg.Text = "<span style='color:red;'>Invalid Check-out time format (HH:MM:SS).</span>";
                    return;
                }
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["HRConn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("Update_Attendance", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // MUST MATCH SQL EXACTLY
                    cmd.Parameters.AddWithValue("@Employee_id", empID);

                    cmd.Parameters.AddWithValue("@check_in_time", checkIn.HasValue ? (object)checkIn.Value : DBNull.Value);
                    cmd.Parameters.AddWithValue("@check_out_time", checkOut.HasValue ? (object)checkOut.Value : DBNull.Value);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMsg.Text = "<span style='color:green;'>✔ Attendance updated successfully.</span>";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<span style='color:red;'>Error: " + ex.Message + "</span>";
            }
        }
    }
}
