using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Shop
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (Session["UploadedPicture"] != null)
                {
                  
                    string imagePath = Session["UploadedPicture"].ToString();
                    imgProfile.ImageUrl = imagePath;
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
           
            if (profilePicture.HasFile)
            {
                try
                {
                  
                    string fileExtension = Path.GetExtension(profilePicture.FileName).ToLower();
                
                    if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                    {
                    
                        string filePath = Server.MapPath("~/Images/") + Path.GetFileName(profilePicture.FileName);
                        profilePicture.SaveAs(filePath);
                      
                        Session["UploadedPicture"] = "~/Images/" + Path.GetFileName(profilePicture.FileName);
                   
                        imgProfile.ImageUrl = Session["UploadedPicture"].ToString();
                    }
                    else
                    {
                       
                        lblMessage.Text = "Only image files (.jpg, .jpeg, .png, .gif) are allowed!";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                lblMessage.Text = "Please select a file to upload.";
            }
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}