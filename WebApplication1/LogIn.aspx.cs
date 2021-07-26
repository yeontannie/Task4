using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;

namespace WebApplication1
{
    public partial class LogIn : System.Web.UI.Page
    {
        private SqlConnection sqlConnection = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            sqlConnection = new SqlConnection(connectionString);
            sqlConnection.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Dictionary<string, string> db = new Dictionary<string, string>();
            SqlCommand getUsersData = new SqlCommand("select username, password from users", sqlConnection);
            SqlDataReader sqlReader = null;

            try
            {
                sqlReader = getUsersData.ExecuteReader();
                while (sqlReader.Read()) 
                {
                    db.Add(Convert.ToString(sqlReader["username"]), Convert.ToString(sqlReader["password"]));
                }
            }
            catch { }
            finally
            {
                if (sqlReader != null)
                    sqlReader.Close();
            }

            if(TextBox2.Text == db[TextBox1.Text])
            {
                string st = "";
                SqlCommand bl = new SqlCommand($"select status from users where username = @username", sqlConnection);
                bl.Parameters.AddWithValue("@username", TextBox1.Text);
                SqlDataReader sqlRead = bl.ExecuteReader();
                while(sqlRead.Read())
                {
                    st = Convert.ToString(sqlRead["status"]);
                }
                sqlRead.Close();

                if (st == "True")
                {
                    SqlCommand new_login = new SqlCommand("update users set lastlogin = SYSDATETIME() where username = @username", sqlConnection);
                    new_login.Parameters.AddWithValue("@username", TextBox1.Text);
                    new_login.ExecuteNonQuery();
                    Response.Redirect("Home.aspx", false);
                }
                else
                    Response.Redirect("LogIn.aspx", false);
            }
            else
            {
                Response.Redirect("LogIn.aspx", false);
            }
        }
    }
}