using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace databasemile3.Academic
{
    public partial class MyPerformance : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpID"] == null)
                Response.Redirect("~/Login.aspx");

            lblEmp.Text = "Employee ID: " + Session["EmpID"].ToString();
        }

        protected void btnLoadPerf_Click(object sender, EventArgs e)
        {
            int empId = (int)Session["EmpID"];
            string semester = ddlSemester.SelectedValue;

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM dbo.MyPerformance(@emp, @sem)", conn))
            {
                cmd.Parameters.AddWithValue("@emp", empId);
                cmd.Parameters.AddWithValue("@sem", semester);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPerf.DataSource = dt;
                gvPerf.DataBind();

                lblPerfMsg.Text = dt.Rows.Count == 0
                    ? "No performance records for that semester."
                    : $"{dt.Rows.Count} record(s) loaded.";
            }
        }
    }
}
