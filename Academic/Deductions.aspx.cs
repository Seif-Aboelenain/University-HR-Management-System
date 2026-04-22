using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace databasemile3.Academic
{
    public partial class Deductions : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpID"] == null)
                Response.Redirect("~/Login.aspx");
        }

        protected void btnLoadDeductions_Click(object sender, EventArgs e)
        {
            int empId = (int)Session["EmpID"];
            int month = int.Parse(ddlMonth.SelectedValue);

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.Deductions_Attendance(@emp, @month)", conn))
            {
                cmd.Parameters.AddWithValue("@emp", empId);
                cmd.Parameters.AddWithValue("@month", month);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvDeductions.DataSource = dt;
                gvDeductions.DataBind();

                lblDedMsg.Text = dt.Rows.Count == 0
                    ? "No deductions found for that month."
                    : $"{dt.Rows.Count} deduction(s) loaded.";
            }
        }
    }
}
