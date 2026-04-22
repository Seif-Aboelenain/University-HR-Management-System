using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace databasemile3.HR
{
    public partial class HRApproveUnpaid : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingRequests();
            }
        }

        private void LoadPendingRequests()
        {
            string cs = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                string query = @"
                    SELECT 
                        l.request_ID,
                        (e.first_name + ' ' + e.last_name) AS empName,
                        l.date_of_request,
                        l.start_date,
                        l.end_date,
                        l.num_days,
                        l.final_approval_status,
                        e.annual_balance AS annualbalance
                    FROM dbo.Unpaid_Leave ul
                    INNER JOIN dbo.[Leave] l ON ul.request_ID = l.request_ID
                    INNER JOIN dbo.Employee e ON ul.Emp_ID = e.employee_id
                    WHERE l.final_approval_status = 'Pending'
                    ORDER BY l.date_of_request DESC;";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    DataTable dt = new DataTable();
                    conn.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                    gvRequests.DataSource = dt;
                    gvRequests.DataBind();
                }
            }
        }

        private bool TryGetIds(out int requestId, out int hrId)
        {
            requestId = 0;
            hrId = 0;

            if (!int.TryParse(txtRequestId.Text.Trim(), out requestId))
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Enter a valid numeric Request ID.";
                return false;
            }

            if (Session["HR_ID"] == null || !int.TryParse(Session["HR_ID"].ToString(), out hrId))
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "HR is not logged in. Please log in again.";
                return false;
            }

            return true;
        }

        private bool RequestExists(int requestId, SqlConnection conn)
        {
            using (SqlCommand checkCmd = new SqlCommand(
                "SELECT COUNT(*) FROM dbo.[Leave] WHERE request_ID = @id", conn))
            {
                checkCmd.Parameters.AddWithValue("@id", requestId);
                int count = (int)checkCmd.ExecuteScalar();
                return count > 0;
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            HandleAction(true);
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            HandleAction(false);
        }

        private void HandleAction(bool approve)
        {
            try
            {
                int requestId, hrId;
                if (!TryGetIds(out requestId, out hrId))
                    return;

                string cs = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    conn.Open();

                    if (!RequestExists(requestId, conn))
                    {
                        lblResult.ForeColor = System.Drawing.Color.Red;
                        lblResult.Text = "Request ID does not exist.";
                        return;
                    }

                    using (SqlCommand cmd = new SqlCommand("HR_approval_unpaid", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@request_ID", requestId);
                        cmd.Parameters.AddWithValue("@HR_ID", hrId);
                        cmd.ExecuteNonQuery();
                    }

                    lblResult.ForeColor = System.Drawing.Color.Green;
                    lblResult.Text = "Leave request processed. Refresh the list to see updated status.";
                }

                LoadPendingRequests();
            }
            catch (Exception ex)
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Error: " + ex.Message;
            }
        }
    }
}
