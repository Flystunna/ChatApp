using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace ChatApp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("chat.aspx");
            }

            btnLogin.Attributes.CssStyle.Add("cursor", "allowed");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            Page.Validate();
            if (Page.IsValid)
            {

                string connectionString = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ToString();
                SqlConnection sqlconn = new SqlConnection(connectionString);
                try
                {
                    string str = "Select COUNT(*) from users2 where Username = @uname AND Password = @pass";
                    SqlCommand comm = new SqlCommand(str, sqlconn);
                    comm.Parameters.AddWithValue("@uname", Server.HtmlEncode(txtUname.Text));
                    comm.Parameters.AddWithValue("@pass", Server.HtmlEncode(txtPass.Text));
                    sqlconn.Open();
                    int status = Convert.ToInt32(comm.ExecuteScalar());
                    sqlconn.Close();
                    if (status == 1)
                    {
                        string OnlineStatusStr = "update users2 set OnlineStatus = 1 where Username = @uname";
                        SqlCommand comm1 = new SqlCommand(OnlineStatusStr, sqlconn);
                        comm1.Parameters.AddWithValue("@uname", Server.HtmlEncode(txtUname.Text));
                        sqlconn.Open();
                        comm1.ExecuteNonQuery();
                        sqlconn.Close();
                        infoLabel.Text = "<p style='color:green' > Done!! </p>";
                        FormsAuthentication.RedirectFromLoginPage(Server.HtmlEncode(txtUname.Text), RememberMeCheckBox.Checked);
                        Response.Redirect("chat.aspx");

                    }
                    else
                    {
                        infoLabel.Text = "<p style='color:red' > Username or Password is Wrong!! </p>";
                    }

                }
                catch (Exception ex)
                {
                    infoLabel.Text = "<p style='color:red' > Error: " + ex.Message + "</p>";
                }
                finally
                {
                    sqlconn.Close();
                }
            }
        }
    }
}