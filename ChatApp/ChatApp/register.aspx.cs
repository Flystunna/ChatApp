using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
namespace ChatApp
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            Page.Validate();
            if (Page.IsValid)
            {

                switch (IsUserAndEmailExists(Server.HtmlEncode(txtUname.Text), Server.HtmlEncode(txtemail.Text)))
                {
                    case 0:
                        AddUser();
                        break;
                    case -1:
                        infoLabel.Text = "<p style = 'color:red'>Both email & username already exists<p>";
                        break;
                    case -2:
                        infoLabel.Text = "<p style = 'color:red'>Email already exists<p>";
                        break;
                    case -3:
                        infoLabel.Text = "<p style = 'color:red'>Username already exists<p>";
                        break;
                    default:
                        infoLabel.Text = "<p style = 'color:red'>Something went wrong!! Please Try again later<p>";
                        break;
                }

            }
            else
            {
                btnRegister.Attributes.CssStyle.Add("cursor", "allowed");
            }
        }

        protected int IsUserAndEmailExists(string username, string email)
        {
            string stringconnection = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(stringconnection);

            try
            {
                string command_string = "ProcIsUserExist2 @Uname, @EId";
                SqlCommand sqlcom = new SqlCommand(command_string, sqlconn);
                sqlcom.Parameters.AddWithValue("@Uname", username);
                sqlcom.Parameters.AddWithValue("@Eid", email);

                sqlconn.Open();
                int n = Convert.ToInt32(sqlcom.ExecuteScalar());
                sqlconn.Close();
                return n;
            }
            catch (Exception ex)
            {
                infoLabel.Text = "<p style='color:red' > Error: " + ex.Message + "</p>";
                return -5;
            }
            finally
            {
                sqlconn.Close();
            }
        }

        protected void AddUser()
        {
            if (txtFName.Text != "" & txtUname.Text != "" && txtemail.Text != "" && txtAdd.Text != "" && txtPass.Text != "" && txtPass2.Text != "")
            {

                if (txtPass.Text == txtPass2.Text)
                {

                    string connectionString = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
                    SqlConnection sqlConnect = new SqlConnection(connectionString);

                    try
                    {
                        sqlConnect.Open();

                        string SQLCommand = "Insert into users2 (Fullname, Username, Email, Address, Password) values (@fullname, @username, @email, @address, @pass)";
                        SqlCommand sqlcommand = new SqlCommand(SQLCommand, sqlConnect);

                        sqlcommand.Parameters.AddWithValue("@fullname", Server.HtmlEncode(txtFName.Text));
                        sqlcommand.Parameters.AddWithValue("@username", Server.HtmlEncode(txtUname.Text));
                        sqlcommand.Parameters.AddWithValue("@email", Server.HtmlEncode(txtemail.Text));
                        sqlcommand.Parameters.AddWithValue("@address", Server.HtmlEncode(txtAdd.Text));
                        sqlcommand.Parameters.AddWithValue("@pass", Server.HtmlEncode(txtPass.Text));
                        sqlcommand.ExecuteNonQuery();
                        sqlConnect.Close();
                        infoLabel.Text = "Registration Successful";
                        Response.Redirect("login.aspx");
                    }
                    catch (Exception ex)
                    {
                        infoLabel.Text = "<p style='color:red' > Error: " + ex.Message + "</p>";
                    }
                    finally
                    {
                        sqlConnect.Close();
                    }
                }
                else
                {
                    infoLabel.Text = "Passwords do not match";
                }
            }

            else
            {
                infoLabel.Text = "All fields are mandatory";
            }
        }
    }
}