using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _2AdminArea_AdminHome : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public int totalFeedBacks;
    public int totalOrders;
    public int totalCurtains;
    public int totalSofas;
    public int totalAcce;
    public int totalCustomers;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Super Admin")
        {

            fetchCurtainClothes();
            fetchSofaClothes();
            fetchAcce();
            fetchCustomers();
            fetchOrders();
            fetchFeedBacks();

        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }

    }
    private void fetchCurtainClothes()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_Curtains = new SqlCommand("Select * FROM SofaCloths Where ClothCatagory='Curtain' ", Con);
            SqlDataAdapter sda_Curtains = new SqlDataAdapter(Cmd_Curtains);
            DataTable dt_Curtains = new DataTable();
            sda_Curtains.Fill(dt_Curtains);

            totalCurtains = dt_Curtains.Rows.Count;
        }
    }
    private void fetchSofaClothes()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_Sofa = new SqlCommand("Select * FROM SofaCloths Where ClothCatagory='Sofa' ", Con);
            SqlDataAdapter sda_Sofa = new SqlDataAdapter(Cmd_Sofa);
            DataTable dt_Sofa = new DataTable();
            sda_Sofa.Fill(dt_Sofa);

            totalSofas = dt_Sofa.Rows.Count;
        }
    }
    private void fetchAcce()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetchAcce = new SqlCommand("Select * FROM Accessories", Con);
            SqlDataAdapter sda_FetchAcce = new SqlDataAdapter(Cmd_FetchAcce);
            DataTable dt_FetchAcce = new DataTable();
            sda_FetchAcce.Fill(dt_FetchAcce);

            totalAcce = dt_FetchAcce.Rows.Count;
        }
    }
    private void fetchCustomers()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetchCustomers = new SqlCommand("Select * FROM Customers", Con);
            SqlDataAdapter sda_FetchCustomers = new SqlDataAdapter(Cmd_FetchCustomers);
            DataTable dt_FetchCustomers = new DataTable();
            sda_FetchCustomers.Fill(dt_FetchCustomers);

            totalCustomers = dt_FetchCustomers.Rows.Count;
        }
    }
    private void fetchOrders()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetcOrders = new SqlCommand("Select * FROM Orders", Con);
            SqlDataAdapter sda_FetcOrders = new SqlDataAdapter(Cmd_FetcOrders);
            DataTable dt_FetcOrders = new DataTable();
            sda_FetcOrders.Fill(dt_FetcOrders);

            totalOrders = dt_FetcOrders.Rows.Count;
        }
    }
    private void fetchFeedBacks()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetcFeedBacksData = new SqlCommand("Select * From FeedBacks  Order by Id DESC", Con);
            SqlDataAdapter sda_FetcFeedBacksData = new SqlDataAdapter(Cmd_FetcFeedBacksData);
            DataTable dt_FetcFeedBacksData = new DataTable();
            sda_FetcFeedBacksData.Fill(dt_FetcFeedBacksData);

            totalFeedBacks = dt_FetcFeedBacksData.Rows.Count;
            rptrFeedBacksList.DataSource = dt_FetcFeedBacksData;
            rptrFeedBacksList.DataBind();
        }
    }
    protected void lbtnDeleteFeedBack_Click(object sender, EventArgs e)
    { //< asp:Label ID = "lblHelpId" CssClass = "d-none" runat = "server" Text = '<%# Eval("Id") %>' >
        LinkButton lbtnDeletefeedback = sender as LinkButton;
        string feedbackId = lbtnDeletefeedback.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeleteFeedBack = new SqlCommand("DELETE FROM FeedBacks WHERE Id='" + feedbackId + "'", Con);

            Con.Open();
            cmd_DeleteFeedBack.ExecuteNonQuery();
            Con.Close();

            fetchFeedBacks();
        }
    }
}