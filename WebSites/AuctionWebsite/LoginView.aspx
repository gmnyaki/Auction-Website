<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginView.aspx.cs" Inherits="LoginView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login to Auction Website</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container-fluid" style="font-family: Helvetica, Arial, sans-serif;">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height:35px;">Return to Home Page</a>
    <hr/><h1 class="text-center">Login to Auction Website</h1><hr/>
    <form id="form1" runat="server" class="form-horizontal" style="margin-top: 10px;">
        <div class="form-group">
            <label for="Username" class="col-sm-2 control-label">Username</label>
            <div class="col-sm-4">
                <asp:TextBox ID="Username" runat="server" CssClass="form-control" placeholder="Username" />
            </div>
        </div>
        <div class="form-group">
            <label for="Password" class="col-sm-2 control-label">Password</label> 
            <div class="col-sm-4">
                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Label ID="ValidationMessage" runat="server" CssClass="text-danger"></asp:Label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="Login" runat="server" OnClick="LoginController" Text="Login" CssClass="btn btn-primary"/>
            </div>
        </div>
    </form>
</body>
</html>
