<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Online_Shop.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2; 
            color: #000; 
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px; 
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            overflow: hidden;
        }

        .card {
            background-color: rgba(0, 0, 0, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.1);
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
            color: #ffa31a;
            font-size: 20px;
            margin-bottom: 10px;
        }

        .card-text {
            color: #fff;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .total-price {
            color: #fff;
            font-size: 24px;
            margin-top: 20px;
        }

        .btn-view-menu {
            background-color: #fff;
            border: 2px solid #000;
            border-radius: 5px;
            color: #000;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
            margin-right: 10px;
        }

        .btn-view-menu:hover {
            background-color: #000;
            color: #fff;
        }

        .btn-remove {
            background-color: #fff;
            border: 2px solid #000;
            border-radius: 5px;
            color: #000;
            padding: 5px 10px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-decoration: none;
        }

        .btn-remove:hover {
            background-color: #000;
            color: #fff;
        }

        .btn-pay-gcash {
            background-color: #000;
            border: 2px solid #fff;
            border-radius: 5px;
            color: #fff;
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-pay-gcash:hover {
            background-color: #fff;
            color: #000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Thank You for Your Purchase!</h1>
            <h2>Order History</h2>
            <asp:Repeater ID="OrderHistoryRepeater" runat="server">
                <HeaderTemplate>
                    <table>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                       
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Name") %></td>
                        <td>₱<%# Eval("Price") %></td>
                    
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
            <h2>Payment Information</h2>
            <p>Name: <asp:Label ID="lblName" runat="server" Text=""></asp:Label></p>
            <p>Gcash Number: <asp:Label ID="lblGcashNumber" runat="server" Text=""></asp:Label></p>
            <p>Gcash Name: <asp:Label ID="lblGcashName" runat="server" Text=""></asp:Label></p>
            <p>Reference Number: <asp:Label ID="lblReferenceNumber" runat="server" Text=""></asp:Label></p>
            <p>Amount: ₱<asp:Label ID="lblAmount" runat="server" Text=""></asp:Label></p>
         
        </div>
    </form>
</body>
</html>