using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace databasemile3.Academic
{
    public partial class LastMonthPayroll : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpID"] == null)
                Response.Redirect("~/Login.aspx");
        }

        protected void btnLoadPayroll_Click(object sender, EventArgs e)
        {
            int empId = (int)Session["EmpID"];

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Last_month_payroll(@emp)", conn))
            {
                cmd.Parameters.AddWithValue("@emp", empId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPayroll.DataSource = dt;
                gvPayroll.DataBind();

                lblPayrollMsg.Text = dt.Rows.Count == 0
                    ? "No payroll found for last month."
                    : $"{dt.Rows.Count} payroll record(s) loaded.";
            }
        }
    }
}
