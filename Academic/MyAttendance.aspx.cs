using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace databasemile3.Academic
{
    public partial class MyAttendance : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpID"] == null)
                Response.Redirect("~/Login.aspx");
        }

        protected void btnLoadAttendance_Click(object sender, EventArgs e)
        {
            int empId = (int)Session["EmpID"];

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.MyAttendance(@emp)", conn))
            {
                cmd.Parameters.AddWithValue("@emp", empId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAttendance.DataSource = dt;
                gvAttendance.DataBind();

                lblAttendanceMsg.Text = dt.Rows.Count == 0
                    ? "No attendance records for this month."
                    : $"{dt.Rows.Count} record(s) loaded.";
            }
        }
    }
}
