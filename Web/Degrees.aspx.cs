using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Web
{
    public partial class Degrees : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["LID"] == null || Session["MID"] == null)
            {
                Response.Redirect("Degrees.aspx");
            }
            else
            {
                con = new SqlConnection();
                cmd = new SqlCommand();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                con.Open();
                cmd.CommandText = "SELECT MName FROM Materials WHERE id=" + Request.QueryString["id"];
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Page.Title = reader[0].ToString();
                    reader.Close();


                }
                else
                    reader.Close();
                con.Close();
            
            }
           
        }

        protected void btn_insertDegree_Click(object sender, EventArgs e)
        {
            if (tb_degree.Text.TrimStart().TrimEnd() == "" )
            {
                lb_msg.Text = "You are required to fill all fields";
            }
            else
            {


                con.Open();
                cmd.CommandText = "SELECT id FROM Degrees WHERE SID=@SID AND MID=@MID";
                cmd.Parameters.AddWithValue("@SID", ddl_Sname.SelectedValue);
                cmd.Parameters.AddWithValue("@MID", Request.QueryString["id"]);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    reader.Close();
                    lb_msg.Text = "Sorry bro ";
                }
                else
                {
                    reader.Close();
                    cmd.CommandText = "INSERT INTO Degrees (SID,MID,notes,deg) VALUES (@SID4,@MID4,@notes4,@deg4)";
                    cmd.Parameters.AddWithValue("@SID4", ddl_Sname.SelectedValue);
                    cmd.Parameters.AddWithValue("@MID4", Request.QueryString["id"]);
                    cmd.Parameters.AddWithValue("@notes4", tb_notes.Text);
                    cmd.Parameters.AddWithValue("@deg4", tb_degree.Text);
                    cmd.ExecuteNonQuery();
                    lb_msg.Text = "Successfully added to database";
                    GridView_Degrees.DataBind();

                }
                con.Close();
            }
        }
    }
}