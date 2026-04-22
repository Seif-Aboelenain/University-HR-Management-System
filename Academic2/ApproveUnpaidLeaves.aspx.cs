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
    public partial class ApproveUnpaidLeaves : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnProcessUnpaid_Click(object sender, EventArgs e)
        {
            // 1) Check login: must be a logged-in employee (Dean / Vice-dean / President)
            if (Session["EmpID"] == null)
            {
                lblMessage.Text = "You must log in before approving unpaid leaves.";
                return;
            }

            int upperboardId = Convert.ToInt32(Session["EmpID"]);

            // 2) Validate request ID
            int requestId;
            if (!int.TryParse(txtRequestId.Text.Trim(), out requestId))
            {
                lblMessage.Text = "Please enter a valid numeric unpaid leave request ID.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // 3) Call the stored procedure to approve/reject unpaid leave
                    using (SqlCommand cmd = new SqlCommand("Upperboard_approve_unpaids", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@request_ID", requestId);
                        cmd.Parameters.AddWithValue("@upperboard_ID", upperboardId);

                        cmd.ExecuteNonQuery();
                    }

                    // 4) Read the final status from Leave table
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
                        lblMessage.Text = "The unpaid leave request (ID: " +
                                          requestId + ") is now: " + status + ".";
                    }
                }
            }
            catch (SqlException)
            {
                lblMessage.Text = " Could not process unpaid leave request. Please check the request ID.";
            }
            catch (Exception)
            {
                lblMessage.Text = " Something went wrong. Try again.";
            }

        }
    }
}