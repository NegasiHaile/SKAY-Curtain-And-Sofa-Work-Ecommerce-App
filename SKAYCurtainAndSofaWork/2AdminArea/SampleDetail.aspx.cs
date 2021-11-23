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

public partial class _2AdminArea_SampleDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string SampleCatagory;
    public string SampleId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null)
        {
            SampleId = Request.QueryString["Id"].ToString();
            if (!IsPostBack)
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;


                //string data = Request.QueryString["IdNumber"].ToString();
                //string[] dArr = data.Split(',');

                //SofaClothIdNumber = dArr[1];

                FetchSampleDetail();
            }
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }

    private void FetchSampleDetail()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchSampleDetail = new SqlCommand("SELECT * FROM Samples WHERE Id='" + Request.QueryString["Id"].ToString() + "'", Con);
            SqlDataAdapter sda_fetchSampleDetail = new SqlDataAdapter(cmd_fetchSampleDetail);
            DataTable dt_fetchSampleDetail = new DataTable();
            sda_fetchSampleDetail.Fill(dt_fetchSampleDetail);


            SampleCatagory = dt_fetchSampleDetail.Rows[0][2].ToString();

            float windw_Width = float.Parse(dt_fetchSampleDetail.Rows[0][3].ToString());
            float Shirink = float.Parse(dt_fetchSampleDetail.Rows[0][4].ToString());

            spnSampleCatagory.InnerText = dt_fetchSampleDetail.Rows[0][2].ToString();
            spnSofaType.InnerText = dt_fetchSampleDetail.Rows[0][8].ToString();
            spnWindowWidth.InnerText = dt_fetchSampleDetail.Rows[0][3].ToString() + " ሜ";
            spnShirinkBy.InnerText = dt_fetchSampleDetail.Rows[0][4].ToString() + " ሜ";
            spnCurtainCatagory.InnerText = dt_fetchSampleDetail.Rows[0][8].ToString();
            spnTatolMeterItcost.InnerText = dt_fetchSampleDetail.Rows[0][3].ToString() + " ሜ";
            spnTotalCost.InnerText = dt_fetchSampleDetail.Rows[0][5].ToString() + " ETB";
            spnIdOfClothes.InnerText = dt_fetchSampleDetail.Rows[0][1].ToString();
            spnSampleDateOfProduction.InnerText = dt_fetchSampleDetail.Rows[0][7].ToString();
            string a = dt_fetchSampleDetail.Rows[0][7].ToString();

            tbMaterialIdNumbers.Text = dt_fetchSampleDetail.Rows[0][1].ToString();
            ddlSampleType.Text = dt_fetchSampleDetail.Rows[0][2].ToString();
            tbSampleSpecialName.Text = dt_fetchSampleDetail.Rows[0][8].ToString();
            tbTotalMeter.Text = dt_fetchSampleDetail.Rows[0][3].ToString();
            ddlShirrinkby.Text = dt_fetchSampleDetail.Rows[0][4].ToString();
            tbTotalCost.Text = dt_fetchSampleDetail.Rows[0][5].ToString();
        }
        }

    protected void btnSofaSaveSample_Click(object sender, EventArgs e)
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            if (fupldSampleImage.HasFile)
            {
                Byte[] bytes = null;

                string filename = fupldSampleImage.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldSampleImage.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand cmd_UpdateSampleCloth = new SqlCommand("UPDATE Samples SET IdsOfTools=@IdsOfTools, SampleType=@SampleType, ShirinkPer=@ShirinkPer, Drp_Wndw_Sf_TtlMeter=@Drp_Wndw_Sf_TtlMeter, TotalCost = TotalCost, Image=@Image, Production_Date=@Production_Date, Sample_SubCatagory=@Sample_SubCatagory WHERE Id='" + SampleId + "'", Con);
                
                cmd_UpdateSampleCloth.Parameters.Add("@IdsOfTools",
                    SqlDbType.NVarChar, 6).Value = tbMaterialIdNumbers.Text;
                cmd_UpdateSampleCloth.Parameters.Add("@SampleType",
                    SqlDbType.NVarChar, 10).Value = ddlSampleType.SelectedItem.Value;
                cmd_UpdateSampleCloth.Parameters.Add("@Drp_Wndw_Sf_TtlMeter",
                    SqlDbType.Float).Value = tbTotalMeter.Text;
                cmd_UpdateSampleCloth.Parameters.Add("@ShirinkPer",
                    SqlDbType.Float).Value = float.Parse(ddlShirrinkby.Text);
                cmd_UpdateSampleCloth.Parameters.Add("@TotalCost",
                    SqlDbType.Float).Value = float.Parse(tbTotalCost.Text);
                cmd_UpdateSampleCloth.Parameters.Add("@Image",
                    SqlDbType.Binary).Value = bytes;
                cmd_UpdateSampleCloth.Parameters.Add("@Production_Date",
                    SqlDbType.Date).Value = DateTime.Now.ToShortDateString();
                cmd_UpdateSampleCloth.Parameters.Add("@Sample_SubCatagory",
                    SqlDbType.NVarChar, 30).Value = tbSampleSpecialName.Text;

                Con.Open();
                cmd_UpdateSampleCloth.ExecuteNonQuery();
                Con.Close();

                FetchSampleDetail();

                divAlertSuccess.Visible = true;


            }

            else
            {
                SqlCommand cmd_UpdateSampleCloth = new SqlCommand("UPDATE Samples SET IdsOfTools=@IdsOfTools, SampleType=@SampleType, ShirinkPer=@ShirinkPer, Drp_Wndw_Sf_TtlMeter=@Drp_Wndw_Sf_TtlMeter, TotalCost=@TotalCost WHERE Id='" + SampleId + "'", Con);

                cmd_UpdateSampleCloth.Parameters.Add("@IdsOfTools",
                    SqlDbType.NVarChar, 6).Value = tbMaterialIdNumbers.Text;
                cmd_UpdateSampleCloth.Parameters.Add("@SampleType",
                    SqlDbType.NVarChar, 10).Value = ddlSampleType.SelectedItem.Value;
                cmd_UpdateSampleCloth.Parameters.Add("@Drp_Wndw_Sf_TtlMeter",
                    SqlDbType.Float).Value = tbTotalMeter.Text;
                cmd_UpdateSampleCloth.Parameters.Add("@ShirinkPer",
                    SqlDbType.Float).Value = float.Parse(ddlShirrinkby.Text);
                cmd_UpdateSampleCloth.Parameters.Add("@TotalCost",
                    SqlDbType.Float).Value = float.Parse(tbTotalCost.Text);

                Con.Open();
                cmd_UpdateSampleCloth.ExecuteNonQuery();
                Con.Close();

                FetchSampleDetail();

                divAlertSuccess.Visible = true;
            }

        }

    }

    protected void lbtnDeleteSampleItem_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchSofaDetail = new SqlCommand("DELETE FROM Samples WHERE Id='" + Request.QueryString["Id"].ToString() + "'", Con);

            Con.Open();
            cmd_fetchSofaDetail.ExecuteNonQuery();
            Con.Close();

            Response.Redirect("SofaSampleRegistration.aspx");
        }
    }
}