<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Online_Shop.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Orders</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff; 
            color: #000; 
            margin: 0;
            padding: 0;
            height: 100vh;
            position: relative;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #000;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            overflow: hidden;
        }

        .card {
            background-color: #000;
            border: 1px solid #fff;
            border-radius: 10px;
            margin-bottom: 20px;
            overflow: hidden;
        }

        .card-img-top {
            height: 300px;
            object-fit: cover;
        }

        .card-body {
            padding: 20px;
        }

        .card-title {
            color: #fff;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .card-text, .supplier, .total-price {
            color: #fff;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .btn-view-menu, .btn-remove, .btn-pay-gcash {
            background-color: #fff;
            border: none;
            border-radius: 5px;
            color: #000;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            margin-right: 10px;
        }

        .btn-view-menu:hover, .btn-remove:hover, .btn-pay-gcash:hover {
            background-color: #ccc;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Orders</h1>
            <div>
                <asp:Repeater ID="ProductRepeater" runat="server">
                    <ItemTemplate>
                        <div class="card mb-4">
                            <asp:Image runat="server" CssClass="card-img-top" ImageUrl='<%# Eval("ImageUrl") %>' />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Name") %></h5>
                                <p class="card-text">Price: ₱<%# Eval("Price", "{0:N0}") %></p> 
                                <asp:Button ID="RemoveButton" runat="server" Text="Remove" CssClass="btn-remove" OnClick="RemoveButton_Click" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div>
                <h2 class="total-price">Total Price: <asp:Label ID="TotalPriceLabel" runat="server"></asp:Label></h2>
            </div>
            <div>
                <asp:Button ID="ViewMenuButton" runat="server" Text="View Menu" OnClick="ViewMenuButton_Click" CssClass="btn btn-view-menu" />
                <asp:Button ID="PayGcashButton" runat="server" Text="Pay via Gcash" OnClick="PayGcashButton_Click" CssClass="btn-pay-gcash" />
                <asp:Button ID="AddMoreProductsButton" runat="server" Text="Add Products" OnClick="AddMoreProductsButton_Click" CssClass="btn btn-view-menu" />
            </div>
        </div>
    </form>
</body>
</html>
