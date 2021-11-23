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

public partial class _2AdminArea_ProductRegistration : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["AccountType"].ToString() == "Super Admin")
        {
            divAlertContainer.Visible = false;
        divAlertSuccess.Visible = false;
        divAlertError.Visible = false;

            FetchSofaClothes();
            
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }


    }

    private void FetchSofaClothes()
    {
       using(SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetchSofas = new SqlCommand("Select * From SofaCloths WHERE ClothCatagory ='Sofa' Order by IdNumber DESC", Con);
            SqlDataAdapter sda_FetchSofas = new SqlDataAdapter(Cmd_FetchSofas);
            DataTable dt_FetchSofas = new DataTable();
            sda_FetchSofas.Fill(dt_FetchSofas);
            

            rptrSofasList.DataSource = dt_FetchSofas;
            rptrSofasList.DataBind();
        }
    }
    public string generateNewId()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetchDrapCloth = new SqlCommand("Select MAX(IdNumber) From SofaCloths WHERE IdNumber LIKE'S%'", Con);
            SqlDataAdapter sda_FetchDrapCloth = new SqlDataAdapter(Cmd_FetchDrapCloth);
            DataTable dt_FetchDrapCloth = new DataTable();
            sda_FetchDrapCloth.Fill(dt_FetchDrapCloth);
            if (dt_FetchDrapCloth.Rows.Count != 0)
            {
                string data = dt_FetchDrapCloth.Rows[0][0].ToString();
                char[] dArr = data.ToCharArray();

                string num = "";
                for (int i = 1; i < dArr.Length; i++)
                {
                    num = num + "" + dArr[i];
                }

                int newId = int.Parse(num) + 1;
                return ("S" + newId).ToString();
            }
            else
            {
                return ("S" + 1).ToString();
            }
        }
    }

    public bool CheckIdNumber()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_CheckId = new SqlCommand("Select IdNumber From SofaCloths WHERE IdNumber ='"+ tbSofaIdNumber.Text + "'", Con);
            SqlDataAdapter sda_CheckId = new SqlDataAdapter(Cmd_CheckId);
            DataTable dt_CheckId = new DataTable();
            sda_CheckId.Fill(dt_CheckId);
            if(dt_CheckId.Rows.Count == 0)
                return true;
            else
                return false;
        } 
    }
    protected void lbtnSaveSofaClothDetail_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            //string NewId = generateNewId();

            if (CheckIdNumber())
            {

                Byte[] bytes = null;

                string filename = fupldSofaPhoto.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldSofaPhoto.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand CmdSafaClothRegister = new SqlCommand(
                                "INSERT INTO SofaCloths (IdNumber, Width, Height, Name_Color, PricePerMeter, GeberPricePerMeter, Description, Photo, How_Many_users, ClothCatagory, SubCatagory) " +
                                "Values(@IdNumber, @Width, @Height, @Name_Color, @PricePerMeter, @GeberPricePerMeter, @Description, @Photo, @How_Many_users, @ClothCatagory, @SubCatagory)", Con);
                CmdSafaClothRegister.Parameters.Add("@IdNumber", 
                    SqlDbType.NVarChar, 6).Value = tbSofaIdNumber.Text;
                CmdSafaClothRegister.Parameters.Add("@Width", 
                    SqlDbType.Float).Value = float.Parse(tbSofaWidth.Text);
                CmdSafaClothRegister.Parameters.Add("@Height",
                    SqlDbType.Float).Value = float.Parse(tbSofaHeight.Text);
                CmdSafaClothRegister.Parameters.Add("@Name_Color", 
                    SqlDbType.NVarChar, 50).Value = tbSofaName_Color.Text;
                CmdSafaClothRegister.Parameters.Add("@PricePerMeter", 
                    SqlDbType.Float).Value = float.Parse(tbSofaPricePerMeter.Text);
                CmdSafaClothRegister.Parameters.Add("@GeberPricePerMeter",
                    SqlDbType.Float).Value = 0;
                CmdSafaClothRegister.Parameters.Add("@Description", 
                    SqlDbType.NVarChar, 100).Value = tbSofaDescription.Value;
                CmdSafaClothRegister.Parameters.Add("@Photo",
                    SqlDbType.Binary).Value = bytes;
                CmdSafaClothRegister.Parameters.Add("@How_Many_users",
                    SqlDbType.Int).Value = 0;
                CmdSafaClothRegister.Parameters.Add("@ClothCatagory",
                    SqlDbType.NVarChar, 20).Value = "Sofa";
                CmdSafaClothRegister.Parameters.Add("@SubCatagory",
                    SqlDbType.NVarChar, 20).Value = ddlClotheUsesFor.SelectedItem.Value;

                Con.Open();
                CmdSafaClothRegister.ExecuteNonQuery();
                Con.Close();

                FetchSofaClothes();

                divAlertContainer.Visible = true;
                divAlertSuccess.Visible = true;
            }
            else
            {
                divAlertContainer.Visible = true;
                divAlertError.Visible = true;
                spnAlertError.InnerHtml = " <i class='fa fa-times-circle'></i> በዝህ ቁጥር የተመዘገበ ጨርቅ ኣለ፤ እባክዎ ሌላ መለያ ቁጥር ይምረጡ!";
            }
        }

    }



    protected void lbtnClearSofaClothDetail_Click(object sendr, EventArgs e)
    {

        tbSofaIdNumber.Text = "";
        tbSofaWidth.Text = "";
        tbSofaHeight.Text = "";
        tbSofaName_Color.Text = "";
        tbSofaPricePerMeter.Text = "";
        tbSofaDescription.Value = "";
        
        //txtPrdctIdNumber.Text = "";
        //txtPrdctWidth.Text = "";
        //txtPrdctHeight.Text = "";
        //txtPdctTypename.Text = "";
        //txtPrdctPricePerMeter.Text = "";
        //txtPrdctQuantity.Text = "";
    }


    protected void btnDeleteItemAlt_Click(object sender, EventArgs e)
    {
        divAlertContainer.Visible = true;
        divAlertSuccess.Visible = true;
        

        LinkButton lbtnDeleteSofaClothItem = sender as LinkButton;
        string ItemId = lbtnDeleteSofaClothItem.CommandArgument.ToString();
       // int itemNumber = int.Parse(ItemId);

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeleteSofaCloth = new SqlCommand("DELETE FROM SofaCloths WHERE IdNumber='" + ItemId + "'", Con);

            Con.Open();
            cmd_DeleteSofaCloth.ExecuteNonQuery();
            Con.Close();
            Response.Redirect("../2AdminArea/SofaClothRegistration.aspx");
        }
            
        
    }
}


