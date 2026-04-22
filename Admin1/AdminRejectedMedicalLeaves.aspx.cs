using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace databasemile3.Admin1
{
    public partial class AdminRejectedMedicalLeaves : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRejectedMedicalLeaves();
            }
        }

        private void LoadRejectedMedicalLeaves()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["HRConn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM allRejectedMedicals";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    conn.Open();
                    da.Fill(dt);
                    conn.Close();

                    if (dt.Rows.Count > 0)
                    {
                        gvRejectedMedical.DataSource = dt;
                        gvRejectedMedical.DataBind();
                    }
                    else
                    {
                        lblError.Text = "No rejected medical leaves found.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error: " + ex.Message;
            }
        }
    }
}
