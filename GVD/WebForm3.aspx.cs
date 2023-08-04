using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GVD
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        

        

   
            protected void btnLogin_Click(object sender, EventArgs e)
            {
                string email = txtEmail.Text;
                string password = txtPassword.Text;

                // Authenticate email and password
                if (AuthenticateUser(email, password))
                {
                    // Redirect to the next page or perform any desired action
                    Response.Redirect("WebForm1.aspx");
                }
                else
                {
                // Display authentication error message
                
                    Response.Write("<script>alert('Invalid Email or Password') </script>");
                
                }
            }

            private bool AuthenticateUser(string email, string password)
            {
                // Replace the connection string with your actual database connection string
                string connectionString = "Data Source=CHRIS-PC;Initial Catalog=GVD;User ID=sa;Password=123456789";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM Table_7 WHERE Email = @Email AND Password = @Password";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    connection.Open();
                    int count = (int)command.ExecuteScalar();

                    return count > 0;
                }
            }
        }
    }

