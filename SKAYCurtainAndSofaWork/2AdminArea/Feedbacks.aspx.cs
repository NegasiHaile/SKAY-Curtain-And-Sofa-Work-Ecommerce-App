using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _2AdminArea_Feedbacks : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public int totalFeedBacks;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Super Admin")
        {
            fetchFeedBacks();
            ChencgeFeedBackStatus();
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }

    private void fetchFeedBacks()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetcFeedBacksData = new SqlCommand("Select * From FeedBacks WHERE Status='New'  Order by Id DESC", Con);
            SqlDataAdapter sda_FetcFeedBacksData = new SqlDataAdapter(Cmd_FetcFeedBacksData);
            DataTable dt_FetcFeedBacksData = new DataTable();
            sda_FetcFeedBacksData.Fill(dt_FetcFeedBacksData);

            totalFeedBacks = dt_FetcFeedBacksData.Rows.Count;
            rptrFeedBacksList.DataSource = dt_FetcFeedBacksData;
            rptrFeedBacksList.DataBind();
        }
    }

    protected void ChencgeFeedBackStatus()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {

            SqlCommand cmd_Update_FeedBackStatus = new SqlCommand("UPDATE FeedBacks SET Status='Seen' WHERE Status='New'", Con);
            
            Con.Open();
            cmd_Update_FeedBackStatus.ExecuteNonQuery();
            Con.Close();
        }
    }

}