using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page {

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null || Session["UserID"] != null) {
            LoggedInAsLabel.Text = "Logged in as: " + Session["Username"].ToString();
            LoginLogout.Text = "Logout";

            Register.Enabled = false;
            Register.CssClass = "btn btn-default disabled";

            AccountManagement.Visible = true;
            SellerOptions.Visible = true;
            BuyerOptions.CssClass = " col-md-3 text-center";
            SellerOptions.CssClass = "col-md-3 text-center";
            AccountManagement.CssClass = "col-md-3 text-center";
            BAStatistics.CssClass = "col-md-3 text-center";
        } else {
            LoggedInAsLabel.Text = "";
            LoginLogout.Text = "Login";

            Register.Enabled = true;
            Register.CssClass = "btn btn-default";

            AccountManagement.Visible = false;
            SellerOptions.Visible = false;
            BuyerOptions.CssClass = "col-md-offset-4 col-md-2 text-center";
            SellerOptions.CssClass = "col-md-offset-4 col-md-2 text-center";
            AccountManagement.CssClass = "col-md-4 text-center";
            BAStatistics.CssClass = "col-md-4 text-center";
        }
    }

    protected void LoginController(object sender, EventArgs e)
    {
        if (Session["Username"] != null || Session["UserID"] != null) {
            Session.Remove("UserID");
            Session.Remove("Username");
            Server.Transfer("HomeView.aspx");
        } else {
            Server.Transfer("LoginView.aspx");
        }
    }
}