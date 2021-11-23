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

public partial class _2AdminArea_DrapeCloth : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserPhoneNumber"] != null)
        {
            divAlertError.Visible = false;
            divAlertSuccess.Visible = false;

            FetchDrapeClothes();
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }


    }

    private void FetchDrapeClothes()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetchDrapCloth = new SqlCommand("Select * From SofaCloths WHERE ClothCatagory ='Curtain' Order by IdNumber DESC", Con);
            SqlDataAdapter sda_FetchDrapCloth = new SqlDataAdapter(Cmd_FetchDrapCloth);
            DataTable dt_FetchDrapCloth = new DataTable();
            sda_FetchDrapCloth.Fill(dt_FetchDrapCloth);


            rptrDrapClothes.DataSource = dt_FetchDrapCloth;
            rptrDrapClothes.DataBind();
        }
    }
    public bool CheckIdNumber()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_CheckId = new SqlCommand("Select IdNumber From SofaCloths WHERE IdNumber ='" + tbDrapeIdNumber.Text + "'", Con);
            SqlDataAdapter sda_CheckId = new SqlDataAdapter(Cmd_CheckId);
            DataTable dt_CheckId = new DataTable();
            sda_CheckId.Fill(dt_CheckId);
            if (dt_CheckId.Rows.Count == 0)
                return true;
            else
                return false;
        }
    }
    protected void btnSaveDrapeClothDetail_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            if (CheckIdNumber())
            {

                Byte[] bytes = null;

                string filename = fupldDrapeCloth.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldDrapeCloth.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand CmdDrapeClothRegster = new SqlCommand(
                               "INSERT INTO SofaCloths (IdNumber, Width, Height, Name_Color, PricePerMeter, GeberPricePerMeter, Description, Photo, How_Many_users, ClothCatagory, SubCatagory) " +
                               "Values(@IdNumber, @Width, @Height, @Name_Color, @PricePerMeter, @GeberPricePerMeter, @Description, @Photo, @How_Many_users, @ClothCatagory, @SubCatagory)", Con);
                CmdDrapeClothRegster.Parameters.Add("@IdNumber",
                    SqlDbType.NVarChar, 6).Value = tbDrapeIdNumber.Text ;
                CmdDrapeClothRegster.Parameters.Add("@Width",
                    SqlDbType.Float).Value = float.Parse(tbDrapeWidth.Text);
                CmdDrapeClothRegster.Parameters.Add("@Height",
                    SqlDbType.Float).Value = float.Parse(tbDrapeHeight.Text);
                CmdDrapeClothRegster.Parameters.Add("@Name_Color",
                    SqlDbType.NVarChar, 50).Value = tbDapeClothName_Color.Text;
                CmdDrapeClothRegster.Parameters.Add("@PricePerMeter",
                    SqlDbType.Float).Value = float.Parse(tbPriceDrapeOuterCloth.Text);
                CmdDrapeClothRegster.Parameters.Add("@GeberPricePerMeter",
                    SqlDbType.Float).Value = float.Parse(tbPeiceDrapeInnerCloth.Text);
                CmdDrapeClothRegster.Parameters.Add("@Description",
                    SqlDbType.NVarChar, 200).Value = tbDrapeClothDescription.Value;
                CmdDrapeClothRegster.Parameters.Add("@Photo",
                    SqlDbType.Binary).Value = bytes;
                CmdDrapeClothRegster.Parameters.Add("@How_Many_users",
                    SqlDbType.Int).Value = 0;
                CmdDrapeClothRegster.Parameters.Add("@ClothCatagory",
                    SqlDbType.NVarChar, 20).Value = "Curtain";
                CmdDrapeClothRegster.Parameters.Add("@SubCatagory",
                    SqlDbType.NVarChar, 20).Value = ddlCurtainContains.SelectedItem.Value;

                Con.Open();
                CmdDrapeClothRegster.ExecuteNonQuery();
                Con.Close();


                FetchDrapeClothes();

                divAlertSuccess.Visible = true;

            }
            else
            {
                divAlertContainer.Visible = true;
                divAlertError.Visible = true;
                spnAlertError.InnerHtml = " <i class='fa fa-times-circle'></i> በዝህ ቁጥር የተመዘገበ መጋረጃ ኣለ፤ እባክዎ ሌላ መለያ ቁጥር ይምረጡ!";
                tbDrapeIdNumber.Focus();
            }
        }
    }

    protected void btnDeleteItemAlt_Click(object sender, EventArgs e)
    {
        
        //divAlertSuccess.Visible = true;

        LinkButton lbtnDeleteDrapeClothItem = sender as LinkButton;
        string ItemId = lbtnDeleteDrapeClothItem.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeleteDrapeCloth = new SqlCommand("DELETE FROM SofaCloths WHERE IdNumber='" + ItemId + "'", Con);

            Con.Open();
            cmd_DeleteDrapeCloth.ExecuteNonQuery();
            Con.Close();

            FetchDrapeClothes();

           // Response.Redirect("../2AdminArea/DrapeClothRegistration.aspx");
        }


    }
}