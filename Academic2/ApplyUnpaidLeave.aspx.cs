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
    public partial class ApplyUnpaidLeave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmitUnpaid_Click(object sender, EventArgs e)
        {
            // 1) Check login (Session must contain EmpID)
            if (Session["EmpID"] == null)
            {
                lblMessage.Text = "You must log in as an academic employee before applying for an unpaid leave.";
                return;
            }

            int employeeId = Convert.ToInt32(Session["EmpID"]);

            // 2) Read and validate required fields
            DateTime startDate, endDate;

            if (!DateTime.TryParse(txtStartDate.Text, out startDate))
            {
                lblMessage.Text = "Please select a valid start date.";
                return;
            }

            if (!DateTime.TryParse(txtEndDate.Text, out endDate))
            {
                lblMessage.Text = "Please select a valid end date.";
                return;
            }

            if (endDate < startDate)
            {
                lblMessage.Text = "End date cannot be before start date.";
                return;
            }

            string documentDescription = txtDocumentDescription.Text.Trim();
            if (string.IsNullOrEmpty(documentDescription))
            {
                lblMessage.Text = "Please enter a document description.";
                return;
            }

            string fileName = txtFileName.Text.Trim();
            if (string.IsNullOrEmpty(fileName))
            {
                lblMessage.Text = "Please enter the document file name.";
                return;
            }

            // 3) Call Submit_unpaid stored procedure
            string connStr = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand("Submit_unpaid", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@employee_ID", employeeId);
                    cmd.Parameters.AddWithValue("@start_date", startDate);
                    cmd.Parameters.AddWithValue("@end_date", endDate);
                    cmd.Parameters.AddWithValue("@document_description", documentDescription);
                    cmd.Parameters.AddWithValue("@file_name", fileName);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Your unpaid leave request has been submitted successfully.";
            }
            catch (SqlException)
            {
                lblMessage.Text = " Unable to submit unpaid leave request. Please check the entered information.";
            }
            catch (Exception)
            {
                lblMessage.Text = " Something went wrong. Please try again.";
            }

        }
    }
}