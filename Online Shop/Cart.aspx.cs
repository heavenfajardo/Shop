using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Shop
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        protected void LoadOrders()
        {
            List<Product> cartProducts = Session["CartProducts"] as List<Product>;

            if (cartProducts != null && cartProducts.Count > 0)
            {
                ProductRepeater.DataSource = cartProducts;
                ProductRepeater.DataBind();

                decimal totalPrice = CalculateTotalPrice(cartProducts);
                TotalPriceLabel.Text = "Total Price: ₱" + totalPrice.ToString("N2");
            }
            else
            {
               
                TotalPriceLabel.Text = "Your cart is empty.";
                ProductRepeater.Visible = false; 
            }
        }

        protected void PayGcashButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        private decimal CalculateTotalPrice(List<Product> products)
        {
            if (products == null)
            {
                return 0; 
            }
            else
            {
                return products.Sum(p => p.Price); 
            }
        }

        protected void ViewMenuButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");
        }

        protected void RemoveButton_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            RepeaterItem item = (RepeaterItem)btn.NamingContainer;
            int index = item.ItemIndex;

            List<Product> cartProducts = Session["CartProducts"] as List<Product>;
            if (cartProducts != null && cartProducts.Count > index)
            {
                cartProducts.RemoveAt(index);
                Session["CartProducts"] = cartProducts;

               
                Response.Redirect(Request.RawUrl); 
            }
        }


        protected void AddToCart_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            string productName = button.CommandArgument;

            Product product = GetProductDetailsByName(productName);

            List<Product> cartProducts = Session["CartProducts"] as List<Product>;
            if (cartProducts == null)
            {
                cartProducts = new List<Product>();
            }
            cartProducts.Add(product);
            Session["CartProducts"] = cartProducts;

            Response.Redirect("Cart.aspx");
        }

        protected void AddMoreProductsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Shop.aspx");
        }

        private string GetImageUrlForProduct(string productName)
        {
            switch (productName.ToLower())
            {
                case "men shirt":
                    return "/images/tshirt_men.jpg";
                case "men loose jeans":
                    return "/images/loose_jeans.jpg";
                case "men shirt grey":
                    return "/images/shirt_grey.jpg";
                case "women loose jeans":
                    return "/images/loose_jeans.jpg";
                case "shirt":
                    return "/images/women.jpg";
                case "sheath dress":
                    return "/images/women1.jpg";
                default:
                    return "";
            }
        }

        private Product GetProductDetailsByName(string productName)
        {
            string imageUrl = GetImageUrlForProduct(productName);
            decimal price = GetPriceForProduct(productName);

            return new Product
            {
                Name = productName,
                Price = price,
                ImageUrl = imageUrl
            };
        }

        private decimal GetPriceForProduct(string productName)
        {
            switch (productName.ToLower())
            {
                case "men shirt":
                    return 1200m; 
                case "men loose jeans":
                    return 1800m; 
                case "men shirt grey":
                    return 1500m; 
                case "women loose jeans":
                    return 800m;  
                case "shirt":
                    return 300m;  
                case "sheath dress":
                    return 550m;  
                default:
                    return 0;
            }
        }
    }

    public class Product
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string ImageUrl { get; set; }
    }
}
