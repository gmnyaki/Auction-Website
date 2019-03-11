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

public partial class UpdateCreditCard : System.Web.UI.Page
{
    private string SQLConnectionString;
    private SqlConnection SQLConnection;

    private String SQLQuery;
    private SqlCommand SQLCommand;
    private SqlDataReader SQLReader;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void UpdateCreditCardController(object sender, EventArgs e)
    {
        SQLConnectionString = WebConfigurationManager.ConnectionStrings["AuctionWebsite"].ConnectionString;
        SQLConnection = new SqlConnection(SQLConnectionString);

        if (Session["Username"] == null || Session["UserID"] == null) {
            return;
        }

        if (OwnerName.Text.Trim() == "" || CardNumber.Text.Trim() == "" || ExpirationDate.Text.Trim() == "") {
            CreditCardValidation.Text = "You Must Fill In All Fields to Update Credit Card Info";
            return;
        }

        SQLQuery = "UPDATE PERSON_CREDITCARD SET OWNER_NAME='" + OwnerName.Text.Trim() + "', NUMBER='" + CardNumber.Text.Trim() + "', EXPIRATION_DATE='" + ExpirationDate.Text.Trim() +  "' WHERE PERSON_ID='" + Session["UserID"] + "'";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
        SQLConnection.Open();
        SQLCommand.ExecuteNonQuery();
        SQLConnection.Close();

        Server.Transfer("HomeView.aspx");
    }
}