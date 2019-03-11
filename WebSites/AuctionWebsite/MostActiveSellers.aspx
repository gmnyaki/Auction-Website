<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MostActiveSellers.aspx.cs" Inherits="MostActiveSellers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Most Active Sellers</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="container-fluid" style="font-family: Helvetica, Arial, sans-serif;">
    <a href="HomeView.aspx" class="breadcrumb" runat="server" style="line-height: 35px;">Return to Home Page</a>
    <form id="form1" runat="server" style="margin-top:10px;">
    <div class="clearfix">
        <div class="pull-left">
            <asp:Label ID="Username" runat="server"></asp:Label>
        </div>
    </div>
    <div>
        <hr/><h1 class="text-center">Most Active Sellers</h1><hr/>
        <asp:GridView ID="MostActiveSellersGrid" runat="server" style="margin:auto;" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PERSON_NAME,ITEMS_OFFERED" DataSourceID="SqlDataSourceMostActiveSellers" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="PERSON_NAME" HeaderText="Name" ReadOnly="True" SortExpression="PERSON_NAME" />
                <asp:BoundField DataField="ITEMS_OFFERED" HeaderText="No. of Items Offered" ReadOnly="True" SortExpression="ITEMS_OFFERED" />
           </Columns>
            <FooterStyle BackColor="#CCCC99" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F7DE" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceMostActiveSellers" runat="server" ConnectionString="<%$ ConnectionStrings:AuctionWebsite %>" SelectCommand="SELECT * FROM [MOST_ACTIVE_SELLERS]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
