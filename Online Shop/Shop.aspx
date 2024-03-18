<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Online_Shop.Shop" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shop</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fff; 
            color: #000; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Shop</h1>
          
            <div class="form-group">
                <input type="text" id="txtSearch" runat="server" class="form-control" placeholder="Search...">
            </div>
            
            
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#men">Men</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#women">Women</a>
                </li>
            </ul>
           
            <div class="tab-content">
                <div id="all" class="tab-pane fade show active">
                   
                    <div class="row" id="allItems">
                       
                    </div>
                </div>
                <div id="men" class="tab-pane fade">                  
                    <div class="row" id="menItems">                     
                        <div class="col-md-4">
                            <div class="card">
                                <img src="/images/tshirt_men.jpg" class="card-img-top" alt="Sample Men's Product">
                                <div class="card-body">
                                    <h5 class="card-title">Men Shirt</h5>
                                    <p class="card-text">Price: 1200</p>
                                   <asp:Button ID="Button5" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" CommandArgument="Men Shirt" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img src="/images/loose_jeans.jpg" class="card-img-top" alt="Sample Men's Product">
                                <div class="card-body">
                                    <h5 class="card-title">Men Loose Jeans</h5>
                                    <p class="card-text">Price: 1800</p>
                                    <asp:Button ID="Button4" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" CommandArgument="Men Loose Jeans" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card">
                                <img src="/images/shirt_grey.jpg" class="card-img-top" alt="Sample Men's Product">
                                <div class="card-body">
                                    <h5 class="card-title">Men Shirt</h5>
                                    <p class="card-text">Price: 1500</p>
                                    <asp:Button ID="Button3" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" CommandArgument="Men Shirt Grey" /> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                           <div id="women" class="tab-pane fade">
                <div class="row" id="womenItems">
                    <div class="col-md-4">
                        <div class="card">
                            <img src="/images/loose_jeans.jpg" class="card-img-top img-fluid" alt="Sample Women's Product">
                            <div class="card-body">
                                <h5 class="card-title">Women Loose Jeans</h5>
                                <p class="card-text">Price: 800</p>
                             <asp:Button ID="Button2" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" CommandArgument="Women Loose Jeans" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <img src="/images/women.jpg" class="card-img-top img-fluid" alt="Sample Women's Product">
                            <div class="card-body">
                                <h5 class="card-title">Shirt</h5>
                                <p class="card-text">Price: 300</p>
                              <asp:Button ID="Button1" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" CommandArgument="Shirt" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <img src="/images/women1.jpg" class="card-img-top img-fluid" alt="Sample Women's Product">
                            <div class="card-body">
                                <h5 class="card-title">Sheath Dress</h5>
                                <p class="card-text">Price: 550</p>
                                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" CommandArgument="Sheath Dress" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <a href="Home.aspx" class="btn btn-secondary mt-3">Go Back to Homepage</a>
        </div>
    </form>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            const tabs = document.querySelectorAll('.nav-link');
            tabs.forEach(tab => {
                tab.addEventListener('click', function (event) {
                    event.preventDefault();
                    const targetTabId = this.getAttribute('href');
                    const targetTabContent = document.querySelector(targetTabId);
                    const allTabsContent = document.querySelectorAll('.tab-pane');


                    allTabsContent.forEach(content => {
                        content.classList.remove('show', 'active');
                    });


                    targetTabContent.classList.add('show', 'active');


                    if (targetTabId === '#all') {
                        document.getElementById('allItems').style.display = 'block';
                        document.getElementById('menItems').style.display = 'none';
                        document.getElementById('womenItems').style.display = 'none';
                    } else if (targetTabId === '#men') {
                        document.getElementById('allItems').style.display = 'none';
                        document.getElementById('menItems').style.display = 'flex';
                        document.getElementById('womenItems').style.display = 'none';
                    } else if (targetTabId === '#women') {
                        document.getElementById('allItems').style.display = 'none';
                        document.getElementById('menItems').style.display = 'none';
                        document.getElementById('womenItems').style.display = 'flex';
                    }
                });
            });
        });
    </script>
</body>
</html>