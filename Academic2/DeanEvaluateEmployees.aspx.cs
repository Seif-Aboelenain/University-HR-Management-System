using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace databasemile3.Academic2
{
    public partial class DeanEvaluateEmployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadEmployeesFromSameDepartment();
            }
        }

        private void LoadEmployeesFromSameDepartment()
        {
            // Must be logged in
            if (Session["EmpID"] == null)
            {
                lblMessage.Text = "You must log in as a Dean before evaluating employees.";
                return;
            }

            int deanId = Convert.ToInt32(Session["EmpID"]);
            string connStr = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    // 1) Get dean's department
                    string deptName = null;

                    using (SqlCommand cmdDept = new SqlCommand(
                        "SELECT dept_name FROM Employee WHERE employee_id = @deanId", conn))
                    {
                        cmdDept.Parameters.AddWithValue("@deanId", deanId);
                        object deptObj = cmdDept.ExecuteScalar();

                        if (deptObj == null || deptObj == DBNull.Value)
                        {
                            lblMessage.Text = "Could not find your department information.";
                            ddlEmployees.Items.Clear();
                            return;
                        }

                        deptName = deptObj.ToString();
                    }

                    // 2) Load employees in same department (excluding the dean)
                    using (SqlCommand cmdEmp = new SqlCommand(
                        "SELECT employee_id, first_name + ' ' + last_name AS full_name " +
                        "FROM Employee WHERE dept_name = @dept AND employee_id <> @deanId", conn))
                    {
                        cmdEmp.Parameters.AddWithValue("@dept", deptName);
                        cmdEmp.Parameters.AddWithValue("@deanId", deanId);

                        using (SqlDataReader reader = cmdEmp.ExecuteReader())
                        {
                            ddlEmployees.Items.Clear();

                            if (!reader.HasRows)
                            {
                                lblMessage.Text = "There are no other employees in your department to evaluate.";
                                return;
                            }

                            while (reader.Read())
                            {
                                string name = reader["full_name"].ToString();
                                string id = reader["employee_id"].ToString();
                                ddlEmployees.Items.Add(
                                    new System.Web.UI.WebControls.ListItem(name, id));
                            }
                        }
                    }

                    lblMessage.Text = string.Empty;
                }
            }
            catch (SqlException)
            {
                // Clean message – no technical details
                lblMessage.Text = "Could not load employees from your department. Please try again later.";
            }
            catch (Exception)
            {
                lblMessage.Text = "An unexpected error occurred while loading employees.";
            }
        }

        protected void btnSubmitEvaluation_Click(object sender, EventArgs e)
        {
            // Check login again
            if (Session["EmpID"] == null)
            {
                lblMessage.Text = "You must log in as a Dean before submitting an evaluation.";
                return;
            }

            if (ddlEmployees.SelectedItem == null)
            {
                lblMessage.Text = "Please select an employee to evaluate.";
                return;
            }

            int employeeId = Convert.ToInt32(ddlEmployees.SelectedValue);

            // Validate rating
            int rating;
            if (!int.TryParse(txtRating.Text.Trim(), out rating))
            {
                lblMessage.Text = "Rating must be a valid number.";
                return;
            }

            // Extra safety so we never hit the CHECK constraint
            if (rating < 1 || rating > 10)
            {
                lblMessage.Text = "Rating must be between 1 and 10.";
                return;
            }

            string comment = txtComment.Text.Trim();
            if (string.IsNullOrEmpty(comment))
            {
                lblMessage.Text = "Please enter a comment for the evaluation.";
                return;
            }

            string semester = txtSemester.Text.Trim();
            if (semester.Length != 2 && semester.Length != 3)
            {
                lblMessage.Text = "Please enter a valid semester code (e.g. W25).";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["databasemile3"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand("Dean_andHR_Evaluation", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@employee_ID", employeeId);
                    cmd.Parameters.AddWithValue("@rating", rating);
                    cmd.Parameters.AddWithValue("@comment", comment);
                    cmd.Parameters.AddWithValue("@semester", semester);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Evaluation has been submitted successfully.";
            }
            catch (SqlException ex)
            {
                // If somehow the CHECK constraint still fires, show a clean message
                if (ex.Message.Contains("CK__Performan") || ex.Message.Contains("rating"))
                {
                    lblMessage.Text = "Rating must be between 1 and 5.";
                }
                else
                {
                    lblMessage.Text = "Could not submit the evaluation. Please review your input.";
                }
            }
            catch (Exception)
            {
                lblMessage.Text = "An unexpected error occurred while submitting the evaluation.";
            }
        }
    }
}
