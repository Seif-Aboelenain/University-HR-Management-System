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
    public partial class UpdateEmploymentStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ResultLabel.Text = "";

            string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ToString();
            int empID;

            if (!int.TryParse(EmpID.Text, out empID))
            {
                ResultLabel.Text = "<span class='corp-error'>Invalid Employee ID.</span>";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("Update_Employment_Status", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Employee_ID", empID);

                conn.Open();
                cmd.ExecuteNonQuery();

                ResultLabel.Text = "<span class='corp-success'>Employee status updated successfully!</span>";
            }
        }
    }
}