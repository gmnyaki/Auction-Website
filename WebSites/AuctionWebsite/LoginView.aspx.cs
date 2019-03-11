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

public partial class LoginView : System.Web.UI.Page
{
    private string SQLConnectionString;
    private SqlConnection SQLConnection;

    private String SQLQuery;
    private SqlCommand SQLCommand;
    private SqlDataReader SQLReader;

    protected void LoginController(object sender, EventArgs e)
    {
        SQLConnectionString = WebConfigurationManager.ConnectionStrings["AuctionWebsite"].ConnectionString;
        SQLConnection = new SqlConnection(SQLConnectionString);

        SQLQuery = "SELECT ID, NAME, USERNAME FROM PERSON WHERE PERSON.USERNAME = '" + Username.Text.Trim() + "' AND PERSON.PASSWORD = '" + Password.Text + "'";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);

        SQLConnection.Open();
        SQLReader = SQLCommand.ExecuteReader();
        if (SQLReader.HasRows && SQLReader.Read()) {
            // There is only one row to check since username is a UNIQUE attribute.
            ValidationMessage.Text = "Welcome back, " + SQLReader.GetString(1) + "!";
            Session["UserID"] = SQLReader.GetInt32(0);
            Session["Username"] = SQLReader.GetString(2);
            SQLConnection.Close();
            Server.Transfer("HomeView.aspx");
        } else {
            ValidationMessage.Text = "Invalid Username or Password Provided.";
            SQLConnection.Close();
        }
    }
}