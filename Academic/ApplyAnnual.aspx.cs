using System;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace databasemile3.Academic
{
    public partial class ApplyAnnual : System.Web.UI.Page
    {
        string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmpID"] == null)
                Response.Redirect("~/Login.aspx");
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            int empId = (int)Session["EmpID"];

            if (!int.TryParse(txtReplacement.Text, out int replacementId))
            {
                lblApplyMsg.Text = "Invalid replacement employee ID.";
                return;
            }

            if (!DateTime.TryParse(txtStart.Text, out DateTime start) ||
                !DateTime.TryParse(txtEnd.Text, out DateTime end))
            {
                lblApplyMsg.Text = "Enter valid dates.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand("Submit_annual", conn))
            {
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@employee_ID", empId);
                cmd.Parameters.AddWithValue("@replacement_emp", replacementId);
                cmd.Parameters.AddWithValue("@start_date", start);
                cmd.Parameters.AddWithValue("@end_date", end);

                conn.Open();

                try
                {
                    cmd.ExecuteNonQuery();
                    lblApplyMsg.Text = "Annual leave submitted successfully!";
                }
                catch (Exception ex)
                {
                    lblApplyMsg.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}
