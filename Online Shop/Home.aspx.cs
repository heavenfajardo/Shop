using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Shop
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["AuthenticatedUser"] == null)
            {
              
                Response.Redirect("Login.aspx");
            }
            else
            {
               
                string username = Session["AuthenticatedUser"].ToString();

               
                greetingLabel.Text = $"Hi {username}, Welcome to our Online Shop!";
            }
        }
    }
}