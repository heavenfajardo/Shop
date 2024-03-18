<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Online_Shop.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Dirkyboi Thrift Shop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2; 
            color: #000; /* Change text color to black */
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            display: flex;
            justify-content: start;
            align-items: center;
            background-color: #fff; /* Change background color to white */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .section {
            flex-grow: 1;
            text-align: center;
            padding: 10px 0;
            cursor: pointer;
            transition: transform 0.3s ease, color 0.3s ease;
            position: relative;
            color: #000; /* Change text color to black */
            text-decoration: none;
        }

        .section h2 {
            margin: 0;
            font-size: 16px;
            text-transform: uppercase;
        }

        .section:hover {
            transform: scale(1.05);
            color: #000;
        }

        .section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            width: 0;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
            transition: width 0.3s ease, left 0.3s ease;
            z-index: -1;
        }

        .section:hover::before {
            width: 100%;
            left: 0;
        }

        .logout-section {
            margin-left: auto;
            padding-right: 20px;
        }

        .logout-button {
            background-color: transparent;
            color: #000;
            font-size: 16px;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .logout-button:hover {
            color: #fff;
        }

        .slider-container {
            width: 100%;
            overflow: hidden;
            position: relative;
            margin-top: 20px; /* Adjust spacing as needed */
        }

        .slider-content {
            display: flex;
            transition: transform 0.5s ease;
        }

        .slider-item {
            flex: 0 0 auto;
            width: 100%;
        }

      
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: auto;
            padding: 16px;
            color: white;
            font-weight: bold;
            font-size: 20px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            background-color: rgba(0, 0, 0, 0.5);
            user-select: none;
        }

        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev:hover, .next:hover {
            background-color: rgba(0, 0, 0, 0.8);
        }

       .slider-item {
            flex: 0 0 auto;
            width: 100%;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .slider-image {
            width: 100%; 
            height: auto; 
            max-height: 400px; 
        }

        .greeting-label {
        font-family: Arial, sans-serif;
        font-size: 20px;
        font-weight: bold;
        margin-top: 10px; 
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="section profile-section" onclick="viewProfile()">
                <h2>Profile</h2>
            </div>
            <div class="section shop-section" onclick="viewShop()">
                <h2>Shop</h2>
            </div>
            <div class="section cart-section" onclick="viewCart()">
                <h2>Cart</h2>
            </div>
            <div class="section feedbacks-section" onclick="viewFeedbacks()">
                <h2>Feedbacks</h2>
            </div>
            <div class="section settings-section" onclick="viewSettings()">
                <h2>Settings</h2>
            </div>
            <div class="section logout-section" onclick="logout()">
                <h2>Log Out</h2>
            </div>
        </div>

        <!-- Image slider -->
        <div class="slider-container">
            <div class="slider-content">
              <div class="slider-item">
                <img src="/images/dirk.png" alt="Image 1" class="slider-image">
            </div>
            <div class="slider-item">
                <img src="/images/thrift.jpg" alt="Image 2" class="slider-image">
            </div>
            <div class="slider-item">
                <img src="/images/women.jpg" alt="Image 3" class="slider-image">
            </div>
                <!-- Add more slider items as needed -->
            </div>
            <a class="prev" onclick="moveSlider(-1)">&#10094;</a>
            <a class="next" onclick="moveSlider(1)">&#10095;</a>
        </div>

        <asp:Label ID="greetingLabel" runat="server" EnableViewState="false" CssClass="greeting-label"></asp:Label>

    </form>

    <script>
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("slider-item");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1 }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }

        function moveSlider(n) {
            slideIndex += n;
            var slides = document.getElementsByClassName("slider-item");
            if (slideIndex > slides.length) { slideIndex = 1 }
            if (slideIndex < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slides[slideIndex - 1].style.display = "block";
        }
    </script>

    <script>
        function viewProfile() {
            window.location.href = "Profile.aspx";
        }

        function viewShop() {
            window.location.href = "Shop.aspx";
        }

        function viewCart() {
            window.location.href = "Cart.aspx";
        }

        function viewFeedbacks() {
            window.location.href = "Feedbacks.aspx";
        }

        function viewSettings() {
            window.location.href = "Settings.aspx";
        }

        function logout() {
            window.location.href = "Login.aspx";
        }
    </script>
</body>
</html>
