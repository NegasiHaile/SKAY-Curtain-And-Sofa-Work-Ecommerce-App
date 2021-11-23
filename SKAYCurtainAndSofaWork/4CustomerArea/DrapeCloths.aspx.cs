using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _4CustomerArea_DrapeCloths : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

            if (!IsPostBack)
            {
                //SofaClothIdNumber = Request.QueryString["IdNumber"].ToString();

                FetchSofaDetail();
            }
    }
    private void FetchSofaDetail()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchSofaDetail = new SqlCommand("SELECT * FROM SofaCloths WHERE SubCatagory ='Inner And Outer'", Con);
            SqlDataAdapter sda_fetchSofaDetail = new SqlDataAdapter(cmd_fetchSofaDetail);
            DataTable dt_fetchSofaDetail = new DataTable();
            sda_fetchSofaDetail.Fill(dt_fetchSofaDetail);

            rptrAllDrapeCloths.DataSource = dt_fetchSofaDetail;
            rptrAllDrapeCloths.DataBind();
            
        }
    }
}