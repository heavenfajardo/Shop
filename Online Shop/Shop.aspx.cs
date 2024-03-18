using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Shop
{
    public partial class Shop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;
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

        protected void redirectToOrders(object sender, EventArgs e)
        {


        }

        protected void btnViewCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}