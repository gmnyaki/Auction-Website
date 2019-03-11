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

public partial class UpdateContactInfo : System.Web.UI.Page
{
    private string SQLConnectionString;
    private SqlConnection SQLConnection;

    private String SQLQuery;
    private SqlCommand SQLCommand;
    private SqlDataReader SQLReader;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UpdateContactInfoController(object sender, EventArgs e)
    {
        SQLConnectionString = WebConfigurationManager.ConnectionStrings["AuctionWebsite"].ConnectionString;
        SQLConnection = new SqlConnection(SQLConnectionString);

        if (Session["Username"] == null || Session["UserID"] == null) {
            return;
        }

        if (!Email.Text.Contains("@")) { // Replace with regex
            EmailValidation.Text = "Email should be in format email@email.com.";
            return;
        }

        SQLQuery = "UPDATE PERSON SET EMAIL = '" + Email.Text.Trim() + "', TELEPHONE = '" + Telephone.Text.Trim() + "' WHERE PERSON.ID = '" + Session["UserID"] + "'";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
        SQLConnection.Open();
        SQLCommand.ExecuteNonQuery();
        SQLConnection.Close();

        Server.Transfer("HomeView.aspx");
    }
}