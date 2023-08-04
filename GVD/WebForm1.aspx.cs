using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GVD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connectionstring = "Data Source=CHRIS-PC;Initial Catalog=GVD;User ID=sa;Password=123456789";


        private DataTable GetDataFromDatabase()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                con.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM Table_7 where status='1'", con);
                sqlDa.Fill(dtbl);
            }
            return dtbl;
        }

        private void BindGridView()
        {
            DataTable dtbl = GetDataFromDatabase();

            if (dtbl.Rows.Count > 0)
            {
                gvDetails.DataSource = dtbl;
                gvDetails.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                gvDetails.DataSource = dtbl;
                gvDetails.DataBind();
                gvDetails.Rows[0].Cells.Clear();
                gvDetails.Rows[0].Cells.Add(new TableCell());
                gvDetails.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                gvDetails.Rows[0].Cells[0].Text = "No Data Found";
                gvDetails.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void gvDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDetails.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDetails.Rows[e.RowIndex];
            string filePath = gvDetails.DataKeys[e.RowIndex].Value.ToString();

            TextBox txtFirstName = row.FindControl("txtFirstName") as TextBox;
            TextBox txtLastName = row.FindControl("txtLastName") as TextBox;
            TextBox txtMail = row.FindControl("txtMail") as TextBox;
            TextBox txtYIS = row.FindControl("txtYIS") as TextBox;
            TextBox txtDes = row.FindControl("txtDes") as TextBox;

            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                con.Open();
                string query = "UPDATE Table_7 SET FirstName=@FirstName, LastName=@LastName, Age=@Age, Designation=@Designation, Remarks=@Remarks WHERE FilePath=@FilePath";
                SqlCommand sqlCmd = new SqlCommand(query, con);
                sqlCmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Age", txtMail.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Designation", txtYIS.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Remarks", txtDes.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@FilePath", filePath);

                sqlCmd.ExecuteNonQuery();
            }

            gvDetails.EditIndex = -1;
            BindGridView();
            Response.Write("<script>alert('Updated Successfully')</script>");
        }

        protected void gvDetails_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string filePath = gvDetails.DataKeys[e.RowIndex].Value.ToString();



            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                con.Open();
                string query = "UPDATE Table_7 SET status='2' WHERE FilePath=@FilePath ";
                SqlCommand sqlCmd = new SqlCommand(query, con);
                sqlCmd.Parameters.AddWithValue("@FilePath", filePath);

                sqlCmd.ExecuteNonQuery();
            }

            BindGridView();
            Response.Write("<script>alert('Deleted Successfully')</script>");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            LinkButton lnkbtn = sender as LinkButton;
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            string filePath = gvDetails.DataKeys[gvrow.RowIndex]["FilePath"].ToString();

            string fileName = Path.GetFileName(filePath);

            byte[] fileBytes = File.ReadAllBytes(filePath);

            Response.Clear();
            Response.Buffer = true;

            Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(fileBytes);
            Response.Flush();
            Response.End();
        }
    }
}