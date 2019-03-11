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

public partial class UpdateAddressInfo : System.Web.UI.Page
{
    private string SQLConnectionString;
    private SqlConnection SQLConnection;

    private String SQLQuery;
    private SqlCommand SQLCommand;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void UpdateAddressInfoController(object sender, EventArgs e)
    {
        SQLConnectionString = WebConfigurationManager.ConnectionStrings["AuctionWebsite"].ConnectionString;
        SQLConnection = new SqlConnection(SQLConnectionString);

        if (Session["Username"] == null || Session["UserID"] == null) {
            return;
        }

        SQLQuery = "UPDATE PERSON_ADDRESS SET STREET = '" + Street.Text.Trim() + "', CITY = '" + City.Text.Trim() + "', STATE = '" + State.Text.Trim() + "', ZIP = '" + Zip.Text.Trim() + "' WHERE PERSON_ID = '" + Session["UserID"] + "'";
        SQLCommand = new SqlCommand(SQLQuery, SQLConnection);
        SQLConnection.Open();
        SQLCommand.ExecuteNonQuery();
        SQLConnection.Close();

        Server.Transfer("HomeView.aspx");
    }
}