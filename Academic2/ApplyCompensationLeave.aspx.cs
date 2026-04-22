using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace databasemile3.Academic2
{
    public partial class ApplyCompensationLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmitComp_Click(object sender, EventArgs e)
        {
            // 1) Check login (EmpID must be stored in Session)
            if (Session["EmpID"] == null)
            {
                lblMessage.Text = "You must log in as an academic employee before applying for a compensation leave.";
                return;
            }

            int employeeId = Convert.ToInt32(Session["EmpID"]);

            // 2) Read and validate dates
            DateTime compDate, originalDate;

            if (!DateTime.TryParse(txtCompDate.Text, out compDate))
            {
                lblMessage.Text = "Please select a valid compensation date.";
                return;
            }

            if (!DateTime.TryParse(txtOriginalDate.Text, out originalDate))
            {
                lblMessage.Text = "Please select a valid original workday date.";
                return;
            }

            string reason = txtReason.Text.Trim();
            if (string.IsNullOrEmpty(reason))
            {
                lblMessage.Text = "Please enter a reason for the compensation leave.";
                return;
            }

            int repEmpId;
            if (!int.TryParse(txtRepEmpId.Text, out repEmpId))
            {
                lblMessage.Text = "Replacement employee ID must be a valid number.";
                return;
            }

            // 3) Call Submit_compensation stored procedure
            string connStr = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand("Submit_compensation", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@employee_ID", employeeId);
                    cmd.Parameters.AddWithValue("@compensation_date", compDate);
                    cmd.Parameters.AddWithValue("@reason", reason);
                    cmd.Parameters.AddWithValue("@date_of_original_workday", originalDate);
                    cmd.Parameters.AddWithValue("@rep_emp_id", repEmpId);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Your compensation leave request has been submitted successfully.";
            }
            catch (SqlException)
            {
                lblMessage.Text = "Could not submit compensation leave. Verify the data provided.";
            }
            catch (Exception)
            {
                lblMessage.Text = " An unexpected error occurred. Please try again.";
            }

        }
    }
}