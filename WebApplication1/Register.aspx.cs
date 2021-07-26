using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Data;

namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
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

            if (!db.Keys.Contains(TextBox1.Text))
            {
                SqlCommand regUser = new SqlCommand($"INSERT INTO [users] (username, password, email, dateofreg, lastlogin, status) " +
                    $"VALUES (@username, @password, @email, SYSDATETIME(), " +
                    $"SYSDATETIME(), @status)", sqlConnection);
                regUser.Parameters.AddWithValue("@username", TextBox1.Text);
                regUser.Parameters.AddWithValue("@password", TextBox4.Text);
                regUser.Parameters.AddWithValue("@email", TextBox3.Text);
                regUser.Parameters.Add("@status", SqlDbType.Bit).Value = "True";

                regUser.ExecuteNonQuery();
                Response.Redirect("Home.aspx", false);
            }
            else
            {
                string script = "alert(Username already taken!);";

                ClientScript.RegisterClientScriptBlock(this.GetType(), "MessageBox", script, true);
            }
        }
    }
}
