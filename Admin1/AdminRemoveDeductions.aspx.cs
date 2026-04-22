using System;
using System.Data.SqlClient;
using System.Configuration;

namespace databasemile3.Admin1
{
    public partial class AdminRemoveDeductions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["HRConn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    SqlCommand cmd = new SqlCommand("Remove_Deductions", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();

                    lblMessage.Text = "✔ All deductions for resigned employees have been removed.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
