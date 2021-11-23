using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class _4CustomerArea_Cart : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string ItemsInCart;
    //public string CartIds= "";
    protected void Page_Load(object sender, EventArgs e)
    {
            if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
            {
                if (!IsPostBack)
                {
                    FetchCartData();
                }
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;
            }

            else
            {
                Response.Redirect("../4CustomerArea/LogIn.aspx");
            }
    }

    private void FetchCartData()
    {
        string LoggedInUser = Session["UserPhoneNumber"].ToString();
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_GetNumberOfItemsInCart = new SqlCommand("SELECT * FROM Cart WHERE Custom_Phone_Number='" + LoggedInUser + "' AND Cart_Status NOT IN ('Ordered')", Con);
            SqlDataAdapter sda_GetNumberOfItemsInCart = new SqlDataAdapter(cmd_GetNumberOfItemsInCart);
            DataTable dt_GetNumberOfItemsInCart = new DataTable();
            sda_GetNumberOfItemsInCart.Fill(dt_GetNumberOfItemsInCart);
            
            ItemsInCart = dt_GetNumberOfItemsInCart.Rows.Count.ToString();
            float ItemsInCartTotalPrice = 0;

            if (dt_GetNumberOfItemsInCart.Rows.Count != 0)
            {
                for(int i = 0; i< dt_GetNumberOfItemsInCart.Rows.Count; i++)
                {
                    string singlevalue = dt_GetNumberOfItemsInCart.Rows[i][9].ToString();
                    ItemsInCartTotalPrice = ItemsInCartTotalPrice + float.Parse(singlevalue);
                    //CartIds = CartIds + "," + dt_GetNumberOfItemsInCart.Rows[i][0].ToString();
                }
                spnCartIfo.Visible = false;
                rptrCart.DataSource = dt_GetNumberOfItemsInCart;
                rptrCart.DataBind();

                spnTotalPriceToPay.InnerText = ItemsInCartTotalPrice.ToString();
                spnPrePay.InnerText = (ItemsInCartTotalPrice / 4).ToString();
                spnAmountToPayInDeliver.InnerText = (ItemsInCartTotalPrice - (ItemsInCartTotalPrice / 4)).ToString();
            }
            else
            {
                spnCartIfo.Visible = true;
            }
        }
    }
    protected void lbtnRemoveItemFromCart_Click(object sender, EventArgs e)
    {
        LinkButton lbtnDeleteCartItem = sender as LinkButton;
        string CartId = lbtnDeleteCartItem.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeleteCartItem = new SqlCommand("DELETE FROM Cart WHERE Cart_Id='" + CartId + "'", Con);

            SqlCommand cmd_DeleteSelectedItem = new SqlCommand("DELETE FROM SelectedItems WHERE Cart_Id='" + CartId + "'", Con);

            Con.Open();
            cmd_DeleteCartItem.ExecuteNonQuery();
            cmd_DeleteSelectedItem.ExecuteNonQuery();
            Con.Close();

            Response.Redirect("Cart.aspx");

        }
    }

    protected void lbtnClearCart_Click(object sender, EventArgs e)
    {
        string LoggedInUser = Session["UserPhoneNumber"].ToString();
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_GetCarts = new SqlCommand("SELECT Cart_Id FROM Cart WHERE Custom_Phone_Number='" + LoggedInUser + "' AND Cart_Status NOT IN ('Ordered')", Con);
            SqlDataAdapter sda_GetCarts = new SqlDataAdapter(cmd_GetCarts);
            DataTable dt_GetCarts = new DataTable();
            sda_GetCarts.Fill(dt_GetCarts);

            SqlCommand cmd_ClearCart = new SqlCommand("DELETE FROM Cart WHERE Custom_Phone_Number='" + LoggedInUser + "' AND Cart_Status NOT IN ('Ordered')", Con);
            
            Con.Open();

            string cart_Id;
            for(int i=0; i < dt_GetCarts.Rows.Count; i++)
            {
                cart_Id = dt_GetCarts.Rows[i][0].ToString();
                SqlCommand cmd_ClearSelectedItem = new SqlCommand("DELETE FROM SelectedItems WHERE Cart_Id='" + cart_Id + "'", Con);
                cmd_ClearSelectedItem.ExecuteNonQuery();
            }
            // cmd_DeleteSelectedItem.ExecuteNonQuery();

            cmd_ClearCart.ExecuteNonQuery();
            Con.Close();
            
            Response.Redirect("Cart.aspx");

        }
    }
    protected void lbtnOrderCart_Click(object sender, EventArgs e)
    {
        string LogedInCustomer = Session["UserPhoneNumber"].ToString();
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_CheckPenddingOrder = new SqlCommand("SELECT * FROM Orders WHERE Custom_Phone_Number='" + LogedInCustomer + "'AND Order_Status='New' OR Order_Status='Pendding'", Con);
            SqlDataAdapter sda_CheckPenddingOrder = new SqlDataAdapter(cmd_CheckPenddingOrder);
            DataTable dt_CheckPenddingOrder = new DataTable();
            sda_CheckPenddingOrder.Fill(dt_CheckPenddingOrder);

            if(dt_CheckPenddingOrder.Rows.Count == 0)
            {
                SqlCommand cmd_fetchItemsFromCart = new SqlCommand("SELECT * FROM Cart WHERE  Custom_Phone_Number='" + LogedInCustomer + "'AND Cart_Status NOT IN ('Ordered')", Con);
                SqlDataAdapter sda_fetchItemsFromCart = new SqlDataAdapter(cmd_fetchItemsFromCart);
                DataTable dt_fetchItemsFromCart = new DataTable();
                sda_fetchItemsFromCart.Fill(dt_fetchItemsFromCart);

                
                int leng = dt_fetchItemsFromCart.Rows.Count;
                if (leng != 0)
                {
                    float totalPrice = float.Parse(dt_fetchItemsFromCart.Rows[0][9].ToString());
                    string Carts = dt_fetchItemsFromCart.Rows[0][0].ToString();
                    string Items = dt_fetchItemsFromCart.Rows[0][4].ToString();

                    for (int i = 1; i < leng; i++)
                    {
                        totalPrice = totalPrice + float.Parse(dt_fetchItemsFromCart.Rows[i][9].ToString());
                        Carts = Carts + "," + dt_fetchItemsFromCart.Rows[i][0].ToString();
                        Items = Items + "," + dt_fetchItemsFromCart.Rows[i][4].ToString();
                    }

                    //float prePay = float.Parse((totalPrice / 3).ToString());
                    //float payinDeliver = totalPrice - prePay;

                    SqlCommand cmd_UpdateCartStatus = new SqlCommand("UPDATE Cart SET Cart_Status='Ordered' WHERE Custom_Phone_Number='" + LogedInCustomer + "'AND Cart_Status NOT IN ('Ordered')", Con);
                    SqlCommand cmd_SubmiteOrder = new SqlCommand(
                                    "INSERT INTO Orders (Custom_Phone_Number, Cart_Ids, Slected_Items, Total_Price, Holding_Amount, Left_Amount, Order_Date, Order_Status, Payment_Status) " +
                                    "Values(@Custom_Phone_Number, @Cart_Ids, @Slected_Items, @Total_Price, @Holding_Amount, @Left_Amount, @Order_Date, @Order_Status, @Payment_Status)", Con);
                    cmd_SubmiteOrder.Parameters.Add("@Custom_Phone_Number",
                        SqlDbType.NVarChar, 13).Value = LogedInCustomer;
                    cmd_SubmiteOrder.Parameters.Add("@Cart_Ids",
                        SqlDbType.NVarChar, 15).Value = Carts;
                    cmd_SubmiteOrder.Parameters.Add("@Slected_Items",
                        SqlDbType.NVarChar, 50).Value = Items;
                    cmd_SubmiteOrder.Parameters.Add("@Total_Price",
                        SqlDbType.Float).Value = totalPrice;
                    cmd_SubmiteOrder.Parameters.Add("@Holding_Amount",
                        SqlDbType.Float).Value = 0.00;
                    cmd_SubmiteOrder.Parameters.Add("@Left_Amount",
                        SqlDbType.Float).Value = totalPrice;
                    cmd_SubmiteOrder.Parameters.Add("@Order_Date",
                        SqlDbType.NVarChar, 20).Value = DateTime.Now;
                    cmd_SubmiteOrder.Parameters.Add("@Order_Status",
                        SqlDbType.NVarChar, 10).Value = "New";
                    cmd_SubmiteOrder.Parameters.Add("@Payment_Status",
                        SqlDbType.NVarChar, 25).Value = "New";

                    Con.Open();
                    cmd_SubmiteOrder.ExecuteNonQuery();
                    cmd_UpdateCartStatus.ExecuteNonQuery();
                    Con.Close();
                    
                    divAlertSuccess.Visible = true;
                    spnAlertSuccess.InnerHtml = "<i class='fa fa-check-circle'></i> you successfully ordered!";
                    Response.Redirect("HowToPay.aspx");
                }
                else
                {
                    //
                }
                
            }
            else
            {
                FetchCartData();
                divAlertError.Visible = true;
                spnAlertError.InnerHtml = "<i class='fa fa-times-circle'></i> You have an order which is not Accepted yet, so you can't order another, but you can edit or delete your <a href='MyOrder.aspx'>prevous order</a>.";
            }
        }

        }
}