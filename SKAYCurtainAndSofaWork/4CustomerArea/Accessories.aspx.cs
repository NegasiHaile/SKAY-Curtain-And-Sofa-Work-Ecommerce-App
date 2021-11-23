using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _4CustomerArea_Accessories : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;

    public string Acce_Id;
    public string Acce_Type;
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!IsPostBack)
            {
                FetchAccessories();
            }
            if(Request.QueryString["Id"] != "")
            {
                FetchAccessoriesDetail(Request.QueryString["Id"]);
            }
            divAlertSuccess.Visible = false;
            divAlertError.Visible = false;
        
    }
    private void FetchAccessories()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_FetchAccessories = new SqlCommand("SELECT * FROM Accessories ORDER BY Acce_Type DESC", Con);
            SqlDataAdapter sda_FetchAccessories = new SqlDataAdapter(cmd_FetchAccessories);
            DataTable dt_FetchAccessories = new DataTable();
            sda_FetchAccessories.Fill(dt_FetchAccessories);

            rptrAllAccessories.DataSource = dt_FetchAccessories;
            rptrAllAccessories.DataBind();

        }
    }

    private void FetchAccessoriesDetail( string id)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            if (Request.QueryString["Id"] != "")
            {
                SqlCommand cmd_fetchSampleDetail = new SqlCommand("SELECT * FROM Accessories WHERE Id='" + id + "'", Con);
                SqlDataAdapter sda_fetchSampleDetail = new SqlDataAdapter(cmd_fetchSampleDetail);
                DataTable dt_fetchSampleDetail = new DataTable();
                sda_fetchSampleDetail.Fill(dt_fetchSampleDetail);

                try
                {
                    if(dt_fetchSampleDetail.Rows.Count == 1)
                    {

                        divAcceDetail.Visible = true;
                        Acce_Id = dt_fetchSampleDetail.Rows[0][0].ToString();
                        Acce_Type = dt_fetchSampleDetail.Rows[0][1].ToString();
                        spnAcceSpecialName.InnerText = dt_fetchSampleDetail.Rows[0][2].ToString();
                        spnAccePrice.InnerText = dt_fetchSampleDetail.Rows[0][3].ToString();
                        spnAcceAvailability.InnerText = dt_fetchSampleDetail.Rows[0][4].ToString();
                        spnHowMuchLove.InnerText = dt_fetchSampleDetail.Rows[0][6].ToString();
                        //rptrAcceItemDetail.DataSource = dt_fetchSampleDetail;
                        //rptrAcceItemDetail.DataBind();
                    }
                    else
                    {
                        divAcceDetail.Visible = false;
                    }
                }
                catch
                {

                }
            }
        }
        }

    protected void lbtnAddAcceItemToCart_Click(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {
            using (SqlConnection Con = new SqlConnection(CS))
        {
            string LogedInCustomer = Session["UserPhoneNumber"].ToString();

            SqlCommand cmd_CeckItemIncart = new SqlCommand("SELECT * FROM Cart WHERE Custom_Phone_Number='" + LogedInCustomer + "' AND Material_Id='" + Acce_Id + "' AND Cart_Status NOT IN ('Ordered')", Con);
            SqlDataAdapter sda_CeckItemIncart = new SqlDataAdapter(cmd_CeckItemIncart);
            DataTable dt_CeckItemIncart = new DataTable();
            sda_CeckItemIncart.Fill(dt_CeckItemIncart);

            if (dt_CeckItemIncart.Rows.Count == 0)
            {

                SqlCommand Cmd_InsertAcceToCart = new SqlCommand(
                                    "INSERT INTO Cart (Custom_Phone_Number, Material_Id, Model_Id, Target_Task, Item_Quantity, TotalMeter_WindowWidth, Tailor_Function, Drill_Malbes_Function, TotalPrice, Cart_Description,  Cart_Status) " +
                                    "Values(@Custom_Phone_Number, @Material_Id, @Model_Id, @Target_Task, @Item_Quantity, @TotalMeter_WindowWidth, @Tailor_Function, @Drill_Malbes_Function, @TotalPrice, @Cart_Description, @Cart_Status)", Con);
                Cmd_InsertAcceToCart.Parameters.Add("@Custom_Phone_Number",
                    SqlDbType.NVarChar, 13).Value = LogedInCustomer;
                Cmd_InsertAcceToCart.Parameters.Add("@Material_Id",
                    SqlDbType.NVarChar, 15).Value = Acce_Id.ToString();
                Cmd_InsertAcceToCart.Parameters.Add("@Model_Id",
                    SqlDbType.NVarChar, 6).Value = Acce_Id.ToString();
                Cmd_InsertAcceToCart.Parameters.Add("@Target_Task",
                    SqlDbType.NVarChar, 10).Value = Acce_Type;
                Cmd_InsertAcceToCart.Parameters.Add("@Item_Quantity",
                    SqlDbType.Int).Value = int.Parse(tbAcceQuantity.Text);
                Cmd_InsertAcceToCart.Parameters.Add("@TotalMeter_WindowWidth",
                    SqlDbType.NVarChar, 10).Value = tbAcceQuantity.Text;
                Cmd_InsertAcceToCart.Parameters.Add("@Tailor_Function",
                    SqlDbType.NVarChar, 15).Value = "No";
                Cmd_InsertAcceToCart.Parameters.Add("@Drill_Malbes_Function",
                    SqlDbType.NVarChar, 15).Value = "No";
                Cmd_InsertAcceToCart.Parameters.Add("@TotalPrice",
                    SqlDbType.Float).Value = float.Parse(hfTotalPrice.Value);
                Cmd_InsertAcceToCart.Parameters.Add("@Cart_Description",
                    SqlDbType.Text).Value = "";
                Cmd_InsertAcceToCart.Parameters.Add("@Cart_Status",
                    SqlDbType.NVarChar, 13).Value = "Complete";
                Con.Open();
                Cmd_InsertAcceToCart.ExecuteNonQuery();
                Con.Close();
                
                divAlertSuccess.Visible = true;
            }
            else
            {
                divAlertError.Visible = true;
                spnAlertError.InnerHtml = "<i class='fa fa-times-circle'></i> This item is already in your cart.";
            }
            }

        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
}