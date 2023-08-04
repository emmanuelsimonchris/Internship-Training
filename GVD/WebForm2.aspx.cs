using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.NetworkInformation;
using System.Diagnostics.Eventing.Reader;

namespace GVD
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            {
                if (FileUpload1.HasFile)
                {

                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    string fileExtension = Path.GetExtension(fileName);
                    if (fileExtension.ToLower() == ".pdf")
                    {
                        string folderPath = Server.MapPath("~/Photos.File/");
                        Directory.CreateDirectory(folderPath);
                        string filePath = Path.Combine(folderPath, fileName);

                        FileUpload1.SaveAs(filePath);


                        string FirstName = txtFirstName12.Text;
                        string LastName = txtLastName12.Text;
                        string Age = txtAge12.Text;
                        string Designation = txtDes12.Text;
                        string Email = txtemail.Text;
                        string Password = txtPassword.Text;
                        string connectionString = "Data Source=Chris-PC;Initial Catalog=GVD;User ID=sa;Password=123456789";
                        using (SqlConnection connection = new SqlConnection(connectionString))
                        {
                            connection.Open();
                            string query = "INSERT INTO Table_7 (FirstName, LastName, Age, Designation,Email, Password, FilePath, status) VALUES (@FirstName, @LastName, @Age, @Designation,@Email, @Password, @FilePath, 1)";
                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                command.Parameters.AddWithValue("@FirstName", FirstName);
                                command.Parameters.AddWithValue("@LastName", LastName);
                                command.Parameters.AddWithValue("@Age", Age);
                                command.Parameters.AddWithValue("@Designation", Designation);
                                command.Parameters.AddWithValue("@Email", Email);
                                command.Parameters.AddWithValue("@Password", Password);
                                command.Parameters.AddWithValue("@FilePath", filePath);
                                command.ExecuteNonQuery();

                            }
                        }
                        Response.Write("<script>alert('Details Uploaded Succesfully!')</script>");
                        Response.Redirect("WebForm3.aspx");
                    }
                    else
                    {
                        Response.Write("<script>alert('Please Upload a PDF File Only')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please Select a File to Upload')</script>");
                }
            }
        }
    }
}





