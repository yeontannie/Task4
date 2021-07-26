using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Security;
using System.Collections.Generic;

namespace WebApplication1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GVbind();
            }
        }

        public string StatusValue(string v)
        {
            if (v == "True")
            {
                return "Unblocked";
            }
            else if (v == "False")
            {
                return "Blocked";
            }
            return "";
        }

        protected void GVbind()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                SqlCommand getUsersData = new SqlCommand("SELECT [user_id], [username], [email], [dateofreg], [lastlogin], [status] FROM [users]", con);
                SqlDataReader sqlReader = getUsersData.ExecuteReader();
                if (sqlReader.HasRows == true)
                {
                    GridView1.DataSource = sqlReader;
                    GridView1.DataBind();
                }
                sqlReader.Close();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chkblock = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("chkEmp");
                if (chkblock.Checked)
                {
                    int id = Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
                    {
                        string sv = "False";
                        con.Open();
                        SqlCommand cmd = new SqlCommand($"update users set status=@s where user_id={id}", con);
                        cmd.Parameters.Add("@s", SqlDbType.Bit).Value = sv;                        
                        cmd.ExecuteNonQuery();

                        SqlCommand us = new SqlCommand($"select username from users where user_id = {id}", con);
                        string id_username = "";
                        SqlDataReader sqlRead = us.ExecuteReader();
                        while (sqlRead.Read())
                        {
                            id_username = Convert.ToString(sqlRead["username"]);
                        }
                        sqlRead.Close();

                        List<string> db = new List<string>();
                        SqlCommand getUsers = new SqlCommand("select username, status from users", con);
                        SqlDataReader sqlReader = null;

                        try
                        {
                            sqlReader = getUsers.ExecuteReader();
                            while (sqlReader.Read())
                            {
                                if (Convert.ToString(sqlReader["status"]) == "False")
                                {
                                    db.Add(Convert.ToString(sqlReader["username"]));
                                }
                            }                            
                        }
                        catch { }
                        finally
                        {
                            if (sqlReader != null)
                                sqlReader.Close();
                        }

                        foreach (var item in db)
                        {
                            if (id_username == item)
                            {
                                Response.Redirect("LogIn.aspx", false);
                                break;
                            }
                        }
                        con.Close();
                    }
                }
            }
            GVbind();
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chkunblock = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("chkEmp");
                if (chkunblock.Checked)
                {
                    int id = Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
                    {
                        string sv = "True";
                        con.Open();
                        SqlCommand cmd = new SqlCommand($"update users set status=@s where user_id={id}", con);
                        cmd.Parameters.Add("@s", SqlDbType.Bit).Value = sv;
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
             GVbind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox chkdelete = (CheckBox)GridView1.Rows[i].Cells[0].FindControl("chkEmp");
                if (chkdelete.Checked)
                {
                    int id = Convert.ToInt32(GridView1.Rows[i].Cells[1].Text);
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand($"delete from users where user_id = {id}", con);
                        cmd.ExecuteNonQuery();
                        GridView1.EditIndex = -1;
                        con.Close();
                    }
                }
            }
            GVbind();
        }

        protected void chkboxSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView1.HeaderRow.FindControl("chkboxSelectAll");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkEmp");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }
    }
}   