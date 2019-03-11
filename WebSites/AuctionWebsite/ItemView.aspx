<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ItemView.aspx.cs" Inherits="ItemView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container-fluid">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height:35px;">Return to Home Page</a>
    <br />
    <a href="ItemListView.aspx" runat="server" style="line-height:35px;">Return to Item List</a>
    <form id="form1" runat="server" style="margin-top:10px;" class="form-horizontal">
    <div class="clearfix">
        <div class="pull-left">
            <asp:Label ID="Username" runat="server"></asp:Label>
        </div>
    </div>
    <div class="center-block text-center">
        <asp:Label ID="ItemName" runat="server" style="font-size: 20px; font-weight:bold;"></asp:Label>
    </div>
    <hr />
    <div>
        <label for="BidStartTime" runat="server" style="font-size: 16px;">Bid Start Time:</label>
        <asp:Label ID="BidStartTime" runat="server"></asp:Label>
        <div></div>
        <label for="BidEndTime" runat="server" style="font-size: 16px;">Bid End Time:</label>
        <asp:Label ID="BidEndTime" runat="server"></asp:Label>
        <div></div>
        <label for="BidTimeRemaining" runat="server" style="font-size: 16px;">Time Remaining:</label>
        <label id="timeremaining"></label>
        <div></div>
        <label for="HighestBid">Highest Bid:</label>
        <asp:Label ID="HighestBid" runat="server" style="font-size: 16px;"></asp:Label>
        <div></div>
        <label for="NewBid">New Bid</label>
        <asp:TextBox ID="NewBid" runat="server" CssClass="form-control" style="display:inline-block; width:10%;"></asp:TextBox>
        <asp:Button ID="SubmitBid" runat="server" CssClass="btn btn-primary" Text="Submit Bid" OnClick="BidController"/>
    </div>
    </form>
    <script src="js/timer.js"></script>
</body>
</html>
