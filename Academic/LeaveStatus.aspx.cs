using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace databasemile3.Academic
{
    public partial class LeaveStatus : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpID"] == null)
                Response.Redirect("~/Login.aspx");
        }

        protected void btnLoadStatus_Click(object sender, EventArgs e)
        {
            int empId = (int)Session["EmpID"];

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.status_leaves(@emp)", conn))
            {
                cmd.Parameters.AddWithValue("@emp", empId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvLeaves.DataSource = dt;
                gvLeaves.DataBind();

                lblStatusMsg.Text = dt.Rows.Count == 0
                    ? "No leave requests submitted this month."
                    : $"{dt.Rows.Count} leave request(s) found.";
            }
        }
    }
}
