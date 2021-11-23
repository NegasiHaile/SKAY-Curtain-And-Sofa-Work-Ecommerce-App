using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _1PublicArea_Gallery : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        FetchForGallery();
        
    }

    private void FetchForGallery()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_FetchSamplesGallery = new SqlCommand("SELECT * FROM Samples WHERE SampleType ='Curtain' ORDER BY Id DESC", Con);
            SqlDataAdapter sda_FetchSamplesGallery = new SqlDataAdapter(cmd_FetchSamplesGallery);
            DataTable dt_FetchSamplesGallery = new DataTable();
            sda_FetchSamplesGallery.Fill(dt_FetchSamplesGallery);

            rptrGalleryCurtains.DataSource = dt_FetchSamplesGallery;
            rptrGalleryCurtains.DataBind();

            SqlCommand cmd_fetchSofaSamplesGallery = new SqlCommand("SELECT * FROM Samples WHERE SampleType ='Sofa' ORDER BY Id DESC", Con);
            SqlDataAdapter sda_fetchSofaSamplesGallery = new SqlDataAdapter(cmd_fetchSofaSamplesGallery);
            DataTable dt_fetchSofaSamplesGallery = new DataTable();
            sda_fetchSofaSamplesGallery.Fill(dt_fetchSofaSamplesGallery);

            rptrGallerySofas.DataSource = dt_fetchSofaSamplesGallery;
            rptrGallerySofas.DataBind();

            SqlCommand cmd_fetchAccetoGallery = new SqlCommand("SELECT * FROM Accessories ORDER BY Id DESC", Con);
            SqlDataAdapter sda_fetchAccetoGallery = new SqlDataAdapter(cmd_fetchAccetoGallery);
            DataTable dt_fetchAccetoGallery = new DataTable();
            sda_fetchAccetoGallery.Fill(dt_fetchAccetoGallery);

            rptrGalleryAcce.DataSource = dt_fetchAccetoGallery;
            rptrGalleryAcce.DataBind();
        }
        
    }
}