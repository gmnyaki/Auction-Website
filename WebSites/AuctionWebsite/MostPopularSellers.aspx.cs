using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MostPopularSellers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null || Session["UserID"] != null)
        {
            Username.Text = "Logged in as: " + Session["Username"].ToString();
        }
    }
}