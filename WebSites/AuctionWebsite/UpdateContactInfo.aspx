<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateContactInfo.aspx.cs" Inherits="UpdateContactInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update User Contact Information Information</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body class="container-fluid" style="font-family: Helvetica, Arial, sans-serif;">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height: 35px;">Return to Home Page</a>
    <hr/><h1 class="text-center">Update User Contacts</h1><hr/>
    <form id="form1" runat="server" class="form-horizontal" style="margin-top: 10px;">
        <div style="margin: 20px 40px 20px 20px; padding: 20px 40px 20px 20px;"   
            <div class="form-group col-sm-12">
                <label for="Email" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="Email" runat="server" CssClass="form-control col-sm-5" style="width: 50%;" TextMode="Email"></asp:TextBox>
                    <asp:Label ID="EmailValidation" runat="server" CssClass="col-sm-5 text-danger" style="line-height: 35px;"></asp:Label>
                </div>
            </div>
            <div class="form-group col-sm-12">
                <label for="Telephone" class="col-sm-2 control-label">Telephone</label>
                <asp:TextBox ID="Telephone" runat="server" CssClass="form-control col-sm-10" style="width: 50%;" TextMode="Phone"></asp:TextBox>
            </div>
            <hr/>
            <div class="form-group col-sm-12">
                <asp:Button ID="Update" runat="server" OnClick="UpdateContactInfoController" Text="Update Contacts" CssClass="btn btn-primary col-sm-offset-5" />
            </div>
        </div>
    </form>
</body>
</html>