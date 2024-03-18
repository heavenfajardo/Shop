using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Shop
{
    public partial class Feedbacks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
              
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
      
            if (string.IsNullOrWhiteSpace(txtName.Text) || string.IsNullOrWhiteSpace(txtContact.Text) || string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                lblFeedbackMessage.Text = "Please fill out all fields.";
                lblFeedbackMessage.Visible = true;
                return;
            }

            
            lblFeedbackMessage.Text = "Thank you for your feedback!";
            lblFeedbackMessage.Visible = true;

            
            txtName.Text = "";
            txtContact.Text = "";
            txtMessage.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}