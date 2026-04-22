using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace databasemile3.HR
{
    public partial class HRUnpaidDeduction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPendingDeductions();
            }
        }

        private void LoadPendingDeductions()
        {
            string cs = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(cs))
            {
                conn.Open();

                string query = @"
                    SELECT d.emp_ID,
                           e.first_name + ' ' + e.last_name AS employee_name,
                           COUNT(d.deduction_ID) AS num_deductions,
                           SUM(d.amount) AS total_amount
                    FROM Deduction d
                    JOIN Employee e ON d.emp_ID = e.employee_ID
                    WHERE d.type = 'unpaid' AND d.status = 'pending'
                    GROUP BY d.emp_ID, e.first_name, e.last_name
                    ORDER BY e.first_name;";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvPendingEmployees.DataSource = dt;
                    gvPendingEmployees.DataBind();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

                int empId;
                if (!int.TryParse(txtEmpId.Text.Trim(), out empId))
                {
                    lblResult.CssClass = "message message-error";
                    lblResult.Text = "Enter a valid numeric Employee ID.";
                    return;
                }

                using (SqlConnection conn = new SqlConnection(cs))
                {
                    conn.Open();

                    using (SqlCommand checkCmd = new SqlCommand(
                        "SELECT COUNT(*) FROM Employee WHERE employee_ID = @id", conn))
                    {
                        checkCmd.Parameters.AddWithValue("@id", empId);
                        int count = (int)checkCmd.ExecuteScalar();
                        if (count == 0)
                        {
                            lblResult.CssClass = "message message-error";
                            lblResult.Text = "Employee ID does not exist.";
                            return;
                        }
                    }

                    using (SqlCommand pendingCmd = new SqlCommand(@"
                SELECT COUNT(*) 
                FROM Deduction 
                WHERE emp_ID = @id AND type = 'unpaid' AND status = 'pending';", conn))
                    {
                        pendingCmd.Parameters.AddWithValue("@id", empId);
                        int pendingCount = (int)pendingCmd.ExecuteScalar();

                        if (pendingCount == 0)
                        {
                            lblResult.CssClass = "message message-error";
                            lblResult.Text = "This employee has no pending unpaid deductions to process.";
                            return;
                        }
                    }

                    using (SqlCommand cmd = new SqlCommand("Deduction_unpaid", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@employee_ID", empId);
                        cmd.ExecuteNonQuery();
                    }
                }

                lblResult.CssClass = "message message-success";
                lblResult.Text = "Unpaid leave deductions processed successfully.";
                txtEmpId.Text = "";
                LoadPendingDeductions();   
            }
            catch (Exception ex)
            {
                lblResult.CssClass = "message message-error";
                lblResult.Text = "Error: " + ex.Message;
            }
        }

    }
}
