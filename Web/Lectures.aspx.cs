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
    public partial class Lectures : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataReader reader;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LID"] == null)
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
                cmd.CommandText = "SELECT fullname,id FROM Lectures WHERE id=" + Session["LID"];
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
        protected void Mike_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
               // HiddenField HfID = (HiddenField)e.Row.FindControl("hf_id");
                HyperLink hy_1 = (HyperLink)e.Row.FindControl("HyperLinkM");
               // Session["MID"] = HfID.Value;
                hy_1.NavigateUrl="Degrees.aspx";
            }
        }

    }
}