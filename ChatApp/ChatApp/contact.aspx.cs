using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Net;

namespace ChatApp
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendMail()
        {
            var fromAddress = "Flystunna1@gmail.com";// Gmail Address from where you send the mail
            var toAddress = YourEmail.Text.ToString();
            const string fromPassword = "Stunna6882";//Password of your gmail address
            string subject = YourSubject.Text.ToString();
            string body = "From: " + YourName.Text + "\r\n";

            body += "Email: " + YourEmail.Text + "\r\n";

            body += "Subject: " + YourSubject.Text + "\r\n";

            body += "Question: \r\n" + Comments.Text + "\r\n";

            var smtp = new System.Net.Mail.SmtpClient();
            {
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            smtp.Send(fromAddress, toAddress, subject, body);
        }
        protected void txtSend_Click(object sender, EventArgs e)
        {
            if (YourName.Text != "" & YourSubject.Text != "" && YourEmail.Text != "" && Comments.Text != "")
            {
                try
                {
                    SendMail();
                    infoLabel.Text = "Message Sent";
                    infoLabel.Visible = true;
                    YourSubject.Text = "";
                    YourEmail.Text = "";
                    YourName.Text = "";
                    Comments.Text = "";
                }
                catch (Exception) { }
            }
            else
            {
                infoLabel.Text = "All fields are mandatory";
                infoLabel.Visible = true;
            }
        }
    }
}