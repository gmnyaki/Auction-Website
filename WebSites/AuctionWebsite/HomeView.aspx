<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomeView.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BA</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container-fluid" style="font-family: Helvetica, Arial, sans-serif;">
    <form id="form1" runat="server" style="margin-top:10px;">
        <nav class="navbar navbar-default clearfix" role="navigation">
            <div class="pull-left" style="margin-left: 10px;">
                <asp:Label ID="LoggedInAsLabel" runat="server" style="line-height:45px;"></asp:Label>
            </div>
            <div class="pull-right" style="margin-top: 5px; margin-right: 10px;">
                <asp:Button ID="LoginLogout" runat="server" CssClass="btn btn-default" OnClick="LoginController" />
                <asp:HyperLink ID="Register" runat="server" Text="Register" NavigateUrl="RegisterView.aspx"></asp:HyperLink>
            </div>
        </nav>
        <hr/><h1 class="text-center">BA</h1><hr/>
        <div class="row" style="margin: 0 10px 0 10px; padding: 10px 0 10px 0;">
            <asp:Panel ID="BuyerOptions" runat="server">
                <h2>Buyer Options</h2>
                <a href="ItemListView.aspx" style="display: inherit;">List of Items</a>
            </asp:Panel>
            <asp:Panel ID="SellerOptions" runat="server">
                <h2>Seller Options</h2>
                <a href="AddItemView.aspx" style="display: inherit;">Add An Item To Sell</a>
                <a href="ViewAllUserPosts.aspx" style="display: inherit;">View All Of Your Posts</a>
            </asp:Panel>
            <asp:Panel ID="AccountManagement" runat="server">
                <h2>Account Management</h2>
                <a href="UpdateUser.aspx" style="display: inherit;">Update Username/Password</a>
                <a href="UpdateContactInfo.aspx" style="display: inherit;">Update Contact Info</a>
                <a href="UpdateAddressInfo.aspx" style="display: inherit;">Update Address</a>
                <a href="UpdateCreditCard.aspx" style="display: inherit;">Update Credit Card Info</a>
            </asp:Panel>
            <asp:Panel ID="BAStatistics" runat="server">
                <h2>BA Statistics</h2>
                <a href="MostActiveBuyers.aspx" style="display: inherit;">Top 5 Most Active Buyers</a>
                <a href="MostActiveSellers.aspx" style="display: inherit;">Top 5 Most Active Sellers</a>
                <a href="MostPopularSellers.aspx" style="display: inherit;">Top 5 Most Popular Sellers</a>
                <a href="MostExpensiveItemsSold.aspx" style="display: inherit;">Top 5 Most Expensive Items Sold</a>
                <a href="MostExpensiveItemsAvailable.aspx" style="display: inherit;">Top 5 Most Expensive Items Available</a>
                <a href="MostAffordableItemsSold.aspx" style="display: inherit;">Top 5 Most Affordable Items Sold</a>
                <a href="MostAffordableItemsAvailable.aspx" style="display: inherit;">Top 5 Most Affordable Items Available</a>
            </asp:Panel>
        </div>
    </form>
    <footer style="position: fixed; bottom: 10px; width: 100%;"">
        <p class="text-right" style="margin-right: 25px;">Created by Giuseppe and Gerald</p>
    </footer>
    </body>
</html>
