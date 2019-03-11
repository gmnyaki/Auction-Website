<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewAllUserPosts.aspx.cs" Inherits="ViewAllUserPosts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View All My Posts</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body class="container-fluid">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height: 35px;">Return to Home Page</a>
    <form id="form1" runat="server" style="margin-top: 10px;">
    <div>
        <div class="clearfix">
            <div class="pull-left">
                <asp:Label ID="Username" runat="server"></asp:Label>
            </div>
        </div>
        <hr/><h1 class="text-center">View All My Posts</h1><hr/>
        <asp:ListView ID="UserPostsListView" runat="server" DataSourceID="SqlDataSourceUserPosts" GroupItemCount="1">
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
        <asp:SqlDataSource ID="SqlDataSourceUserPosts" runat="server" ConnectionString="<%$ ConnectionStrings:AuctionWebsite %>"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
