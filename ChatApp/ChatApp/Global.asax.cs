using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ChatApp
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs
            Response.Redirect("ErrorPage.aspx");
        }

        void onSession_Start(object sender, EventArgs e)
        {
            if (Session["UserSessionID"] == null)
                Session["UserSessionID"] = System.Guid.NewGuid().ToString();
        }

        protected void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.
            FormsAuthentication.SignOut();
            // Code that runs when an unhandled error occurs
            Response.Redirect("Login.aspx");
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}