using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace databasemile3.Admin1
{
    public partial class AdminAddHoliday : System.Web.UI.Page
    {
        protected void btnAddHoliday_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";

            if (string.IsNullOrWhiteSpace(txtHolidayName.Text) ||
                string.IsNullOrWhiteSpace(txtHolidayDate.Text))
            {
                lblMsg.Text = "<span class='error'>Please enter both holiday name and date.</span>";
                return;
            }

            DateTime holidayDate;

            if (!DateTime.TryParse(txtHolidayDate.Text, out holidayDate))
            {
                lblMsg.Text = "<span class='error'>Invalid date format. Use YYYY-MM-DD.</span>";
                return;
            }

            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["HRConn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("Add_Holiday", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@holiday_name", txtHolidayName.Text);
                    cmd.Parameters.AddWithValue("@from_date", holidayDate);
                    cmd.Parameters.AddWithValue("@to_date", holidayDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }

                lblMsg.Text = "<span class='success'>✔ Holiday added successfully!</span>";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<span class='error'>Error: " + ex.Message + "</span>";
            }
        }
    }
}
