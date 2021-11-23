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

public partial class _2AdminArea_SofaDetailDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string ClothCatagory;
    public string SofaClothIdNumber;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null)
        {
            SofaClothIdNumber = Request.QueryString["IdNumber"].ToString();
            if (!IsPostBack)
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;
                

                //string data = Request.QueryString["IdNumber"].ToString();
                //string[] dArr = data.Split(',');

                //SofaClothIdNumber = dArr[1];

                FetchSofaDetail();
            }
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }

            
    }

    private void FetchSofaDetail()
    {

        using(SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchSofaDetail = new SqlCommand("SELECT * FROM SofaCloths WHERE IdNumber='" + Request.QueryString["IdNumber"].ToString() + "'", Con);
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
                if (dt_FunctionsPrices.Rows[i][1].ToString() == "Drape Tailor")
                {
                    pDrapeTailorPricePerMeter.InnerText = dt_FunctionsPrices.Rows[i][2].ToString() + " ETB";
                    continue;
                }
                if (dt_FunctionsPrices.Rows[i][1].ToString() == "Sofa Tailor")
                {
                    pSofaTailor.InnerText = dt_FunctionsPrices.Rows[i][2].ToString() + " ETB";
                    continue;
                }
            }


           

            pAvlblWidth.InnerText = dt_fetchSofaDetail.Rows[0][1].ToString() +" ሜ";
            pAvlblStandardHeight.InnerText = dt_fetchSofaDetail.Rows[0][2].ToString() + " ሜ";

            pSofaClothPricePerMeter.InnerText = dt_fetchSofaDetail.Rows[0][4].ToString() + " ETB";
            pDrapeGeberPricePerMeter.InnerText = dt_fetchSofaDetail.Rows[0][5].ToString() + " ETB";
            

            pSofaName_Color.InnerText = dt_fetchSofaDetail.Rows[0][3].ToString();
           // pTotalPricePerMeter.InnerText = (fsofaprice + fsofaTailorPrice).ToString() + " ETB";
            pSofaClothDescription.InnerText = dt_fetchSofaDetail.Rows[0][6].ToString();
            pClothCatagory.InnerText = dt_fetchSofaDetail.Rows[0][9].ToString() + " ጨርቅ";
            pClothUsesFor.InnerText = dt_fetchSofaDetail.Rows[0][10].ToString();
            pHow_Many_Users.InnerText = dt_fetchSofaDetail.Rows[0][8].ToString() +" ሰዎች";

            tbSofaWidth.Text = dt_fetchSofaDetail.Rows[0][1].ToString();
            tbSofaHeight.Text = dt_fetchSofaDetail.Rows[0][2].ToString();
            tbSofaName_Color.Text = dt_fetchSofaDetail.Rows[0][3].ToString();
            tbSofaPricePerMeter.Text = dt_fetchSofaDetail.Rows[0][4].ToString();
            tbDrapeInnerPricePerMeter.Text = dt_fetchSofaDetail.Rows[0][5].ToString();
            ddlClotheUsesFor.Text = dt_fetchSofaDetail.Rows[0][10].ToString();
            tbSofaDescription.Value = dt_fetchSofaDetail.Rows[0][6].ToString();

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



    protected void lbtnDeleteSofaItem_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchSofaDetail = new SqlCommand("DELETE FROM SofaCloths WHERE IdNumber='" + Request.QueryString["IdNumber"].ToString() + "'", Con);

            Con.Open();
            cmd_fetchSofaDetail.ExecuteNonQuery();
            Con.Close();

            Response.Redirect("SofaClothRegistration.aspx");
        }
        }

    protected void lbtnSaveSofaChange_Click(object sender, EventArgs e)
    {
        //Button btn = sender as Button;
        //Session["DATA"] = btn.CommandArgument.ToString();

        //string sessionData = (string)Session["DATA"];
        //tbSofaName_Color.Text = sessionData;

        using(SqlConnection Con = new SqlConnection(CS))
        {
            if (fupldSofaClothImage.HasFile)
            {
                Byte[] bytes = null;

                string filename = fupldSofaClothImage.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldSofaClothImage.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand cmd_UpdateSofaCloth = new SqlCommand("UPDATE SofaCloths SET Width=@Width, Height=@Height, Name_Color=@Name_Color, PricePerMeter=@PricePerMeter, GeberPricePerMeter=@GeberPricePerMeter, Description=@Description, Photo=@Photo, SubCatagory=@SubCatagory WHERE IdNumber='" + Request.QueryString["IdNumber"].ToString() + "'", Con);

                cmd_UpdateSofaCloth.Parameters.Add("@Width", 
                    SqlDbType.Float).Value = float.Parse(tbSofaWidth.Text);
                cmd_UpdateSofaCloth.Parameters.Add("@Height", 
                    SqlDbType.Float).Value = float.Parse(tbSofaHeight.Text);
                cmd_UpdateSofaCloth.Parameters.Add("@Name_Color", 
                    SqlDbType.NVarChar, 50).Value = tbSofaName_Color.Text;
                cmd_UpdateSofaCloth.Parameters.Add("@PricePerMeter", 
                    SqlDbType.Float).Value = float.Parse(tbSofaPricePerMeter.Text);
                cmd_UpdateSofaCloth.Parameters.Add("@GeberPricePerMeter", 
                    SqlDbType.Float).Value = float.Parse(tbDrapeInnerPricePerMeter.Text);
                cmd_UpdateSofaCloth.Parameters.Add("@Photo", 
                    SqlDbType.Binary).Value = bytes;
                cmd_UpdateSofaCloth.Parameters.Add("@Description", 
                    SqlDbType.NVarChar, 101).Value = tbSofaDescription.Value;
                cmd_UpdateSofaCloth.Parameters.Add("@SubCatagory", 
                    SqlDbType.NVarChar, 20).Value = ddlClotheUsesFor.SelectedItem.Value;

                Con.Open();
                cmd_UpdateSofaCloth.ExecuteNonQuery();
                Con.Close();

                FetchSofaDetail();
                divAlertSuccess.Visible = true;


            }

            else
            {
                SqlCommand cmd_UpdateSofaCloth = new SqlCommand("UPDATE SofaCloths SET Width=@Width, Height=@Height, Name_Color=@Name_Color, PricePerMeter=@PricePerMeter, GeberPricePerMeter=@GeberPricePerMeter, Description=@Description, SubCatagory=@SubCatagory  WHERE IdNumber='" + Request.QueryString["IdNumber"].ToString() + "'", Con);

                cmd_UpdateSofaCloth.Parameters.Add("@Width", SqlDbType.Float).Value = float.Parse(tbSofaWidth.Text);
                cmd_UpdateSofaCloth.Parameters.Add("@Height", SqlDbType.Float).Value = float.Parse(tbSofaHeight.Text);
                cmd_UpdateSofaCloth.Parameters.Add("@Name_Color", SqlDbType.NVarChar, 50).Value = tbSofaName_Color.Text;
                cmd_UpdateSofaCloth.Parameters.Add("@PricePerMeter", SqlDbType.Float).Value = float.Parse(tbSofaPricePerMeter.Text);
                cmd_UpdateSofaCloth.Parameters.Add("@GeberPricePerMeter", SqlDbType.Float).Value = float.Parse(tbDrapeInnerPricePerMeter.Text);
                cmd_UpdateSofaCloth.Parameters.Add("@Description", SqlDbType.NVarChar, 101).Value = tbSofaDescription.Value;
                cmd_UpdateSofaCloth.Parameters.Add("@SubCatagory", SqlDbType.NVarChar, 20).Value = ddlClotheUsesFor.SelectedItem.Value;

                Con.Open();
                cmd_UpdateSofaCloth.ExecuteNonQuery();
                Con.Close();

                FetchSofaDetail();

                divAlertSuccess.Visible = true;
            }
            
        }

    }
}

//SqlCommand commandPhoto = new SqlCommand("UPDATE tblImage SET ImageName = @ImageName, Image = @Image WHERE ReferenceID ='" + tbTrafficPhoneNo.Text + "'", con);
//commandPhoto.Parameters.Add("@ImageName",
//                        SqlDbType.NVarChar, 20).Value = tbTrafficFName.Text + " " + tbTrafficMName.Text + " " + tbTrafficLName.Text;
//                        commandPhoto.Parameters.Add("@Image",
//                        SqlDbType.Binary).Value = bytes;
//                        commandPhoto.Parameters.Add("@ReferenceID",
//                        SqlDbType.NVarChar, 20).Value = tbTrafficPhoneNo.Text;