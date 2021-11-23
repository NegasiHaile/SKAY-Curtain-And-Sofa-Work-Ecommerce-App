using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _4CustomerArea_GeberClothers : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

            if (!IsPostBack)
            {
                //SofaClothIdNumber = Request.QueryString["IdNumber"].ToString();

                FetchInnerOnlyDetail();
            }
    }

    private void FetchInnerOnlyDetail()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_FetchOuterOnlyDetail = new SqlCommand("SELECT * FROM SofaCloths WHERE SubCatagory ='Inner Only'", Con);
            SqlDataAdapter sda_FetchOuterOnlyDetail = new SqlDataAdapter(cmd_FetchOuterOnlyDetail);
            DataTable dt_FetchOuterOnlyDetail = new DataTable();
            sda_FetchOuterOnlyDetail.Fill(dt_FetchOuterOnlyDetail);

            rptrAllDrapeCloths.DataSource = dt_FetchOuterOnlyDetail;
            rptrAllDrapeCloths.DataBind();
        }
    }
}