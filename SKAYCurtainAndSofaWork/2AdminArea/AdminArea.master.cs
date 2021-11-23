using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _2AdminArea_AdminArea : System.Web.UI.MasterPage
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public int NewOrders;
    public int NewFeedBacks;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Super Admin")
        {
            fetchPendingOrders();
            fetchNewFeedBacks();
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }



    private void fetchPendingOrders()
    {
        string LogedInCustomer = Session["UserPhoneNumber"].ToString();
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_FetchNewOrders = new SqlCommand("SELECT * FROM Orders WHERE  Order_Status='New'", Con);
            SqlDataAdapter sda_FetchNewOrders = new SqlDataAdapter(cmd_FetchNewOrders);
            DataTable dt_FetchNewOrders = new DataTable();
            sda_FetchNewOrders.Fill(dt_FetchNewOrders);

            NewOrders = dt_FetchNewOrders.Rows.Count;
        }
        }
    private void fetchNewFeedBacks()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_FetchFeedBacks = new SqlCommand("SELECT * FROM FeedBacks WHERE  Status='New'", Con);
            SqlDataAdapter sda_FetchFeedBacks = new SqlDataAdapter(cmd_FetchFeedBacks);
            DataTable dt_FetchFeedBacks = new DataTable();
            sda_FetchFeedBacks.Fill(dt_FetchFeedBacks);

            NewFeedBacks = dt_FetchFeedBacks.Rows.Count;
        }
    }
    protected void lbtnLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("../4CustomerArea/LogIn.aspx");

    }
}
