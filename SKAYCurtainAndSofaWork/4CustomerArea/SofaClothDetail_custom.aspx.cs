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
public partial class _4CustomerArea_SofaClothDetail_custom : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;

    SqlDataReader dr;
    public string SofaClothIdNumber;
    public string ClothCatagory;
    string ItemPricePermeter;

    protected void Page_Load(object sender, EventArgs e)
    {
            SofaClothIdNumber = Request.QueryString["IdNumber"].ToString();
            if (!IsPostBack)
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;

                FetchSofaDetail();
                SofaInCart();
            }

    }
    protected void checkSession()
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {

        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
    protected DataTable sofaClothesQuery()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchSofaDetail = new SqlCommand("SELECT * FROM SofaCloths WHERE IdNumber='" + Request.QueryString["IdNumber"].ToString() + "'", Con);
            SqlDataAdapter sda_fetchSofaDetail = new SqlDataAdapter(cmd_fetchSofaDetail);
            DataTable dt_fetchSofaDetail = new DataTable();
            sda_fetchSofaDetail.Fill(dt_fetchSofaDetail);
            return dt_fetchSofaDetail;
        }
    }
    private void FetchSofaDetail()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            //SqlCommand cmd_fetchSofaDetail = new SqlCommand("SELECT * FROM SofaCloths WHERE IdNumber='" + Request.QueryString["IdNumber"].ToString() + "'", Con);
            //SqlDataAdapter sda_fetchSofaDetail = new SqlDataAdapter(cmd_fetchSofaDetail);
            //DataTable dt_fetchSofaDetail = new DataTable();
            //sda_fetchSofaDetail.Fill(dt_fetchSofaDetail);

            DataTable dt_fetchSofaDetail = new DataTable();
            dt_fetchSofaDetail = sofaClothesQuery();

            ClothCatagory = dt_fetchSofaDetail.Rows[0][9].ToString();
            ItemPricePermeter = dt_fetchSofaDetail.Rows[0][4].ToString();

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
                if (dt_FunctionsPrices.Rows[i][1].ToString() == "Sofa Tailor")
                {
                    pTailorPerMeter.InnerText = dt_FunctionsPrices.Rows[i][2].ToString();
                    continue;
                }
                if (dt_FunctionsPrices.Rows[i][1].ToString() == "Sofa wearing")
                {
                    spnSofaClothingPrice.InnerText = dt_FunctionsPrices.Rows[i][2].ToString();
                    continue;
                }
            }

            

            pAvlblWidth.InnerText = dt_fetchSofaDetail.Rows[0][1].ToString();
            pSofaClothPricePerMeter.InnerText = dt_fetchSofaDetail.Rows[0][4].ToString();
            pSofaName_Color.InnerText = dt_fetchSofaDetail.Rows[0][3].ToString();
            pSofaClothDescription.InnerText = dt_fetchSofaDetail.Rows[0][6].ToString();
            pHow_Many_Users.InnerText = dt_fetchSofaDetail.Rows[0][8].ToString();


            SqlCommand Cmd_FetchSofasSamples = new SqlCommand("Select Id, IdsOfTools From Samples WHERE IdsOfTools='" + Request.QueryString["IdNumber"].ToString() + "'", Con);
            SqlDataAdapter sda_FetchSofasSamples = new SqlDataAdapter(Cmd_FetchSofasSamples);
            DataTable dt_FetchSofasSamples = new DataTable();
            sda_FetchSofasSamples.Fill(dt_FetchSofasSamples);

            rptrcarouselExampleIndicators.DataSource = dt_FetchSofasSamples;
            rptrcarouselExampleIndicators.DataBind();

            rptrSofaSamples.DataSource = dt_FetchSofasSamples;
            rptrSofaSamples.DataBind();
        }
    }
    private void SofaInCart()
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {
                SqlCommand cmd_CheckCustomRequirment = new SqlCommand("SELECT * FROM Cart WHERE Custom_Phone_Number='" + Session["UserPhoneNumber"].ToString() + "'AND Target_Task='Sofa' AND Cart_Status NOT IN ('Ordered')", Con);
                SqlDataAdapter sda_CheckCustomRequirment = new SqlDataAdapter(cmd_CheckCustomRequirment);
                DataTable dt_CheckCustomRequirment = new DataTable();
                sda_CheckCustomRequirment.Fill(dt_CheckCustomRequirment);

                if (dt_CheckCustomRequirment.Rows.Count == 0)
                {
                    getSofaSamples();
                    divSofaInCart.Visible = true;
                }
                else
                {
                    divSofaInCart.Visible = false;
                }
            }
        }
        else
        {
            getSofaSamples();
            divSofaInCart.Visible = true;
        }  
    }
    protected void btnSofaItemAddToCart_Click(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_CheckCustomRequirment = new SqlCommand("SELECT * FROM Cart WHERE Custom_Phone_Number='" + Session["UserPhoneNumber"].ToString() + "'AND Target_Task='Sofa' AND Cart_Status NOT IN ('Ordered')", Con);
            SqlDataAdapter sda_CheckCustomRequirment = new SqlDataAdapter(cmd_CheckCustomRequirment);
            DataTable dt_CheckCustomRequirment = new DataTable();
            sda_CheckCustomRequirment.Fill(dt_CheckCustomRequirment);

            if(dt_CheckCustomRequirment.Rows.Count != 0)
            {
                string cart_Id = dt_CheckCustomRequirment.Rows[0][0].ToString();
                string SelectedItems = dt_CheckCustomRequirment.Rows[0][2].ToString();
                string[] SelectedItemsId = SelectedItems.Split(',');
                float PrePrice = float.Parse(dt_CheckCustomRequirment.Rows[0][9].ToString());

                string byHowManyMaterial = dt_CheckCustomRequirment.Rows[0][5].ToString();
                
                    if (SelectedItemsId.Length != (int.Parse(byHowManyMaterial) + 1))
                    {
                        if (!SelectedItemsId.Contains(SofaClothIdNumber))
                    {
                        string PrevousIds = dt_CheckCustomRequirment.Rows[0][2].ToString();

                        SqlCommand cmd_UpdtC_Material_id = new SqlCommand("UPDATE Cart SET Material_Id=@Material_Id, TotalPrice=@TotalPrice, Cart_status=@Cart_status WHERE Custom_Phone_Number='" + Session["UserPhoneNumber"].ToString() + "'AND Target_Task='Sofa' AND Cart_Status NOT IN ('Ordered')", Con);
                        cmd_UpdtC_Material_id.Parameters.Add("@Material_Id",
                            SqlDbType.NVarChar, 15).Value = SofaClothIdNumber + "," + PrevousIds;
                        cmd_UpdtC_Material_id.Parameters.Add("@TotalPrice",
                            SqlDbType.Float).Value = (float.Parse(pSofaClothPricePerMeter.InnerText) * float.Parse(tbSofaWidth.Text)) + PrePrice;
                        cmd_UpdtC_Material_id.Parameters.Add("@Cart_status",
                            SqlDbType.NVarChar, 13).Value = (SelectedItemsId.Length) + " ጨርቅ መርጠዋል";

                        SqlCommand cmd_InsertSelectedItem = new SqlCommand("INSERT INTO SelectedItems (Cart_Id, Item_Id, wndw_ClothSofa_Meter, Shirink_ForWhatPartOfSofa, Price)" +
                            "Values(@Cart_Id, @Item_Id, @wndw_ClothSofa_Meter, @Shirink_ForWhatPartOfSofa, @Price)", Con);
                        cmd_InsertSelectedItem.Parameters.Add("@Cart_Id",
                            SqlDbType.Int).Value = int.Parse(cart_Id);
                        cmd_InsertSelectedItem.Parameters.Add("@Item_Id",
                            SqlDbType.NVarChar, 6).Value = SofaClothIdNumber;
                        cmd_InsertSelectedItem.Parameters.Add("@wndw_ClothSofa_Meter",
                            SqlDbType.Float).Value = float.Parse(tbSofaWidth.Text);
                        cmd_InsertSelectedItem.Parameters.Add("@Shirink_ForWhatPartOfSofa",
                            SqlDbType.NVarChar, 15).Value = ddlForWhatPartOfTheSofa.SelectedItem.Value;
                        cmd_InsertSelectedItem.Parameters.Add("@Price",
                            SqlDbType.Float).Value = float.Parse(pSofaClothPricePerMeter.InnerText) * float.Parse(tbSofaWidth.Text);

                        
                        SqlCommand cmd_Update_Sofa_Love = new SqlCommand("UPDATE SofaCloths SET How_Many_Users=@How_Many_Users WHERE IdNumber='" + Request.QueryString["IdNumber"].ToString() + "'", Con);
                        cmd_Update_Sofa_Love.Parameters.Add("@How_Many_Users",
                            SqlDbType.Int).Value = 1 + int.Parse(pHow_Many_Users.InnerText);

                        Con.Open();
                        cmd_UpdtC_Material_id.ExecuteNonQuery();
                        cmd_InsertSelectedItem.ExecuteNonQuery();
                        cmd_Update_Sofa_Love.ExecuteNonQuery();
                        Con.Close();
                        divAlertError.Visible = false;
                        divAlertSuccess.Visible = true;

                        //Response.Redirect("SofaClothDetail_custom.aspx?IdNumber=" + Request.QueryString["IdNumber"].ToString());
                    }
                    else
                    {
                        divAlertSuccess.Visible = false;
                        divAlertError.Visible = true;
                        spnAlertError.InnerHtml = "<i class='fa fa-times-circle'></i> This item is already in your list, if need to take action to it find it in <a href='Cart.aspx'>your cart </a>.";
                    }
                    }
                    else
                    {
                    divAlertSuccess.Visible = false;
                    divAlertError.Visible = true;
                    spnAlertError.InnerHtml = "<i class='fa fa-times-circle'></i> You have Selected <strong> " + byHowManyMaterial + "</strong>  Clothes. If you need to Add or Remove an item  <a href='Cart.aspx'> Go to your cart</a> and edit your choice.";
                    }
            }
            else
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = true;
                spnAlertError.InnerHtml = "<i class='fa fa-times-circle'></i> Plese Insert your choice first.";
            }
            }
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }

    private void getSofaSamples()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            Con.Open();
            SqlCommand cmd_FetchSofaSamples = new SqlCommand("SELECT * FROM Samples WHERE SampleType ='Sofa' ORDER BY Production_Date DESC", Con);
            SqlDataAdapter sda_FetchSofaSamples = new SqlDataAdapter(cmd_FetchSofaSamples);
            DataTable dt_FetchSofaSamples = new DataTable();
            sda_FetchSofaSamples.Fill(dt_FetchSofaSamples);

            rptrAllSofaSamples.DataSource = dt_FetchSofaSamples;
            rptrAllSofaSamples.DataBind();

            dr = cmd_FetchSofaSamples.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    ddlIdOfYourSofaModel.Items.Add(dr[0].ToString());
                }
            }

        }
    }
    protected void btnSaveCustomerSofaRequirment_Click(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {

        string LogedInCustomer = Session["UserPhoneNumber"].ToString();
        using (SqlConnection Con = new SqlConnection(CS))
        {

            SqlCommand cmd_CheckInCart = new SqlCommand("SELECT * FROM Cart WHERE Custom_Phone_Number ='" + LogedInCustomer + "' AND Cart_Status ='NeedsOnly'", Con);
            SqlDataAdapter da_CheckInCart = new SqlDataAdapter(cmd_CheckInCart);
            DataTable dt_CheckInCart = new DataTable();
            da_CheckInCart.Fill(dt_CheckInCart);

            if (dt_CheckInCart.Rows.Count == 0)
            {

                SqlCommand Cmd_InsertSofaRequirments = new SqlCommand(
                                "INSERT INTO Cart (Custom_Phone_Number, Model_Id, Target_Task, Item_Quantity, TotalMeter_WindowWidth, Tailor_Function, Drill_Malbes_Function, TotalPrice, Cart_Description,  Cart_Status) " +
                                "Values(@Custom_Phone_Number, @Model_Id, @Target_Task, @Item_Quantity, @TotalMeter_WindowWidth, @Tailor_Function, @Drill_Malbes_Function, @TotalPrice, @Cart_Description, @Cart_Status)", Con);
                Cmd_InsertSofaRequirments.Parameters.Add("@Custom_Phone_Number",
                    SqlDbType.NVarChar, 13).Value = LogedInCustomer;
                Cmd_InsertSofaRequirments.Parameters.Add("@Model_Id",
                    SqlDbType.NVarChar, 6).Value = ddlIdOfYourSofaModel.SelectedItem.Value.ToString();
                Cmd_InsertSofaRequirments.Parameters.Add("@Target_Task",
                    SqlDbType.NVarChar, 10).Value = "Sofa";
                Cmd_InsertSofaRequirments.Parameters.Add("@Item_Quantity",
                    SqlDbType.Int).Value = int.Parse(ddlByHowMuchClothesYourSofaToTailor.SelectedItem.Value);
                Cmd_InsertSofaRequirments.Parameters.Add("@TotalMeter_WindowWidth",
                    SqlDbType.NVarChar, 10).Value = ddlHowMuchMeterYourSofaNeed.SelectedItem.Value.ToString();
                Cmd_InsertSofaRequirments.Parameters.Add("@Tailor_Function",
                SqlDbType.NVarChar, 15).Value = findTailorFunction();
                Cmd_InsertSofaRequirments.Parameters.Add("@Drill_Malbes_Function",
                    SqlDbType.NVarChar, 15).Value = findWearingFunction();
                Cmd_InsertSofaRequirments.Parameters.Add("@TotalPrice",
                    SqlDbType.Float).Value = findPrice();
                Cmd_InsertSofaRequirments.Parameters.Add("@Cart_Description",
                    SqlDbType.Text).Value = "NONE";
                Cmd_InsertSofaRequirments.Parameters.Add("@Cart_Status",
                    SqlDbType.NVarChar, 13).Value = "ጨርቅ ኣልመረጡም";


                Con.Open();
                Cmd_InsertSofaRequirments.ExecuteNonQuery();
                Con.Close();

                Response.Redirect("SofaClothDetail_custom.aspx?IdNumber="+ (Request.QueryString["IdNumber"].ToString()));
                divAlertSuccess.Visible = true;
            }
            else
            {
                Response.Write("<script> alert(' You have uncomplete Sofa item in your cart, please complete it first! To see what you have left go to cart -> find the item -> then click detail.') </script>");
            }
        }

        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
    protected string findTailorFunction()
    {
        if(rbTailorNo.Checked)
            return "ኣይሰፋም/ጨርቅ ብቻ";
        else
            return "YES";
    }

    protected string findWearingFunction()
    {
        if (cbAlbashFeligalehu.Checked)
            return "YES";
        else
            return "NO";
    }

    protected float findPrice()
    {
        string strTailor = findTailorFunction();
        string strAslebash = findWearingFunction();

        DataTable tb_tailor_Albash = new DataTable();
        tb_tailor_Albash = find_Functions();

        float tailor = 0;
        float albash = 0;
        if(tb_tailor_Albash.Rows.Count == 2)
        {
            if (strTailor == "YES")
            {
                tailor = float.Parse(tb_tailor_Albash.Rows[0][2].ToString());
            }
            else
                tailor = 0;
            if (strAslebash == "YES")
                albash = float.Parse(tb_tailor_Albash.Rows[1][2].ToString());
            else
                albash = 0;

            return (tailor + albash);
        }
        else
            return (tailor + albash);
    }

    protected DataTable find_Functions()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {

            SqlCommand cmd_find_Functions = new SqlCommand("SELECT * FROM FunctionsPrices WHERE FunctionName='Sofa Tailor' OR FunctionName='Sofa wearing'", Con);
            SqlDataAdapter da_find_Functions = new SqlDataAdapter(cmd_find_Functions);
            DataTable dt_find_Functions = new DataTable();
            da_find_Functions.Fill(dt_find_Functions);

            return dt_find_Functions;
        }
        }
}
