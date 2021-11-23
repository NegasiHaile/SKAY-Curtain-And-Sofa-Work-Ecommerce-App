using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class _4CustomerArea_SofaSamples : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
            if (!IsPostBack)
            {
                FetchSofaSamples();
            }
    }
    private void FetchSofaSamples()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_FetchSofaSamples = new SqlCommand("SELECT * FROM Samples WHERE SampleType ='Sofa' ORDER BY Production_Date DESC", Con);
            SqlDataAdapter sda_FetchSofaSamples = new SqlDataAdapter(cmd_FetchSofaSamples);
            DataTable dt_FetchSofaSamples = new DataTable();
            sda_FetchSofaSamples.Fill(dt_FetchSofaSamples);

            rptrAllSofaSamples.DataSource = dt_FetchSofaSamples;
            rptrAllSofaSamples.DataBind();

        }
    }

    protected void lbtnSofaMyModel_Click(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {
            LinkButton mySofaModelId = sender as LinkButton;
        string ItemId = mySofaModelId.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_UpdateSofaModelCloth = new SqlCommand("UPDATE Cart SET Model_Id=@Model_Id   WHERE Custom_Phone_Number ='" + Session["UserPhoneNumber"].ToString() + "' AND Target_Task='Sofa'", Con);
            cmd_UpdateSofaModelCloth.Parameters.Add("@Model_Id",
                    SqlDbType.NVarChar, 6).Value = ItemId;

            Con.Open();
            cmd_UpdateSofaModelCloth.ExecuteNonQuery();
            Con.Close();
            }
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
}