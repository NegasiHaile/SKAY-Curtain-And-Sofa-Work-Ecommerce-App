using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _4CustomerArea_DrapeSamples : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
            if (!IsPostBack)
            {
                FetchDrapeSamples();
            }
    }
    private void FetchDrapeSamples()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_FetchDrapeSamples = new SqlCommand("SELECT * FROM Samples WHERE SampleType ='Curtain' ORDER BY Production_Date DESC", Con);
            SqlDataAdapter sda_FetchDrapeSamples = new SqlDataAdapter(cmd_FetchDrapeSamples);
            DataTable dt_FetchDrapeSamples = new DataTable();
            sda_FetchDrapeSamples.Fill(dt_FetchDrapeSamples);

            rptrAllDrapeSamples.DataSource = dt_FetchDrapeSamples;
            rptrAllDrapeSamples.DataBind();

        }
    }
    protected void lbtnCurtainMyModal_Click(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {
            LinkButton myCurtainModalId = sender as LinkButton;
        string ModelId= myCurtainModalId.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_UpdateCurtainModelCloth = new SqlCommand("UPDATE Cart SET Model_Id=@Model_Id, Cart_Status='Complete'   WHERE Custom_Phone_Number ='" + Session["UserPhoneNumber"].ToString() + "' AND Target_Task='Curtain'", Con);
            cmd_UpdateCurtainModelCloth.Parameters.Add("@Model_Id",
                    SqlDbType.NVarChar, 6).Value = ModelId;

            Con.Open();
            cmd_UpdateCurtainModelCloth.ExecuteNonQuery();
            Con.Close();
        }
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
}