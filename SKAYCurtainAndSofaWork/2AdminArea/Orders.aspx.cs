using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _2AdminArea_Orders : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string totalOrders = "";
    protected void Page_Load(object sender, EventArgs e)
    {
            if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Super Admin")
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
                Response.Redirect("../4CustomerArea/LogIn.aspx");
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

            if(dt_fatchOrders.Rows.Count != 0)
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

    protected void lbtnPrePayPaid_Click(object sender, EventArgs e)
    {

        RepeaterItem Item = (sender as LinkButton).NamingContainer as RepeaterItem;
        string OrderId = (Item.FindControl("lblOrderId") as Label).Text;
        string TotalPrice = (Item.FindControl("lblTotalPriceToPay") as Label).Text;
        string HOldingAmount = (Item.FindControl("tbHoldingAmount") as TextBox).Text;
        string Pay_status = "Holding-Paid";
        if (float.Parse(HOldingAmount) == 0)
        {
            Pay_status = "New";
        }
        using (SqlConnection Con = new SqlConnection(CS))
        {

            SqlCommand cmd_UpdateHolding = new SqlCommand("UPDATE Orders SET Holding_Amount=@Holding_Amount, Left_Amount=@Left_Amount, Payment_Status=@Payment_Status WHERE Order_Id='" + OrderId + "'", Con);

            //cmd_FunctionsPrice.Parameters.Add("@FunctionName",
            //    SqlDbType.NVarChar, 25).Value = FunctionName;
            cmd_UpdateHolding.Parameters.Add("@Holding_Amount",
                SqlDbType.Float).Value = float.Parse(HOldingAmount);
            cmd_UpdateHolding.Parameters.Add("@Left_Amount",
                SqlDbType.Float).Value = float.Parse(TotalPrice) - float.Parse(HOldingAmount);
            cmd_UpdateHolding.Parameters.Add("@Payment_Status",
                SqlDbType.NVarChar, 300).Value = Pay_status;

            Con.Open();
            cmd_UpdateHolding.ExecuteNonQuery();
            Con.Close();

            FetchOrders();
            divAlertSuccess.Visible = true;
            spnAlertSuccess.InnerText = "Successfuly updated" + OrderId + " ," + HOldingAmount + TotalPrice;
        }
    }
    protected void lbtnLeftAmountPaid_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            RepeaterItem Item = (sender as LinkButton).NamingContainer as RepeaterItem;
            string OrderId = (Item.FindControl("lblOrderId") as Label).Text;


            SqlCommand cmd_UpdateLeftAmount = new SqlCommand("UPDATE Orders SET Payment_Status=@Payment_Status WHERE Order_Id='" + OrderId + "'", Con);
            
            cmd_UpdateLeftAmount.Parameters.Add("@Payment_Status",
                SqlDbType.NVarChar, 300).Value = "Fully Covered";

            Con.Open();
            cmd_UpdateLeftAmount.ExecuteNonQuery();
            Con.Close();

            FetchOrders();
            divAlertSuccess.Visible = true;
            spnAlertSuccess.InnerHtml = "<i class='fa fa-check-circle'></i> Successfuly Covered!";
        }
    }
    protected void lbtnAppointment_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            RepeaterItem Item = (sender as LinkButton).NamingContainer as RepeaterItem;
            string OrderId = (Item.FindControl("lblOrderId") as Label).Text;
            string Appointmentdate = (Item.FindControl("tbAppoointment") as TextBox).Text;


            SqlCommand cmd_SetUppointment = new SqlCommand("UPDATE Orders SET Appointmet_Date=@Appointmet_Date WHERE Order_Id='" + OrderId + "'", Con);

            cmd_SetUppointment.Parameters.Add("@Appointmet_Date",
                SqlDbType.NVarChar, 20).Value = Appointmentdate;

            Con.Open();
            cmd_SetUppointment.ExecuteNonQuery();
            Con.Close();

            FetchOrders();
            divAlertSuccess.Visible = true;
            spnAlertSuccess.InnerHtml = "<i class='fa fa-check-circle'></i> Appointment successfuly sate!";
        }
    }

    protected void lbtnAcceptOrder_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            RepeaterItem Item = (sender as LinkButton).NamingContainer as RepeaterItem;
            string OrderId = (Item.FindControl("lblOrderId") as Label).Text;
            string Order_Comment = (Item.FindControl("tbOrderId") as TextBox).Text;

            SqlCommand cmd_AcceptOrder = new SqlCommand("UPDATE Orders SET Order_Status=@Order_Status, Comment=@Comment WHERE Order_Id='" + OrderId + "'", Con);
            cmd_AcceptOrder.Parameters.Add("@Order_Status",
                SqlDbType.NVarChar, 25).Value = "Accepted";
            cmd_AcceptOrder.Parameters.Add("@Comment",
                SqlDbType.NVarChar, 200).Value = Order_Comment;

            Con.Open();
            cmd_AcceptOrder.ExecuteNonQuery();
            Con.Close();

            divAlertSuccess.Visible = true;
            spnAlertSuccess.InnerHtml = "<i class='fa fa-check-circle'></i> Order successfuly accepted!";
        }
    }
    protected void lbtnRejectOrder_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            RepeaterItem Item = (sender as LinkButton).NamingContainer as RepeaterItem;
            string OrderId = (Item.FindControl("lblOrderId") as Label).Text;
            string Order_Comment = (Item.FindControl("tbOrderId") as TextBox).Text;

            SqlCommand cmd_AcceptOrder = new SqlCommand("UPDATE Orders SET Order_Status=@Order_Status, Comment=@Comment WHERE Order_Id='" + OrderId + "'", Con);
            cmd_AcceptOrder.Parameters.Add("@Order_Status",
                SqlDbType.NVarChar, 25).Value = "Rejected";
            cmd_AcceptOrder.Parameters.Add("@Comment",
                SqlDbType.NVarChar, 200).Value = Order_Comment;

            Con.Open();
            cmd_AcceptOrder.ExecuteNonQuery();
            Con.Close();

            divAlertSuccess.Visible = true;
            spnAlertSuccess.InnerHtml = "<i class='fa fa-times-circle'></i> Order successfuly Rejected!";
        }
    }
}