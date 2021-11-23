using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _3EmployeeArea_UndeliveredOrders : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string totalOrders = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserPhoneNumber"] != null)
        {
            if (!IsPostBack)
            {
                FetchOrders();
            }
            divAlertSuccess.Visible = false;
            divAlertError.Visible = false;
        }

        else
        {
            Response.Redirect("../1PublicArea/LogIn.aspx");
        }
    }
    private void FetchOrders()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fatchOrders = new SqlCommand("SELECT * FROM Orders INNER JOIN Customers ON Orders.Custom_Phone_Number = Customers.PhoneNumber ORDER BY Orders.Order_Id DESC", Con);
            SqlDataAdapter sda_fatchOrders = new SqlDataAdapter(cmd_fatchOrders);
            DataTable dt_fatchOrders = new DataTable();
            sda_fatchOrders.Fill(dt_fatchOrders);

            if (dt_fatchOrders.Rows.Count != 0)
            {
                totalOrders = dt_fatchOrders.Rows[0][1].ToString();
                rptrOrders.DataSource = dt_fatchOrders;
                rptrOrders.DataBind();
            }
        }
    }

    protected void rptrOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        //if(e.Item.ItemType == ListItemType.Footer)
        //{
        //    ((Label)e.Item.FindControl("lblTotalOrders")).Text = totalOrders;
        //}
        Label CustomPhone = e.Item.FindControl("lblCustomPhoneNo") as Label;
        Repeater rptrCarts = e.Item.FindControl("rptrCartsPerOrder") as Repeater;

        DataTable dt = new DataTable();
        dt = vw_CartsPerOrder(CustomPhone.Text);
        rptrCarts.DataSource = dt;
        rptrCarts.DataBind();
    }

    public DataTable vw_CartsPerOrder(string CustomPhone)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            //SqlCommand cmd_fatchCartsPerOrder = new SqlCommand(, Con);

            DataTable dt_fatchCartsPerOrder = new DataTable();
            SqlDataAdapter sda_fatchCartsPerOrder = new SqlDataAdapter("SELECT * FROM Cart WHERE  Custom_Phone_Number='" + CustomPhone + "'", Con);
            sda_fatchCartsPerOrder.Fill(dt_fatchCartsPerOrder);

            return dt_fatchCartsPerOrder;
        }
    }
    protected void rptrCartsPerOrder_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label CartId = e.Item.FindControl("lblCartId") as Label;
        Repeater rptrCart = e.Item.FindControl("rptrSelecetedItems") as Repeater;

        DataTable dtCart = new DataTable();
        dtCart = vw_Cart(CartId.Text);
        rptrCart.DataSource = dtCart;
        rptrCart.DataBind();
    }

    public DataTable vw_Cart(string CartId)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            //SqlCommand cmd_fatchCartsPerOrder = new SqlCommand(, Con);

            DataTable dt_fatchCart = new DataTable();
            SqlDataAdapter sda_fatchCart = new SqlDataAdapter("SELECT * FROM SelectedItems WHERE  Cart_Id='" + CartId + "'", Con);
            sda_fatchCart.Fill(dt_fatchCart);

            return dt_fatchCart;
        }
    }

}