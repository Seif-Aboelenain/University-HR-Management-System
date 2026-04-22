using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace databasemile3.Academic2
{
    public partial class ApplyAccidentalLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //1) Check that the user is logged in (EmpID in Session)
            if (Session["EmpID"] == null)
            {
                lblAccMessage.Text = "You must log in as an academic employee before applying for a leave.";
                return;
            }

            int employeeId = Convert.ToInt32(Session["EmpID"]);

            //2) Read and validate dates
            DateTime startDate, endDate;

            if (!DateTime.TryParse(txtAccStartDate.Text, out startDate))
            {
                lblAccMessage.Text = "Please select a valid start date.";
                return;
            }

            if (!DateTime.TryParse(txtAccEndDate.Text, out endDate))
            {
                lblAccMessage.Text = "Please select a valid end date.";
                return;
            }

            if (endDate < startDate)
            {
                lblAccMessage.Text = "End date cannot be before start date.";
                return;
            }

            //3) Call the stored procedure Submit_accidental
            string connStr = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand("Submit_accidental", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@employee_ID", employeeId);
                    cmd.Parameters.AddWithValue("@start_date", startDate);
                    cmd.Parameters.AddWithValue("@end_date", endDate);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblAccMessage.Text = "Your accidental leave request has been submitted successfully.";
            }
            catch (SqlException)
            {
                lblAccMessage.Text = "Unable to submit accidental leave. Please check your input or contact support.";
            }
            catch (Exception)
            {
                lblAccMessage.Text = "Something went wrong. Please try again later.";
            }

        }
    }
}
