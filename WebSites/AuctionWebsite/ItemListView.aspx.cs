using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ItemView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null || Session["UserID"] != null) {
            Username.Text = "Logged in as: " + Session["Username"].ToString();
        }
    }
    protected void ItemSearchController(object sender, EventArgs e)
    {
        SqlDataSourceItem.SelectCommand = "SELECT * FROM [ITEM] WHERE NAME LIKE '" + Search.Text.Trim() + "%' OR DESCRIPTION LIKE '" + Search.Text.Trim() + "%'";
    }
}