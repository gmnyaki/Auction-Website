using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// MSSQL
using System.Data.SqlClient;
// Web Configuration Manager
using System.Web.Configuration;

public partial class AddItemView : System.Web.UI.Page
{
    private string SQLConnectionString;
    private SqlConnection SQLConnection;

    private String SQLQuery;
    private SqlCommand SQLCommand;
    private Int32 SQLResultID;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null || Session["UserID"] != null) {
            Username.Text = "Logged in as: " +  Session["Username"].ToString();
            OwnerName.Text = Session["Username"].ToString();
        }
    }

    protected void AddItemController(object sender, EventArgs e)
    {
        // Make sure a user is logged in properly
        if (Session["Username"] == null || Session["UserID"] == null) {
            return;
        }

        if (DateTime.Parse(BidStartTime.Text) < DateTime.Now || DateTime.Parse(BidStartTime.Text) > DateTime.Parse(BidEndTime.Text)) {
            return;
        }

        if (Condition.Text.Trim() == "Explained" && Description.Text.Trim().Length < 1) {
            return;
        }

        SQLConnectionString = WebConfigurationManager.ConnectionStrings["AuctionWebsite"].ConnectionString;
        SQLConnection = new SqlConnection(SQLConnectionString);

        // Prepare to insert into strong entity ITEM
        SQLQuery = "INSERT INTO ITEM (NAME, CONDITION, INITIAL_PRICE, DESCRIPTION,QUANTITY,OWNER,BID_START_TIME,BID_END_TIME)" +
                   "VALUES ('" +   Name.Text.Trim() + "', '" + Condition.Text.Trim() + "', '" +
                                   Price.Text.Trim().Replace("$", "") + "', '" + Description.Text.Trim() + "', '" +
                                   Quantity.Text.Trim() + "', '" + Session["UserID"] +  "', '" +
                                   BidStartTime.Text + "', '" + BidEndTime.Text + "')" +
                   "SELECT CAST(scope_identity() as int)";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);

        // Perform insertion and return a FK reference for use in weak entity tables
        SQLConnection.Open();
        SQLResultID = (Int32) SQLCommand.ExecuteScalar();
        SQLConnection.Close();

        // Prepare to insert into weak entity PERSON_CREDITCARD
        SQLQuery = "INSERT INTO ITEM_PICTURE (ITEM_ID, LOCATION)" +
                   "VALUES ('" + SQLResultID + "', '" + OwnerName.Text.Trim() + "')"; // Temporary
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);

        // Perform insertion
        SQLConnection.Open();
        SQLCommand.ExecuteNonQuery();
        SQLConnection.Close();

        Server.Transfer("ItemListView.aspx");
    }
}