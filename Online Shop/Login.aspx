<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Shop.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login Page</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;            
        background-image: url('images/thrift1.jpg');
        background-size: cover;
        background-position: center; 
        background-repeat: no-repeat; 
        background-attachment: fixed; 
        background-color: #292929; 
    }

    .feature-photo {
        background-size: cover; 
        background-position: center;
        height: calc(100vh - 40px); 
        position: relative;
    }

    #form1 {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 350px;
        padding: 30px;
        background-color: rgba(255, 255, 255, 0.9); 
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); 
    }

    h2 {
        text-align: center;
        color: #000; 
    }

    .textbox {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 5px;
        box-sizing: border-box;
        background-color: #fff; 
        color: #000;
    }

    .textbox:focus {
        outline: none;
        background-color: #f0f0f0; 
    }

    .button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 5px;
        background-color: #000; 
        color: #fff; 
        cursor: pointer;
        transition: background-color 0.3s ease; 
    }

    .button:hover {
        background-color: #333; 
    }

    .message {
        text-align: center;
        color: #ff0000; 
    }
    </style>
</head>
<body>
    <div class="feature-photo">
        <form id="form1" runat="server">
            <div>
                <h2>Login</h2>
                <div>
                    <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Red" CssClass="message"></asp:Label>
                </div>
                <div>
                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="textbox"></asp:TextBox>
                </div>
                <div>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="textbox"></asp:TextBox>
                </div>
                <div class="checkbox-container">
                    <label for="rememberMe">Remember Me</label>
                    <input type="checkbox" id="rememberMe" />
                </div>
                <div>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="button" />
                </div>
            </div>
        </form>
    </div>
</body>
</html>