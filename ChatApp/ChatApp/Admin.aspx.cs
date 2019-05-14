using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChatApp
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated || !Server.HtmlEncode(User.Identity.Name).Equals("Admin", StringComparison.OrdinalIgnoreCase))
            {
                form1.Visible = true;
                Response.Redirect("ErrorPage.aspx");
            }
        }
    }
}