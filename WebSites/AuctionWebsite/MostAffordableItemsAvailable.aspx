<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MostAffordableItemsAvailable.aspx.cs" Inherits="MostAffordableItemsAvailable" %>

<!DOCTYPE html>

<head runat="server">
    <title>Most Affordable Items Available</title>
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
        <hr/><h1 class="text-center">Most Affordable Items Available</h1><hr/>
        <asp:GridView ID="MostAffordableItemsAvailableGrid" runat="server" style="margin:auto;" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="NAME,MAX_BID" DataSourceID="SqlDataSourceMostAffordableItemsAvailable" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="NAME" HeaderText="Name" ReadOnly="True" SortExpression="NAME" />
                <asp:BoundField DataField="MAX_BID" HeaderText="Current Max Bid" ReadOnly="True" SortExpression="MAX_BID" />
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
        <asp:SqlDataSource ID="SqlDataSourceMostAffordableItemsAvailable" runat="server" ConnectionString="<%$ ConnectionStrings:AuctionWebsite %>" SelectCommand="SELECT * FROM [LEAST_EXPENSIVE_ITEMS_AVAILABLE]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
