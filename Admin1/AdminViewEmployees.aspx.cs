using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using WebGrease.Activities;

namespace databasemile3.Admin1
{
    public partial class AdminViewEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployeeProfiles();
            }
        }

        private void LoadEmployeeProfiles()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["HRConn"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {

                    string query = @"
                                SELECT *
                                FROM allEmployeeProfiles
                    WHERE employee_ID NOT IN (SELECT Emp1_ID FROM Employee_Replace_Employee)
                       ";


                    SqlCommand cmd = new SqlCommand(query, conn);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    conn.Open();
                    da.Fill(dt);
                    conn.Close();

                    if (dt.Rows.Count > 0)
                    {
                        gvEmployees.DataSource = dt;
                        gvEmployees.DataBind();
                    }
                    else
                    {
                        lblError.Text = "No employee profiles found.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error loading employee profiles: " + ex.Message;
            }
        }
    }
}
