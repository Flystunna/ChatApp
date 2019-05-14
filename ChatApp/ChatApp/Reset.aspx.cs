using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;

namespace ChatApp
{
    public partial class Reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtSend_Click(object sender, EventArgs e)
        {
            if (txtEmailId.Text != "")
            {

                string CS = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
                using (SqlConnection sqlconn = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spReset2", sqlconn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter paraEmail = new SqlParameter("@Email", txtEmailId.Text);
                    cmd.Parameters.Add(paraEmail);
                    sqlconn.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        if (Convert.ToBoolean(rdr["ReturnCode"]))
                        {
                            SendPasswordResetEmail(rdr["Email"].ToString(), txtEmailId.Text, rdr["UniqueId"].ToString());
                            infoLabel.Text = "An Email has been sent";

                        }
                        else {
                            infoLabel.Text = "An error occurred";
                        }
                    }

                }

            }

            else
            {
                infoLabel.Text = "<p style='color:red' > All Fields are mandatory </p>";
            }

         }
        private void SendPasswordResetEmail(string ToEmail, string Username, string UniqueId)
        {
            MailMessage mailMessage = new MailMessage("flystunna1@gmail.com", ToEmail);

            StringBuilder sbEmailBody = new StringBuilder();
            sbEmailBody.Append("Dear  " +  Username + ",<br/><br/>");
            sbEmailBody.Append("Please click on this link");
            sbEmailBody.Append(" http://localhost:39116/ResetPage.aspx?uid=" + UniqueId);
            sbEmailBody.Append("<br/><br/>");

            mailMessage.IsBodyHtml = true;
            mailMessage.Body = sbEmailBody.ToString();
            mailMessage.Subject = "Reset Password";
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "Flystunna1@gmail.com",
                Password = "Stunna6882"

            };
            smtpClient.EnableSsl = true;
            smtpClient.Send(mailMessage);
        }


      }
}