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


public partial class _2AdminArea_DrapeSampleRegistration : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string RegsNumOfCurtainSamples;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null)
        {
            if (!IsPostBack)
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;

                FetchSofaSamples();
            }
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
    private void FetchSofaSamples()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetchDrapeSample = new SqlCommand("Select * From Samples WHERE SampleType='Curtain' Order by Id DESC", Con);
            SqlDataAdapter sda_FetchDrapeSample = new SqlDataAdapter(Cmd_FetchDrapeSample);
            DataTable dt_FetchDrapeSample = new DataTable();
            sda_FetchDrapeSample.Fill(dt_FetchDrapeSample);

            RegsNumOfCurtainSamples = (dt_FetchDrapeSample.Rows.Count).ToString();

            rptrSofaSamplesList.DataSource = dt_FetchDrapeSample;
            rptrSofaSamplesList.DataBind();
        }
    }
    public string generateNewId()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_getMaxSofaSampleId = new SqlCommand("Select MAX(Id) From Samples WHERE Id LIKE'cs%'", Con);
            SqlDataAdapter sda_getMaxSofaSampleId = new SqlDataAdapter(Cmd_getMaxSofaSampleId);
            DataTable dt_getMaxSofaSampleId = new DataTable();
            sda_getMaxSofaSampleId.Fill(dt_getMaxSofaSampleId);

            if (dt_getMaxSofaSampleId.Rows.Count != 0)
            {
                string MaxSampleId = dt_getMaxSofaSampleId.Rows[0][0].ToString();
                char[] dArr = MaxSampleId.ToCharArray();
                string newId;

                string num = "";
                for (int i = 2; i < dArr.Length; i++)
                {
                    num = num + "" + dArr[i];
                }

                if (int.Parse(num) < 9)
                {
                    int IdlessThan10 = int.Parse(num) + 1;
                    newId = "0" + (IdlessThan10.ToString());
                }
                else
                {
                    newId = (int.Parse(num) + 1).ToString();
                }

                return ("cs" + newId).ToString();
            }
            else
            {
                return ("cs01").ToString();
            }
        }
    }
    protected void btnSofaSaveSample_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            try
            {
                string NewId = generateNewId();

                Byte[] bytes = null;
                string filename = fupldSofaSampleImage.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldSofaSampleImage.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand Cmd_InsertCurtainSample = new SqlCommand(
                                "INSERT INTO Samples (Id, IdsOfTools, SampleType, Drp_Wndw_Sf_TtlMeter, ShirinkPer, TotalCost, Image, Production_Date, Sample_SubCatagory) " +
                                "Values(@Id, @IdsOfTools, @SampleType, @Drp_Wndw_Sf_TtlMeter, @ShirinkPer, @TotalCost, @Image, @Production_Date, @Sample_SubCatagory)", Con);
                Cmd_InsertCurtainSample.Parameters.Add("@Id",
                    SqlDbType.NVarChar, 6).Value = NewId;
                Cmd_InsertCurtainSample.Parameters.Add("@IdsOfTools",
                    SqlDbType.NVarChar, 6).Value = tbMaterialIdNumber.Text;
                Cmd_InsertCurtainSample.Parameters.Add("@SampleType",
                    SqlDbType.NVarChar, 10).Value = "Curtain";
                Cmd_InsertCurtainSample.Parameters.Add("@Drp_Wndw_Sf_TtlMeter",
                    SqlDbType.Float).Value = tbTotalMeter.Text;
                Cmd_InsertCurtainSample.Parameters.Add("@ShirinkPer",
                    SqlDbType.Float).Value = ddlShirrinkby.SelectedItem.Value;
                Cmd_InsertCurtainSample.Parameters.Add("@TotalCost",
                    SqlDbType.Float).Value = float.Parse(tbTotalCost.Text);
                Cmd_InsertCurtainSample.Parameters.Add("@Image",
                    SqlDbType.Binary).Value = bytes;
                Cmd_InsertCurtainSample.Parameters.Add("@Production_Date",
                    SqlDbType.Date).Value = DateTime.Now.ToShortDateString();
                Cmd_InsertCurtainSample.Parameters.Add("@Sample_SubCatagory",
                    SqlDbType.NVarChar, 30).Value = tbCurtainTypeName.Text;

                Con.Open();
                Cmd_InsertCurtainSample.ExecuteNonQuery();
                Con.Close();

                FetchSofaSamples();


                divAlertError.Visible = false;
                divAlertSuccess.Visible = true;
            }
            catch
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = true;
                spnAlertError.InnerHtml = " <i class='fa fa-times-circle'> </i> Somthing went wrong, please try again.";
            }
        }


    }

    protected void btnDeleteItemAlt_Click(object sender, EventArgs e)
    {


        LinkButton lbtnDeleteDrapeClothItem = sender as LinkButton;
        string ItemId = lbtnDeleteDrapeClothItem.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_SofaSample = new SqlCommand("DELETE FROM Samples WHERE Id='" + ItemId + "'", Con);

            Con.Open();
            cmd_SofaSample.ExecuteNonQuery();
            Con.Close();

            FetchSofaSamples();

            divAlertSuccess.Visible = true;
            spnAlertSccess.InnerHtml = "<i class='fa fa-check-circle'></i> Item Deleted successfuly from the site.";
            // Response.Redirect("../2AdminArea/DrapeClothRegistration.aspx");
        }
    }
}