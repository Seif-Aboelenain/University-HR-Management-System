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
    public partial class ApproveAnnualLeaves : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnProcessAnnual_Click(object sender, EventArgs e)
        {
            // 1) Check login (must be logged in upperboard: Dean / Vice-dean / President)
            if (Session["EmpID"] == null)
            {
                lblMessage.Text = "You must log in before approving annual leaves.";
                return;
            }

            int upperboardId = Convert.ToInt32(Session["EmpID"]);

            // 2) Validate request ID
            int requestId;
            if (!int.TryParse(txtRequestId.Text.Trim(), out requestId))
            {
                lblMessage.Text = "Please enter a valid numeric annual leave request ID.";
                return;
            }

            // 3) Validate replacement employee ID
            int replacementId;
            if (!int.TryParse(txtReplacementId.Text.Trim(), out replacementId))
            {
                lblMessage.Text = "Please enter a valid numeric replacement employee ID.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // 4) Call Upperboard_approve_annual
                    using (SqlCommand cmd = new SqlCommand("Upperboard_approve_annual", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@request_ID", requestId);
                        cmd.Parameters.AddWithValue("@Upperboard_ID", upperboardId);
                        cmd.Parameters.AddWithValue("@replacement_ID", replacementId);

                        cmd.ExecuteNonQuery();
                    }

                    // 5) Read final status from Leave table
                    using (SqlCommand cmdStatus = new SqlCommand(
                        "SELECT final_approval_status FROM Leave WHERE request_ID = @reqId",
                        conn))
                    {
                        cmdStatus.Parameters.AddWithValue("@reqId", requestId);

                        object statusObj = cmdStatus.ExecuteScalar();

                        if (statusObj == null || statusObj == DBNull.Value)
                        {
                            lblMessage.Text = "No leave request found with this ID.";
                            return;
                        }

                        string status = statusObj.ToString();
                        lblMessage.Text = "The annual leave request (ID: " +
                                          requestId + ") is now: " + status + ".";
                    }
                }
            }
            catch (SqlException)
            {
                lblMessage.Text = " Unable to process annual leave. Please verify your input.";
            }
            catch (Exception)
            {
                lblMessage.Text = " An unexpected error occurred. Please try again.";
            }

        }
    }
}