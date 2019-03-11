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

public partial class RegisterView : System.Web.UI.Page
{
    private string SQLConnectionString;
    private SqlConnection SQLConnection;

    private String SQLQuery;
    private SqlCommand SQLCommand;
    private SqlDataReader SQLReader;
    private Int32 SQLResultID;

    protected void RegisterController(object sender, EventArgs e)
    {
        SQLConnectionString = WebConfigurationManager.ConnectionStrings["AuctionWebsite"].ConnectionString;
        SQLConnection = new SqlConnection(SQLConnectionString);

        // Check if username exists in system
        SQLQuery = "SELECT USERNAME FROM PERSON WHERE USERNAME='" + Username.Text.Trim() + "'";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
        SQLConnection.Open();
        SQLReader = SQLCommand.ExecuteReader();

        if (SQLReader.HasRows && SQLReader.Read()) {
            // There is only one row to check since username is a UNIQUE attribute
            UsernameValidation.Text = "Username '" + SQLReader.GetString(0) + "' already taken.";
            SQLConnection.Close();
            return;
        }
        SQLConnection.Close();

        if (!Email.Text.Contains("@")) { // Replace with regex
            EmailValidation.Text = "Email should be in format email@email.com.";
            return;
        }

        // Prepare to insert into strong entity PERSON since validation is finished.
        SQLQuery = "INSERT INTO PERSON ( NAME, USERNAME, PASSWORD, EMAIL, TELEPHONE)" +
                   "VALUES ('" + Name.Text.Trim() + "', '" + Username.Text.Trim() + "', '" + 
                                 Password.Text + "', '" + Email.Text.Trim() + "', '" + 
                                 Telephone.Text.Trim() + "')" +
                   "SELECT CAST(scope_identity() as int)";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);

        // Perform insertion and return a FK reference for use in weak entity tables
        SQLConnection.Open();
        SQLResultID = (Int32) SQLCommand.ExecuteScalar();
        SQLConnection.Close();

        // Prepare to insert into weak entity PERSON_ADDRESS
        SQLQuery = "INSERT INTO PERSON_ADDRESS (PERSON_ID, STREET, CITY, STATE, ZIP)" +
                   "VALUES ('" + SQLResultID + "', '" + Street.Text.Trim() + "', '" +
                                 City.Text.Trim() + "', '" + State.Text.Trim() + "', '" +
                                 ZIP.Text.Trim() + "')";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);

        // Perform insertion
        SQLConnection.Open();
        SQLCommand.ExecuteNonQuery();
        SQLConnection.Close();

        // Prepare to insert into weak entity PERSON_CREDITCARD
        SQLQuery = "INSERT INTO PERSON_CREDITCARD (PERSON_ID, OWNER_NAME, NUMBER, EXPIRATION_DATE)" +
                   "VALUES ('" + SQLResultID + "', '" + OwnerName.Text.Trim() + "', '" + 
                                 CardNumber.Text.Trim() + "', '" + 
                                 ExpirationDate.Text.Trim() + "')";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);

        // Perform insertion
        SQLConnection.Open();
        SQLCommand.ExecuteNonQuery();
        SQLConnection.Close();

        Server.Transfer("HomeView.aspx");
    }
}