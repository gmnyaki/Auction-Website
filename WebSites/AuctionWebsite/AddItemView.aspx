<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddItemView.aspx.cs" Inherits="AddItemView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container-fluid">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height:35px;">Return to Home Page</a>
    <form id="form1" runat="server" class="form-horizontal" style="margin-top: 10px">
    <div class="clearfix">
        <div class="pull-left">
            <asp:Label ID="Username" runat="server"></asp:Label>
        </div>
    </div>
    <div>
        <h1 class="text-center">Add An Item To Sell</h1>
        <fieldset>
            <legend>Basic Information</legend>
            <div class="form-group">
                <label for="OwnerName" class="col-sm-2 control-label">Owner Name</label>
                <asp:Label ID="OwnerName" runat="server" CssClass="text-success col-sm-10"></asp:Label>
            </div>
            <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">Item Name</label>
                <asp:TextBox ID="Name" runat="server" CssClass="col-sm-10 form-control" style="width:50%;"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Condition" class="col-sm-2 control-label">Item Condition</label>
                <asp:TextBox ID="Condition" runat="server" CssClass="col-sm-10 form-control" style="width:50%;" placeholder="Ex. Good, Bad"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Description" class="col-sm-2 control-label">Item Description</label>
                <asp:TextBox ID="Description" runat="server" CssClass="col-sm-10 form-control" style="width:50%;" TextMode="MultiLine" placeholder="Describe the item, packaging information, etc."></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Price" class="col-sm-2 control-label">Item Price</label>
                <asp:TextBox ID="Price" runat="server" CssClass="form-control col-sm-10" style="width:50%;" TextMode="Number" placeholder="Ex. 50.00"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Quantity" class="col-sm-2 control-label">Item Quantity</label>
                <asp:TextBox ID="Quantity" runat="server" CssClass="form-control col-sm-10" style="width: 50%;" TextMode="Number"></asp:TextBox>
            </div>
        </fieldset>
        <fieldset>
            <legend>Bidding Information</legend>
            <div class="form-group">
                <label for="BidStartTime" class="col-sm-2 control-label">Bid Start Time</label>
                <asp:TextBox ID="BidStartTime" runat="server" CssClass="col-sm-10 form-control" style="width:50%;" TextMode="DateTime" placeholder="Ex. 12/19/2014 10:00:00"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="BidEndTime" class="col-sm-2 control-label">Bid End Time</label>
                <asp:TextBox ID="BidEndTime" runat="server" CssClass="col-sm-10 form-control" style="width:50%;" TextMode="DateTime" placeholder="Ex. 12/24/2014 12:00:00"></asp:TextBox>
            </div>
        </fieldset>
        <hr/>
        <div class="form-group">
            <asp:Button ID="AddItem" runat="server" OnClick="AddItemController" Text="Add Item" CssClass="col-sm-offset-1 btn btn-primary" />
        </div>
    </div>
    </form>
</body>
</html>
