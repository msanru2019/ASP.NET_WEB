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
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection();
            cmd = new SqlCommand();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;

        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            con.Open();
            cmd.CommandText = "SELECT * FROM Admin WHERE username=@username AND pass=@pass";
            cmd.Parameters.AddWithValue("@username", tb_username.Text);
            cmd.Parameters.AddWithValue("@pass", tb_pass.Text);
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                Session["AdminID"] = reader[0].ToString();
                reader.Close();
                Response.Redirect("Admin.aspx");
            }
            else
            {
                reader.Close();
                cmd.CommandText = "SELECT * FROM Lectures WHERE username=@usernameLec AND pass=@passLec";
                cmd.Parameters.AddWithValue("@usernameLec", tb_username.Text);
                cmd.Parameters.AddWithValue("@passLec", tb_pass.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Session["LID"] = reader[0].ToString();
                    reader.Close();
                    Response.Redirect("Lectures.aspx");
                }
                else
                {
                    reader.Close();
                    cmd.CommandText = "SELECT * FROM Students WHERE username=@usernameS AND pass=@passS AND active='true'";
                    cmd.Parameters.AddWithValue("@usernameS", tb_username.Text);
                    cmd.Parameters.AddWithValue("@passS", tb_pass.Text);
                    reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        Session["SID"] = reader[0].ToString();
                        reader.Close();
                        Response.Redirect("Students.aspx");
                    }
                    else
                    {
                        reader.Close();
                        lb_msg.Text = "Incorrect username or password !";
                    }
                }
                con.Close();
            }


        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            if(tb_usernameS.Text.TrimStart().TrimEnd() == "" || tb_passS.Text == "" || tb_fullname.Text.TrimStart().TrimEnd() == "")
            {
                lb_msg2.Text = "You are required to fill all fields";
            }
            con.Open();
            cmd.CommandText = "SELECT * FROM Students WHERE username=@username AND pass=@pass";
            cmd.Parameters.AddWithValue("@username", tb_usernameS.Text);
            cmd.Parameters.AddWithValue("@pass", tb_passS.Text);
            reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                
                reader.Close();
                lb_msg2.Text = "Sorry bro this username and password already exists!";
            }
            else
            {
                reader.Close();
                cmd.CommandText = "INSERT INTO Students (username,pass,fullname,active) VALUES (@username2,@pass2,@fullname, 'false')";
                cmd.Parameters.AddWithValue("@username2", tb_usernameS.Text);
                cmd.Parameters.AddWithValue("@pass2", tb_passS.Text);
                cmd.Parameters.AddWithValue("@fullname", tb_fullname.Text);
                cmd.ExecuteNonQuery();
                lb_msg2.Text = "Successfully added to database";
                
            }
            con.Close();
        }
    }
}