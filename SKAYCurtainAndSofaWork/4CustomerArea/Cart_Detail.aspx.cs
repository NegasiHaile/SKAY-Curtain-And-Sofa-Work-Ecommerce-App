using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

public partial class _4CustomerArea_Cart_Detail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string Cart_Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null)
        {
            Fetch_Cart_Detail();
            Fetch_SelectedItems();
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
    protected void Fetch_Cart_Detail()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_Fetch_CartDetail = new SqlCommand("SELECT * FROM SelectedItems WHERE  Cart_Id ='" + Request.QueryString["Cart_Id"].ToString() + "'", Con);
            SqlDataAdapter sda_Fetch_CartDetail= new SqlDataAdapter(cmd_Fetch_CartDetail);
            DataTable dt_Fetch_CartDetail = new DataTable();
            sda_Fetch_CartDetail.Fill(dt_Fetch_CartDetail);

            Cart_Id = Request.QueryString["Cart_Id"].ToString();

        }
    }
    protected void Fetch_SelectedItems()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_Fetch_SelectedItems = new SqlCommand("SELECT * FROM SelectedItems WHERE  Cart_Id ='" + Request.QueryString["Cart_Id"].ToString() + "'", Con);
            SqlDataAdapter sda_Fetch_SelectedItems = new SqlDataAdapter(cmd_Fetch_SelectedItems);
            DataTable dt_Fetch_SelectedItems= new DataTable();
            sda_Fetch_SelectedItems.Fill(dt_Fetch_SelectedItems);

            rptrSelectedItems.DataSource = dt_Fetch_SelectedItems;
            rptrSelectedItems.DataBind();
        }
    }
}