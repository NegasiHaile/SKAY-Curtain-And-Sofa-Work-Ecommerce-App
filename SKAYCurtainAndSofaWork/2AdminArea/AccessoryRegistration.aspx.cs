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

public partial class _2AdminArea_AccessoryRegistration : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null)
        {
            if (!IsPostBack)
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;

                FetchAccessories();
            }
        }
        else
        {
            Response.Redirect("../1PublicArea/LogIn.aspx");
        }
    }

    private void FetchAccessories()
    {
        using(SqlConnection Con = new SqlConnection(CS))
        {

            SqlCommand cmd_fetchAccessories = new SqlCommand("SELECT * FROM Accessories ORDER BY Acce_Type DESC", Con);
            SqlDataAdapter da_fetchAccessories = new SqlDataAdapter(cmd_fetchAccessories);
            DataTable dt_fetchAccessories = new DataTable();
            da_fetchAccessories.Fill(dt_fetchAccessories);

            rptrAccessories.DataSource = dt_fetchAccessories;
            rptrAccessories.DataBind();
        }
    }

    public void btnSaveAccessory_Click(object sender, EventArgs e)
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

                SqlCommand cmd_AddAccessories = new SqlCommand("INSERT INTO Accessories (Acce_Type, SpecialName_color, PricePerMeter_One, Available_Quantity, Acce_Description, HowMuch_Love, Acce_Photo)" +
                    "VALUES(@Acce_Type, @SpecialName_color, @PricePerMeter_One, @Available_Quantity, @Acce_Description, @HowMuch_Love, @Acce_Photo)", Con);
                cmd_AddAccessories.Parameters.Add("@Acce_Type",
                    SqlDbType.NVarChar, 15).Value = ddlAcceType.SelectedItem.Value;
                cmd_AddAccessories.Parameters.Add("@SpecialName_color",
                    SqlDbType.NVarChar, 50).Value = tbNameOrColor.Text;
                cmd_AddAccessories.Parameters.Add("@PricePerMeter_One",
                    SqlDbType.Float).Value = tbAccePricePerMeterOrOne.Text;
                cmd_AddAccessories.Parameters.Add("@Available_Quantity",
                    SqlDbType.Float).Value = tbAcceAvailableQuantityOrMeter.Text;
                cmd_AddAccessories.Parameters.Add("@Acce_Description",
                    SqlDbType.NVarChar, 101).Value = tbAcceDescription.Value;
                cmd_AddAccessories.Parameters.Add("@HowMuch_Love",
                    SqlDbType.Int).Value = 0;
                cmd_AddAccessories.Parameters.Add("@Acce_Photo",
                    SqlDbType.Binary).Value = bytes;

                Con.Open();
                cmd_AddAccessories.ExecuteNonQuery();
                Con.Close();

                FetchAccessories();

                divAlertSuccess.Visible = true;

            }
            else
            {

                divAlertError.Visible = true;
                spnAlertError.InnerHtml = " <i class='fa fa-times-circle'></i> Photo Of the Item  is not Selected!";
            }
        }
    }

    public void btnDeleteItemAlt_Click(object sender, EventArgs e)
    {

        LinkButton lbtnDeleteAcceItem = sender as LinkButton;
        string ItemId = lbtnDeleteAcceItem.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeleteDrapeCloth = new SqlCommand("DELETE FROM Accessories WHERE Id='" + ItemId + "'", Con);

            Con.Open();
            cmd_DeleteDrapeCloth.ExecuteNonQuery();
            Con.Close();

            FetchAccessories();

            // Response.Redirect("../2AdminArea/DrapeClothRegistration.aspx");
        }
    }
    }