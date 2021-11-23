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

public partial class _4CustomerArea_CustomerArea : System.Web.UI.MasterPage
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string ItemsInCart;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {

            divBeforeLogIn.Visible = false;
            divAfterLogIn.Visible = true;
            divCart.Visible = true;

            GetNumberOfItemsInCart();
            if (!IsPostBack)
            {
                //getSofaSamples();
            }
        }
        else
        {

            divCart.Visible = false;
            divAfterLogIn.Visible = false;
            divBeforeLogIn.Visible = true;
        }
    }

    private void GetNumberOfItemsInCart()
    {
        string LoggedInUser = Session["UserPhoneNumber"].ToString();
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_GetNumberOfItemsInCart = new SqlCommand("SELECT * FROM Cart WHERE Custom_Phone_Number='" + LoggedInUser + "' AND Cart_Status NOT IN ('Ordered')", Con);
            SqlDataAdapter sda_GetNumberOfItemsInCart = new SqlDataAdapter(cmd_GetNumberOfItemsInCart);
            DataTable dt_GetNumberOfItemsInCart = new DataTable();
            sda_GetNumberOfItemsInCart.Fill(dt_GetNumberOfItemsInCart);

            ItemsInCart = dt_GetNumberOfItemsInCart.Rows.Count.ToString();
        }
        }


    protected void lbtnLogOut_Click(object sender, EventArgs e)
    {
        Session["UserPhoneNumber"] = null;
        Response.Redirect("../4CustomerArea/LogIn.aspx");
    }
}
