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
using System.Drawing;

public partial class _4CustomerArea_MyOrder : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string totalOrders;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null)
        {
            FetchMyOrders();
            //if (!IsPostBack)
            //{
                
            //}
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }

    private void FetchMyOrders()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fatchOrders = new SqlCommand("SELECT * FROM Orders INNER JOIN Customers ON Orders.Custom_Phone_Number = Customers.PhoneNumber WHERE Customers.PhoneNumber='"+ Session["UserPhoneNumber"] .ToString()+ "' ORDER BY Orders.Order_Id DESC", Con);
            SqlDataAdapter sda_fatchOrders = new SqlDataAdapter(cmd_fatchOrders);
            DataTable dt_fatchOrders = new DataTable();
            sda_fatchOrders.Fill(dt_fatchOrders);

            if (dt_fatchOrders.Rows.Count != 0)
            {
                divInfoForNoOrder.Visible = false;
                totalOrders = dt_fatchOrders.Rows.Count.ToString();
                rptrMyOrders.DataSource = dt_fatchOrders;
                rptrMyOrders.DataBind();
            }
            else
            {
                divInfoForNoOrder.Visible = true;
            }
        }
    }

    protected void btndialogpopup_Click(object sender, EventArgs e)
    {
        string message = "Hello Friend, Please like our facebook and you will get daily updates of MVC , asp-net using c#, javascript , sql server , jquery and so on";
        string title = " Dialog modal popup on server side";

        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + message + "','" + title + "');", true);
    }

protected void ShowPopup(object sender, EventArgs e)
    {
        string title = "Greetings";
        string body = "Welcome to ASPSnippets.com";
        ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
    }
}