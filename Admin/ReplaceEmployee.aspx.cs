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
    public partial class ReplaceEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ResultLabel.Text = "";

            string connStr = WebConfigurationManager.ConnectionStrings["databasemile3"].ToString();

            int emp1, emp2;
            DateTime fromDate, toDate;

            // Validate integers
            if (!int.TryParse(Emp1.Text, out emp1) ||
                !int.TryParse(Emp2.Text, out emp2))
            {
                ResultLabel.Text = "<span class='pastel-error'>Employee IDs must be valid numbers.</span>";
                return;
            }

            // Validate dates
            if (!DateTime.TryParse(FromDate.Text, out fromDate) ||
                !DateTime.TryParse(ToDate.Text, out toDate))
            {
                ResultLabel.Text = "<span class='pastel-error'>Dates must be valid (yyyy-mm-dd).</span>";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("Replace_employee", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Emp1_ID", emp1);
                cmd.Parameters.AddWithValue("@Emp2_ID", emp2);
                cmd.Parameters.AddWithValue("@from_date", fromDate);
                cmd.Parameters.AddWithValue("@to_date", toDate);

                conn.Open();
                cmd.ExecuteNonQuery();

                ResultLabel.Text = "<span class='pastel-success'>Replacement recorded successfully!</span>";
            }
        }
    }
}