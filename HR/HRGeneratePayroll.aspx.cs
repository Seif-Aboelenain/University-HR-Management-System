using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace databasemile3.HR
{
    public partial class HRGeneratePayroll : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime now = DateTime.Today;
                DateTime first = new DateTime(now.Year, now.Month, 1);
                DateTime last = first.AddMonths(1).AddDays(-1);

                txtFromDate.Text = first.ToString("yyyy-MM-dd");
                txtToDate.Text = last.ToString("yyyy-MM-dd");
            }
        }

        protected void  Generate_Click(object sender, EventArgs e)
        {
            lblResult.Text = "";
            gvPayroll.DataSource = null;
            gvPayroll.DataBind();

            int empId;
            if (!int.TryParse(txtEmpId.Text.Trim(), out empId))
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Enter a valid numeric Employee ID.";
                return;
            }

            DateTime fromDate, toDate;
            if (!DateTime.TryParse(txtFromDate.Text.Trim(), out fromDate) ||
                !DateTime.TryParse(txtToDate.Text.Trim(), out toDate))
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Enter valid dates in yyyy-mm-dd format.";
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(cs))
                {
                    conn.Open();

                    using (SqlCommand cmd = new SqlCommand("Add_Payroll", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@employee_ID", empId);
                        cmd.Parameters.AddWithValue("@from", fromDate);
                        cmd.Parameters.AddWithValue("@to", toDate);
                        cmd.ExecuteNonQuery();
                    }

                    using (SqlCommand cmd2 = new SqlCommand(@"
                        SELECT TOP 5 payment_date, final_salary_amount, from_date, to_date, comments
                        FROM Payroll
                        WHERE emp_ID = @id
                        ORDER BY payment_date DESC;", conn))
                    {
                        cmd2.Parameters.AddWithValue("@id", empId);
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd2))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            gvPayroll.DataSource = dt;
                            gvPayroll.DataBind();
                        }
                    }
                }

                lblResult.ForeColor = System.Drawing.Color.Green;
                lblResult.Text = "Payroll generated successfully.";
            }
            catch (Exception ex)
            {
                lblResult.ForeColor = System.Drawing.Color.Red;
                lblResult.Text = "Error: " + ex.Message;
            }
        }
    }
}
