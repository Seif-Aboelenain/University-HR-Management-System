using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace databasemile3.Admin
{
    public partial class RemoveDayOff : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ResultLabel.Text = "";

            string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ToString();
            int empID;

            // Validate input
            if (!int.TryParse(EmployeeID.Text, out empID))
            {
                ResultLabel.Text = "<span class='dark-error'>Invalid Employee ID.</span>";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("Remove_DayOff", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@employee_ID", empID);

                conn.Open();
                cmd.ExecuteNonQuery();

                ResultLabel.Text = "<span class='dark-success'>Unattended day-off removed successfully!</span>";
            }
        }
    }
}