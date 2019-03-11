<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateUser.aspx.cs" Inherits="UpdateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update User Information</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body class="container-fluid" style="font-family: Helvetica, Arial, sans-serif;">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height: 35px;">Return to Home Page</a>
    <hr/><h1 class="text-center">Update User Information </h1><hr/>
    <form id="form1" runat="server" class="form-horizontal" style="margin-top: 10px;">
        <div style="margin: 20px 40px 20px 20px; padding: 20px 40px 20px 20px;">
            <div class="form-group col-sm-12">
                <label for="Username" class="col-sm-offset-3 col-sm-2 control-label">Username</label>
                <asp:TextBox ID="Username" runat="server" CssClass="form-control col-sm-7" style="width: 20%;"></asp:TextBox>
                <asp:Label ID="UsernameValidation" runat="server" CssClass="col-sm-2 text-danger" style="line-height: 35px;"></asp:Label>
            </div>
            <div class="form-group col-sm-12">
                <label for="Password" class="col-sm-offset-3 col-sm-2 control-label">Password</label>
                <asp:TextBox ID="Password" runat="server" CssClass="form-control col-sm-7" style="width: 20%;" TextMode="Password" placeholder="Put guidelines that are enforced here."></asp:TextBox>
            </div>
            <div class="form-group col-sm-12">
                <label for="RepeatPassword" class="col-sm-offset-3 col-sm-2 control-label">Repeat Password</label>
                <asp:TextBox ID="RepeatPassword" runat="server" CssClass="form-control col-sm-7" style="width: 20%;" TextMode="Password" placeholder="Put guidelines that are enforced here."></asp:TextBox>
                <asp:Label ID="PasswordValidation" runat="server" CssClass="col-sm-2 text-danger" style="line-height: 35px;"></asp:Label>
            </div>
            <hr />
            <div class="form-group col-sm-12">
                <asp:Button ID="Update" runat="server" OnClick="UpdateUserController" Text="Save" CssClass="btn btn-primary col-sm-offset-5" />
            </div>
        </div>
    </form>
</body>
</html>
