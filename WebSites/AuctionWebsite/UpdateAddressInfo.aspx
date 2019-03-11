<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateAddressInfo.aspx.cs" Inherits="UpdateAddressInfo" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Update User Address Information</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
</head>
<body class="container-fluid" style="font-family: Helvetica, Arial, sans-serif;">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height: 35px;">Return to Home Page</a>
    <hr/><h1 class="text-center">Update User Address</h1><hr/>
    <form id="form1" runat="server" class="form-horizontal" style="margin-top: 10px;">
        <div style="margin: 20px 40px 20px 20px; padding: 20px 40px 20px 20px;">
            <div class="form-group">
                <label for="Email" class="col-sm-2 control-label">Street</label>
                <div class="col-sm-10">
                    <asp:TextBox ID="Street" runat="server" CssClass="form-control col-sm-10" style="width: 50%;" ></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label for="City" class="col-sm-2 control-label">City</label>
                <asp:TextBox ID="City" runat="server" CssClass="form-control col-sm-10" style="width: 50%;" ></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="State" class="col-sm-2 control-label">State</label>
                <asp:TextBox ID="State" runat="server" CssClass="form-control col-sm-10" style="width: 50%;" ></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="Zip" class="col-sm-2 control-label">Zip</label>
                <asp:TextBox ID="Zip" runat="server" CssClass="form-control col-sm-10" style="width: 50%;" ></asp:TextBox>
            </div>
            <hr/>
            <div class="form-group">
                <asp:Button ID="Update" runat="server" OnClick="UpdateAddressInfoController" Text="Update Contacts" CssClass="btn btn-primary" />
            </div>
        </div>
    </form>
</body>
</html>