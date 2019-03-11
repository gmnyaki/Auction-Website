<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ItemListView.aspx.cs" Inherits="ItemView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List of Auction Items</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container-fluid">
    <a href="HomeView.aspx" runat="server" class="breadcrumb" style="line-height: 35px;">Return to Home Page</a>
    <form id="form1" runat="server" style="margin-top: 10px;">
    <div>
        <div class="clearfix">
            <div class="pull-left">
                <asp:Label ID="Username" runat="server"></asp:Label>
            </div>
            <div class="pull-right form-inline">
                <div class="form-group">
                    <label for="Search">Search</label> 
                    <asp:TextBox ID="Search" runat="server" TextMode="Search" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="ItemSearch" OnClick="ItemSearchController" Text="Go" runat="server" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
        <hr/><h1 class="text-center">List of Items</h1><hr/>
        <asp:ListView ID="ItemListView" runat="server" DataSourceID="SqlDataSourceItem" GroupItemCount="1">
            <LayoutTemplate>
                <table runat="server" id="ItemTable" class="table table-bordered" style="margin:auto; width:80%;">
                    <tr runat="server" id="groupPlaceholder"></tr>
                </table>
            </LayoutTemplate>
            <GroupTemplate>
                <tr runat="server" id="ItemRow"
                    style="height:80px">
                  <td runat="server" id="itemPlaceholder" />
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server">
                    <div class="clearfix">
                        <asp:HyperLink ID="Name" runat="server" Text='<%# Eval("NAME") %>' CssClass="pull-left" style="font-size: 20px;" Target="_self" NavigateUrl='<%# String.Format("ItemView.aspx?id={0}", Eval("ID")) %>'></asp:HyperLink>
                        <div class="pull-right" style="line-height:35px; font-size:16px;">
                            <label>Asking Price: $</label>
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("INITIAL_PRICE") %>' CssClass="pull-right" />
                        </div>
                    </div>
                    <img src="." alt="Image placeholder"/>
                    <div style="margin-top: 10px;">
                        <label>Description:</label>
                        <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("DESCRIPTION") %>' />
                    </div>
                </td>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSourceItem" runat="server" ConnectionString="<%$ ConnectionStrings:AuctionWebsite %>" SelectCommand="SELECT * FROM [ITEM]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
