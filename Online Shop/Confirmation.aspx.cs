using Online_Shop;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Online_Shop.Payment;

namespace Online_Shop
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CartProducts"] != null)
                {
                    List<Product> orderHistory = (List<Product>)Session["CartProducts"];
                    OrderHistoryRepeater.DataSource = orderHistory;
                    OrderHistoryRepeater.DataBind();
                }

                if (Session["PaymentInfo"] != null)
                {
                    PaymentInfo paymentInfo = (PaymentInfo)Session["PaymentInfo"];
                    lblName.Text = paymentInfo.Name;
                    lblGcashNumber.Text = paymentInfo.GcashNumber;
                    lblGcashName.Text = paymentInfo.GcashName;
                    lblReferenceNumber.Text = paymentInfo.ReferenceNumber;
                    lblAmount.Text = "₱" + paymentInfo.Amount.ToString("N2");
                }
            }
        }
    }
}
public class PaymentInfo
{
    public string Name { get; set; }
    public string GcashNumber { get; set; }
    public string GcashName { get; set; }
    public string ReferenceNumber { get; set; }
    public decimal Amount { get; set; }
   
}
