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
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                con = new SqlConnection();
                cmd = new SqlCommand();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                con.Open();
                cmd.CommandText = "SELECT fullname,id FROM Admin WHERE id=" +Session["AdminID"];
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

        protected void btn_insertLec_Click(object sender, EventArgs e)
        {
            if (tb_usernameLec.Text.TrimStart().TrimEnd() == "" || tb_passLec.Text == "" || tb_fullname.Text.TrimStart().TrimEnd() == "")
            {
                lb_msg.Text = "You are required to fill all fields";
            }
            else
            {


                con.Open();
                cmd.CommandText = "SELECT * FROM Lectures WHERE username=@username AND pass=@pass";
                cmd.Parameters.AddWithValue("@username", tb_usernameLec.Text);
                cmd.Parameters.AddWithValue("@pass", tb_passLec.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    reader.Close();
                    lb_msg.Text = "Sorry bro this username and password already exists!";
                }
                else
                {
                    reader.Close();
                    cmd.CommandText = "INSERT INTO Lectures (username,pass,fullname,notes,active) VALUES (@username2,@pass2,@fullname,@notes, 'false')";
                    cmd.Parameters.AddWithValue("@username2", tb_usernameLec.Text);
                    cmd.Parameters.AddWithValue("@pass2", tb_passLec.Text);
                    cmd.Parameters.AddWithValue("@fullname", tb_fullname.Text);
                    cmd.Parameters.AddWithValue("@notes", tb_notes.Text);
                    cmd.ExecuteNonQuery();
                    lb_msg.Text = "Successfully added to database";
                    GridView_Lectures.DataBind();

                }
                con.Close();
            } 
        }

        protected void LinkButton_logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Default.aspx");
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetMName(string preText, int count)
        {
            using(SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
                using (SqlCommand com = new SqlCommand())
                {
                    com.CommandText = "SELECT MName FROM Materials WHERE MName LIKE '%' + @Search + '%'";
                    com.Parameters.AddWithValue("@search", preText);
                    com.Connection = con;
                    con.Open();
                    List<string> GetMNames = new List<string>();
                    using (SqlDataReader sdr = com.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            GetMNames.Add(sdr["MName"].ToString());
                        }
                    }
                    con.Close();
                    return GetMNames;
                }
            }
        }

        protected void btn_insertM_Click(object sender, EventArgs e)
        {
            if (tb_Mname.Text.TrimStart().TrimEnd() == "")
            {
                lb_msgM.Text = "You are required to fill Material textbox";
            }
            else
            {
                con.Open();
                cmd.CommandText = "SELECT * FROM Materials WHERE MName=@MName";
                cmd.Parameters.AddWithValue("@MName", tb_Mname.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {

                    reader.Close();
                    lb_msg.Text = "Sorry bro material name already exists!";
                }
                else
                {
                    reader.Close();
                    cmd.CommandText = "INSERT INTO Materials (MName,LID,notes) VALUES (@MName3,@LID,@notes3)";
                    cmd.Parameters.AddWithValue("@MName3", tb_Mname.Text);
                    cmd.Parameters.AddWithValue("@LID", ddl_Lec.SelectedValue);
                    cmd.Parameters.AddWithValue("@notes3", tb_MNotes.Text);
                    cmd.ExecuteNonQuery();
                    lb_msgM.Text = "The name of the Material is now added to database";
                   GridView_Materials.DataBind();

                }
                con.Close();
            }
        }
    }
      
}

