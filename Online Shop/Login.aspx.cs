using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Shop
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUsername.Attributes["placeholder"] = "Username";
                txtPassword.Attributes["placeholder"] = "Password";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            if (!string.IsNullOrEmpty(username))
            {
             
                bool isAuthenticated = AuthenticateUser(username, txtPassword.Text.Trim());

                if (isAuthenticated)
                {
                 
                    Session["AuthenticatedUser"] = username;

                    
                    Response.Redirect($"Home.aspx?username={username}");
                }
                else
                {
                   
                }
            }
            else
            {
                
            }
        }

        private bool AuthenticateUser(string username, string password)
        {
            
            return true;
        }
    }
}