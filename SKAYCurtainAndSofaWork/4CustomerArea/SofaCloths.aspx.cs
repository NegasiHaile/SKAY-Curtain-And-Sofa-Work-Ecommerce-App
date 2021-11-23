using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _4CustomerArea_SofaCloths : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    //public string SofaClothIdNumber;
    protected void Page_Load(object sender, EventArgs e)
    {
            if (!IsPostBack)
            {
                FetchSofaClothes();
            }
    }
    private void FetchSofaClothes()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchSofaDetail = new SqlCommand("SELECT * FROM SofaCloths WHERE ClothCatagory ='Sofa'", Con);
            SqlDataAdapter sda_fetchSofaDetail = new SqlDataAdapter(cmd_fetchSofaDetail);
            DataTable dt_fetchSofaDetail = new DataTable();
            sda_fetchSofaDetail.Fill(dt_fetchSofaDetail);

            rptrAllSofaCloths.DataSource = dt_fetchSofaDetail;
            rptrAllSofaCloths.DataBind();
            
        }
    }

    protected void btnSaveCustomerSofaRequirment_Click(object sender, EventArgs e)
    {

    }
    protected void lbtnSeeSofaClothdetail_Click(object sender, EventArgs e)
    {
        LinkButton lbtnSofaClothDetail = sender as LinkButton;

        string SofaClothId = lbtnSofaClothDetail.CommandArgument.ToString();
        

    }
}