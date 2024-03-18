<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Online_Shop.Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #fff; 
            color: #000; 
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #000;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            overflow: hidden;
        }
        .form-group label {
            color: #fff;
            font-weight: bold;
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
        }
        .form-control {
            background-color: #fff;
            border: none;
            border-radius: 5px;
            color: #000; 
            padding: 10px;
            margin-bottom: 20px;
        }
        .form-control:focus {
            background-color: #f5f5f5;
            outline: none;
        }
        /* Modify button color to black */
        .btn-primary {
            background-color: #000; 
            border: none;
            border-radius: 5px;
            color: #fff; 
            padding: 10px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #333; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-group text-center">
                <label for="profile">Profile </label><br />
                <asp:FileUpload ID="profilePicture" runat="server" CssClass="form-control-file" onchange="readURL(this)" /><br />
                <asp:Image ID="imgProfile" runat="server" CssClass="profile-picture" />
            </div>
            <div class="form-group">
                <label for="txtName">Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtEmail">Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtContact">Contact Number</label>
                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtAddress">Address</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <!-- Modify button class to use btn-dark instead of btn-primary -->
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-dark" />
                <asp:Button ID="btnHome" runat="server" Text="Back" OnClick="btnHome_Click" CssClass="btn btn-dark float-right" />
            </div>
            <div> 
                <asp:Label ID="lblMessage" runat="server" Visible="false" ForeColor="Red" CssClass="message"></asp:Label>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#imgProfile').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</body>
</html>