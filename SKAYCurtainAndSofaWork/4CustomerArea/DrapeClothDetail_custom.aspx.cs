using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;

public partial class _4CustomerArea_DrapeClothDetail_custom : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;

    public string CurtainClothIdNumber;
    public string ClothCatagory;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserPhoneNumber"] != null)
        //{
            CurtainClothIdNumber = Request.QueryString["IdNumber"].ToString();
            if (!IsPostBack)
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;

                FetchCurtainDetail();
            }
        //}

        //else
        //{
        //    Response.Redirect("../1PublicArea/LogIn.aspx");
        //}
    }

    private void FetchCurtainDetail()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchSofaDetail = new SqlCommand("SELECT * FROM SofaCloths WHERE IdNumber='" + CurtainClothIdNumber + "'", Con);
            SqlDataAdapter sda_fetchSofaDetail = new SqlDataAdapter(cmd_fetchSofaDetail);
            DataTable dt_fetchSofaDetail = new DataTable();
            sda_fetchSofaDetail.Fill(dt_fetchSofaDetail);

            ClothCatagory = dt_fetchSofaDetail.Rows[0][9].ToString();

            SqlCommand cmd_FunctionsPrices = new SqlCommand("SELECT * FROM FunctionsPrices ORDER BY FunctionName", Con);
            SqlDataAdapter sda_FunctionsPrices = new SqlDataAdapter(cmd_FunctionsPrices);
            DataTable dt_FunctionsPrices = new DataTable();
            sda_FunctionsPrices.Fill(dt_FunctionsPrices);

            int length = dt_FunctionsPrices.Rows.Count;

            for (int i = 0; i < length; i++)
            {
                if (dt_FunctionsPrices.Rows[i][1].ToString() == "Discount")
                {
                    spnDiscount.InnerText = dt_FunctionsPrices.Rows[i][2].ToString();
                    continue;
                }
                if (dt_FunctionsPrices.Rows[i][1].ToString() == " Drape Tailor")
                {
                    spnDrapeTailorPerMeter.InnerText = dt_FunctionsPrices.Rows[i][2].ToString();
                    continue;
                }
                if (dt_FunctionsPrices.Rows[i][1].ToString() == "Drilling")
                {
                    spnDrapeDrillingFor1Window.InnerText = dt_FunctionsPrices.Rows[i][2].ToString();
                    continue;
                }
            }
            spnAvlblWidth.InnerText = dt_fetchSofaDetail.Rows[0][1].ToString();
            spnDrapeOuterClothPricePerMeter.InnerText = dt_fetchSofaDetail.Rows[0][4].ToString();
            spnDrapeInnerClothPricePerMeter.InnerText = dt_fetchSofaDetail.Rows[0][5].ToString();
            pSofaName_Color.InnerText = dt_fetchSofaDetail.Rows[0][3].ToString();
            pSofaClothDescription.InnerText = dt_fetchSofaDetail.Rows[0][6].ToString();
            pHow_Many_Users.InnerText = dt_fetchSofaDetail.Rows[0][8].ToString();

            //if (dt_fetchSofaDetail.Rows[0][10].ToString() == "Outer Only")
            //{
            //    divInnerCloth.Visible = false;
            //}
            //if (dt_fetchSofaDetail.Rows[0][10].ToString() == "Inner Only")
            //{
            //    divOuterCloth.Visible = false;
            //}

            SqlCommand Cmd_FetchSofasSamples = new SqlCommand("Select Id, IdsOfTools From Samples WHERE IdsOfTools='" + CurtainClothIdNumber + "'", Con);
            SqlDataAdapter sda_FetchSofasSamples = new SqlDataAdapter(Cmd_FetchSofasSamples);
            DataTable dt_FetchSofasSamples = new DataTable();
            sda_FetchSofasSamples.Fill(dt_FetchSofasSamples);

            rptrcarouselExampleIndicators.DataSource = dt_FetchSofasSamples;
            rptrcarouselExampleIndicators.DataBind();

            rptrSofaSamples.DataSource = dt_FetchSofasSamples;
            rptrSofaSamples.DataBind();

            SqlCommand cmd_HngersDetail = new SqlCommand("SELECT * FROM Accessories WHERE Acce_Type='Hanger'", Con);
            SqlDataAdapter sda_HngersDetail = new SqlDataAdapter(cmd_HngersDetail);
            DataTable dt_HngersDetail = new DataTable();
            sda_HngersDetail.Fill(dt_HngersDetail);
            for (int i = 0; i < dt_HngersDetail.Rows.Count; i++)
            {
                if (dt_HngersDetail.Rows[i][2].ToString() == "PVC")
                {
                    spnPVCPriceHolder.InnerText = dt_HngersDetail.Rows[i][3].ToString();
                    continue;
                }
                if (dt_HngersDetail.Rows[i][2].ToString() == "Pipe")
                {
                    spnPipePriceHolder.InnerText = dt_HngersDetail.Rows[i][3].ToString();
                    continue;
                }
            }
        }
    }

    protected void btnItemAddToCart_Click(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {
        string LogedInCustomer = Session["UserPhoneNumber"].ToString();
        using (SqlConnection Con = new SqlConnection(CS))
        {
            //SqlCommand cmd_CeckItemIncart = new SqlCommand("SELECT * FROM Cart WHERE Custom_Phone_Number='" + LogedInCustomer + "' AND Material_Id='"+ CurtainClothIdNumber + "' AND Cart_Status='NoModel'", Con);
            //SqlDataAdapter sda_CeckItemIncart = new SqlDataAdapter(cmd_CeckItemIncart);
            //DataTable dt_CeckItemIncart = new DataTable();
            //sda_CeckItemIncart.Fill(dt_CeckItemIncart);

            //if(dt_CeckItemIncart.Rows.Count == 0)
            //{

            SqlCommand Cmd_InsertCurtainToCart = new SqlCommand(
                                "INSERT INTO Cart (Custom_Phone_Number, Material_Id, Target_Task, Item_Quantity, TotalMeter_WindowWidth, Tailor_Function, Drill_Malbes_Function, TotalPrice, Cart_Description,  Cart_Status) " +
                                "Values(@Custom_Phone_Number, @Material_Id, @Target_Task, @Item_Quantity, @TotalMeter_WindowWidth, @Tailor_Function, @Drill_Malbes_Function, @TotalPrice, @Cart_Description, @Cart_Status)", Con);
            Cmd_InsertCurtainToCart.Parameters.Add("@Custom_Phone_Number",
                SqlDbType.NVarChar, 13).Value = LogedInCustomer;
            Cmd_InsertCurtainToCart.Parameters.Add("@Material_Id",
                SqlDbType.NVarChar, 6).Value = CurtainClothIdNumber.ToString();
            Cmd_InsertCurtainToCart.Parameters.Add("@Target_Task",
                SqlDbType.NVarChar, 10).Value = "Curtain";
            Cmd_InsertCurtainToCart.Parameters.Add("@Item_Quantity",
                SqlDbType.Int).Value = int.Parse(tbForHowManyWindows.Text);
            Cmd_InsertCurtainToCart.Parameters.Add("@TotalMeter_WindowWidth",
                SqlDbType.NVarChar, 10).Value = tbWindowWidth.Text;
            Cmd_InsertCurtainToCart.Parameters.Add("@Tailor_Function",
                SqlDbType.NVarChar, 15).Value = hfTailorChoiceHolder.Value;
            Cmd_InsertCurtainToCart.Parameters.Add("@Drill_Malbes_Function",
                SqlDbType.NVarChar, 15).Value = hfDrillCoiceHolder.Value;
            Cmd_InsertCurtainToCart.Parameters.Add("@TotalPrice",
                SqlDbType.Float).Value = float.Parse(hfActualPriceHolder.Value);
            Cmd_InsertCurtainToCart.Parameters.Add("@Cart_Description",
                SqlDbType.Text).Value = tbItemDescription.Text;
            Cmd_InsertCurtainToCart.Parameters.Add("@Cart_Status",
                SqlDbType.NVarChar, 13).Value = "NoModel";
            Con.Open();
            Cmd_InsertCurtainToCart.ExecuteNonQuery();
            Con.Close();

            SqlCommand cmd_getCartId = new SqlCommand("SELECT MAX(Cart_Id) FROM Cart", Con);
            SqlDataAdapter sda_getCartId = new SqlDataAdapter(cmd_getCartId);
            DataTable dt_getCartId = new DataTable();
            sda_getCartId.Fill(dt_getCartId);

            string Cart_Id = dt_getCartId.Rows[0][0].ToString();

            if (dt_getCartId.Rows.Count != 0)
            {

            SqlCommand cmd_InsertSelectedItem = new SqlCommand("INSERT INTO SelectedItems (Cart_Id, Item_Id, wndw_ClothSofa_Meter, Shirink_ForWhatPartOfSofa, Price)" +
                                "Values(@Cart_Id, @Item_Id, @wndw_ClothSofa_Meter, @Shirink_ForWhatPartOfSofa, @Price)", Con);
            cmd_InsertSelectedItem.Parameters.Add("@Cart_Id",
                SqlDbType.Int).Value = int.Parse(Cart_Id);
            cmd_InsertSelectedItem.Parameters.Add("@Item_Id",
                SqlDbType.NVarChar, 6).Value = CurtainClothIdNumber;
            cmd_InsertSelectedItem.Parameters.Add("@wndw_ClothSofa_Meter",
                SqlDbType.Float).Value = float.Parse(tbWindowWidth.Text);
            cmd_InsertSelectedItem.Parameters.Add("@Shirink_ForWhatPartOfSofa",
                SqlDbType.NVarChar, 15).Value = ddlShrinkPer.SelectedItem.Value;
            cmd_InsertSelectedItem.Parameters.Add("@Price",
                SqlDbType.Float).Value = hfActualPriceHolder.Value;

            SqlCommand cmd_Update_CurtainCloth = new SqlCommand("UPDATE SofaCloths SET Width=@Width, How_Many_Users=@How_Many_Users WHERE IdNumber='" + Request.QueryString["IdNumber"].ToString() + "'", Con);
                    cmd_Update_CurtainCloth.Parameters.Add("@Width",
                        SqlDbType.Int).Value = float.Parse(spnAvlblWidth.InnerText) - ((float.Parse(tbWindowWidth.Text) * float.Parse(ddlShrinkPer.SelectedItem.Value)) * int.Parse(tbForHowManyWindows.Text));
                    cmd_Update_CurtainCloth.Parameters.Add("@How_Many_Users",
                SqlDbType.Int).Value = 1 + int.Parse(pHow_Many_Users.InnerText);

            Con.Open();
            cmd_InsertSelectedItem.ExecuteNonQuery();
            cmd_Update_CurtainCloth.ExecuteNonQuery();
            Con.Close();
            }


                divAlertSuccess.Visible = true;
                Response.Redirect("DrapeClothDetail_custom.aspx?IdNumber=" + CurtainClothIdNumber+"");
                

            //}

            //else
            //{
            //    divAlertError.Visible = true;
            //    spnAlertError.InnerHtml = "<i class='fa fa-times'></i> This Product is already in your cart.";
            //}
            }
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
}