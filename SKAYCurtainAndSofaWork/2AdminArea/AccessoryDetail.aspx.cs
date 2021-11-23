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


public partial class _2AdminArea_AccessoryDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string  AccessoryId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Super Admin")
        {

            AccessoryId = Request.QueryString["Id"];
            if (!IsPostBack)
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;

                FetchAccessottyDetail();
            }
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }

    private void FetchAccessottyDetail()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchAcceDetail = new SqlCommand("SELECT * FROM Accessories WHERE Id='" + Request.QueryString["Id"].ToString() + "'", Con);
            SqlDataAdapter sda_fetchAcceDetail = new SqlDataAdapter(cmd_fetchAcceDetail);
            DataTable dt_fetchAcceDetail = new DataTable();
            sda_fetchAcceDetail.Fill(dt_fetchAcceDetail);

            spnAcceType.InnerText = dt_fetchAcceDetail.Rows[0][1].ToString();
            spnAcceName_Color.InnerText = dt_fetchAcceDetail.Rows[0][2].ToString();
            spnAcceAvailability.InnerText = dt_fetchAcceDetail.Rows[0][4].ToString();
            spnAccePrice.InnerText = dt_fetchAcceDetail.Rows[0][3].ToString();
            spanHow_Many_Users.InnerText = dt_fetchAcceDetail.Rows[0][6].ToString();
            spnAcceDescription.InnerText = dt_fetchAcceDetail.Rows[0][5].ToString();

            ddlAcceType.Text = dt_fetchAcceDetail.Rows[0][1].ToString();
            tbAcceName_Color.Text = dt_fetchAcceDetail.Rows[0][2].ToString();
            tbAccePricePerMeterOrOne.Text = dt_fetchAcceDetail.Rows[0][3].ToString();
            tbAcceAvailableQuantityOrMeter.Text = dt_fetchAcceDetail.Rows[0][4].ToString();
            tbAcceDescription.Value = dt_fetchAcceDetail.Rows[0][5].ToString();


        }
        }

    protected void lbtnSaveSofaChange_Click(object Sender, EventArgs e)
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            if (fupldAccePhoto.HasFile)
            {
                Byte[] bytes = null;

                string filename = fupldAccePhoto.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldAccePhoto.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand cmd_UpdateAcce = new SqlCommand("UPDATE Accessories SET Acce_type=@Acce_type, SpecialName_color=@SpecialName_color, PricePerMeter_One=@PricePerMeter_One, Available_Quantity=@Available_Quantity, Acce_Description=@Acce_Description, Acce_Photo=@Acce_Photo WHERE Id='" + int.Parse(Request.QueryString["Id"]) + "'", Con);

                cmd_UpdateAcce.Parameters.Add("@Acce_type", SqlDbType.NVarChar, 15).Value = ddlAcceType.SelectedItem.Value;
                cmd_UpdateAcce.Parameters.Add("@SpecialName_color", SqlDbType.NVarChar, 50).Value = tbAcceName_Color.Text;
                cmd_UpdateAcce.Parameters.Add("@PricePerMeter_One", SqlDbType.Float).Value = float.Parse(tbAccePricePerMeterOrOne.Text);
                cmd_UpdateAcce.Parameters.Add("@Available_Quantity", SqlDbType.Float).Value = float.Parse(tbAcceAvailableQuantityOrMeter.Text);
                cmd_UpdateAcce.Parameters.Add("@Acce_Description", SqlDbType.NVarChar, 101).Value = tbAcceDescription.Value;
                cmd_UpdateAcce.Parameters.Add("@Acce_Photo", SqlDbType.Binary).Value = bytes;

                Con.Open();
                cmd_UpdateAcce.ExecuteNonQuery();
                Con.Close();

                FetchAccessottyDetail();

                divAlertSuccess.Visible = true;


            }

            else
            {
                SqlCommand cmd_UpdateAcce = new SqlCommand("UPDATE Accessories SET Acce_type=@Acce_type, SpecialName_color=@SpecialName_color, PricePerMeter_One=@PricePerMeter_One, Available_Quantity=@Available_Quantity, Acce_Description=@Acce_Description WHERE Id='" + int.Parse(Request.QueryString["Id"]) + "'", Con);

                cmd_UpdateAcce.Parameters.Add("@Acce_type", SqlDbType.NVarChar, 15).Value = ddlAcceType.SelectedItem.Value;
                cmd_UpdateAcce.Parameters.Add("@SpecialName_color", SqlDbType.NVarChar, 50).Value = tbAcceName_Color.Text;
                cmd_UpdateAcce.Parameters.Add("@PricePerMeter_One", SqlDbType.Float).Value = float.Parse(tbAccePricePerMeterOrOne.Text);
                cmd_UpdateAcce.Parameters.Add("@Available_Quantity", SqlDbType.Float).Value = float.Parse(tbAcceAvailableQuantityOrMeter.Text);
                cmd_UpdateAcce.Parameters.Add("@Acce_Description", SqlDbType.NVarChar, 101).Value = tbAcceDescription.Value;

                Con.Open();
                cmd_UpdateAcce.ExecuteNonQuery();
                Con.Close();

                FetchAccessottyDetail();

                divAlertSuccess.Visible = true;
            }

        }

    }
}