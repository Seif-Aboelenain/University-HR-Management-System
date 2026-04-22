using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace databasemile3.Admin1
{
    public partial class AdminEmpPerDept : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDeptEmployeeCount();
            }
        }

        private void LoadDeptEmployeeCount()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["HRConn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    string query = "SELECT * FROM NoEmployeeDept";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    conn.Open();
                    da.Fill(dt);
                    conn.Close();

                    if (dt.Rows.Count > 0)
                    {
                        gvDeptCount.DataSource = dt;
                        gvDeptCount.DataBind();
                    }
                    else
                    {
                        lblError.Text = "No data found.";
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
