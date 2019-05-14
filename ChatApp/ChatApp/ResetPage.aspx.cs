using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Text;
using System.Configuration;

namespace ChatApp
{
    public partial class ResetPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPasswordResetValid())
                {
                    infoLabel.ForeColor = System.Drawing.Color.Red;
                    infoLabel.Text = "Password Link Invalid";
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (txtNewPassword.Text != "" & txtConfirmNewPassword.Text != "")
            {
                if (txtNewPassword.Text == txtConfirmNewPassword.Text)
                {
                    if (ChangeUserPassword())
                    {
                        infoLabel.Text = "Password Changed Succesfully";
                    }
                    else
                    {
                        infoLabel.ForeColor = System.Drawing.Color.Red;
                        infoLabel.Text = "Password Reset Link has expired";
                    }
                }
                else 
                {
                    infoLabel.ForeColor = System.Drawing.Color.Red;
                    infoLabel.Text = "Passwords do not match";
                }
            }
            else
            {
                infoLabel.ForeColor = System.Drawing.Color.Red;
                infoLabel.Text = "<h1> All Fields are mandatory </h1>";
            }
        }

        private bool ExecuteSP(string SPName, List<SqlParameter> SPParameters)
        {
            string CS = ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(SPName, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                foreach (SqlParameter parameter in SPParameters)
                {
                    cmd.Parameters.Add(parameter);
                }
                
                return
                    Convert.ToBoolean(cmd.ExecuteScalar());
            }
        }
        private bool IsPasswordResetValid()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                new SqlParameter()
                {
                    ParameterName = "@GUID",
                    Value = Request.QueryString["uid"],
                }
            };
            return
                ExecuteSP("spIsPassValid", paramList);
        }
        private bool ChangeUserPassword()
        {
            List<SqlParameter> paramList = new List<SqlParameter>()
            {
                 new SqlParameter()
                {
                    ParameterName = "@GUID",
                    Value = Request.QueryString["uid"],
                },
                new SqlParameter()
                {
                    ParameterName = "@Password",
                    Value = txtNewPassword.Text
                }
            };

            return ExecuteSP("spChangePassword", paramList);
        }
    }
}