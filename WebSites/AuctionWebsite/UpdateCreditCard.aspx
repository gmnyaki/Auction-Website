<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateCreditCard.aspx.cs" Inherits="UpdateCreditCard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Credit Card Info</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body class="container-fluid" style="font-family: Helvetica, Arial, sans-serif;">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height: 35px;">Return to Home Page</a>
    <hr /><h1 class="text-center">Update Credit Card Info</h1><hr />
    <form id="form1" runat="server" class="form-horizontal" style="margin-top: 10px;">
        <div style="margin: 20px 40px 20px 20px; padding: 20px 40px 20px 20px;">
            <div class="form-group col-sm-12">
                <label for="OwnerName" class="col-sm-2 control-label">Owner Name</label>
                <asp:TextBox ID="OwnerName" runat="server" CssClass="form-control col-sm-10" style="width: 50%;"></asp:TextBox>
            </div>
            <div class="form-group col-sm-12">
                <label for="CardNumber" class="col-sm-2 control-label">Card No.</label>
                <asp:TextBox ID="CardNumber" runat="server" CssClass="form-control col-sm-10" style="width: 50%;" TextMode="Number" placeholder="Ex. 0000000000000000"></asp:TextBox>
            </div>
            <div class="form-group form-inline col-sm-12">
                <label for="ExpirationDate" class="col-sm-2 control-label">Expiration Date</label>
                <asp:TextBox ID="ExpirationDate" runat="server" CssClass="form-control col-sm-10" TextMode="Month" style="width: 30%;" placeholder="Ex. 06/15"></asp:TextBox>
            </div>
        </div>
        <asp:Label ID="CreditCardValidation" runat="server" CssClass="col-sm-12 text-danger" style="line-height: 35px;"></asp:Label>
        <div class="form-group col-sm-12">
            <asp:Button ID="Update" runat="server" OnClick="UpdateCreditCardController" Text="Update" CssClass="btn btn-primary col-sm-offset-5" />
        </div>
    </form>
</body>
</html>
