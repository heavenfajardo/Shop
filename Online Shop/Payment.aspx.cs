using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Shop
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCartProducts();
            }
        }

        private void LoadCartProducts()
        {
            List<Product> cartProducts = Session["CartProducts"] as List<Product>;
            if (cartProducts != null && cartProducts.Count > 0)
            {
                decimal totalPrice = CalculateTotalPrice(cartProducts);
                price.Text = "₱" + totalPrice.ToString("N2");
            }
            else
            {
                // Handle if cart is empty
            }
        }

        protected void payButton_Click(object sender, EventArgs e)
        {
            string customerName = this.customerName.Text;
            string gcashName = this.gcashName.Text;
            string gcashNumber = this.gcashNumber.Text;
            string referenceNumber = GenerateReferenceNumber();
            decimal amount = CalculateTotalPrice(Session["CartProducts"] as List<Product>);

            PaymentInfo paymentInfo = new PaymentInfo
            {
                Name = customerName,
                GcashName = gcashName,
                GcashNumber = gcashNumber,
                ReferenceNumber = referenceNumber,
                Amount = amount
            };

            Session["PaymentInfo"] = paymentInfo;

            Response.Redirect("Confirmation.aspx");
        }

        private string GenerateReferenceNumber()
        {
            return "REF" + DateTime.Now.ToString("yyyyMMddHHmmss");
        }

        protected void BackButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        private decimal CalculateTotalPrice(List<Product> products)
        {
            return products.Sum(p => p.Price);
        }

        private void ShowConfirmation(OrderDetails order)
        {
            string confirmationMessage = $"Customer Name: {order.CustomerName}<br />";
            confirmationMessage += $"Gcash Name: {order.GcashName}<br />";
            confirmationMessage += $"Gcash Number: {order.GcashNumber}<br />";
            confirmationMessage += $"Contact Number: {order.ContactNumber}<br />";
            confirmationMessage += $"Price: {order.Price:C}<br />";
            confirmationLabel.Text = confirmationMessage;
            containerDiv.Visible = false;
        }

        public class OrderDetails
        {
            public string CustomerName { get; set; }
            public string GcashName { get; set; }
            public string GcashNumber { get; set; }
            public string ContactNumber { get; set; }
            public decimal Price { get; set; }
        }
    }
}
