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

public partial class UpdateUser : System.Web.UI.Page
{
    private string SQLConnectionString;
    private SqlConnection SQLConnection;

    private String SQLQuery;
    private SqlCommand SQLCommand;
    private SqlDataReader SQLReader;

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void UpdateUserController(object sender, EventArgs e)
    {
        SQLConnectionString = WebConfigurationManager.ConnectionStrings["AuctionWebsite"].ConnectionString;
        SQLConnection = new SqlConnection(SQLConnectionString);

        if (Session["Username"] == null || Session["UserID"] == null) {
            return;
        }

        if (Username.Text.Trim() == "" && Password.Text != "") {
            if (Password.Text != RepeatPassword.Text) {
                PasswordValidation.Text = "Passwords do not match.";
                return;
            }
            PasswordValidation.Text = "";

            SQLQuery = "UPDATE PERSON SET PASSWORD='" + Password.Text + "' WHERE PERSON.ID='" + Session["UserID"] + "'";
            SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
            SQLConnection.Open();
            SQLCommand.ExecuteNonQuery();
            SQLConnection.Close();

            Server.Transfer("HomeView.aspx");
        } else if (Username.Text.Trim() != "" && Password.Text == "") {
            // Check if username exists in system
            SQLQuery = "SELECT USERNAME FROM PERSON WHERE USERNAME ='" + Username.Text.Trim() + "'";
            SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
            SQLConnection.Open();
            SQLReader = SQLCommand.ExecuteReader();

            if (SQLReader.HasRows && SQLReader.Read()) {
                // There is only one row to check since username is a UNIQUE attribute
                UsernameValidation.Text = "Username '" + SQLReader.GetString(0) + "' already taken.";
                SQLConnection.Close();
                return;
            }
            UsernameValidation.Text = "";
            SQLConnection.Close();

            SQLQuery = "UPDATE PERSON SET USERNAME='" + Username.Text.Trim() + "' WHERE PERSON.ID='" + Session["UserID"] + "'";
            SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
            SQLConnection.Open();
            SQLCommand.ExecuteNonQuery();
            SQLConnection.Close();

            Session["Username"] = Username.Text.Trim();
            Server.Transfer("HomeView.aspx");
        } else {
            // Check if username exists in system
            SQLQuery = "SELECT USERNAME FROM PERSON WHERE USERNAME ='" + Username.Text.Trim() + "'";
            SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
            SQLConnection.Open();
            SQLReader = SQLCommand.ExecuteReader();

            if (SQLReader.HasRows && SQLReader.Read())
            {
                // There is only one row to check since username is a UNIQUE attribute
                UsernameValidation.Text = "Username '" + SQLReader.GetString(0) + "' already taken.";
                SQLConnection.Close();
                return;
            }
            UsernameValidation.Text = "";
            SQLConnection.Close();

            if (Password.Text != RepeatPassword.Text)
            {
                PasswordValidation.Text = "Passwords do not match.";
                return;
            }
            PasswordValidation.Text = "";

            SQLQuery = "UPDATE PERSON SET USERNAME='" + Username.Text.Trim() + "', PASSWORD='" + Password.Text + "' WHERE PERSON.ID='" + Session["UserID"] + "'";
            SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
            SQLConnection.Open();
            SQLCommand.ExecuteNonQuery();
            SQLConnection.Close();

            Session["Username"] = Username.Text.Trim();
            Server.Transfer("HomeView.aspx");
        }
    }
}