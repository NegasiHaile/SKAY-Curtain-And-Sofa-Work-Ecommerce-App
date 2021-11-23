using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _4CustomerArea_Help : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
            if (!IsPostBack)
            {
                FetchHelpsData();
            }
    }
    private void FetchHelpsData()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetchHelpsData = new SqlCommand("Select * From Helps  Order by Id DESC", Con);
            SqlDataAdapter sda_FetchHelpsData = new SqlDataAdapter(Cmd_FetchHelpsData);
            DataTable dt_FetchHelpsData = new DataTable();
            sda_FetchHelpsData.Fill(dt_FetchHelpsData);


            rptrHelpsList.DataSource = dt_FetchHelpsData;
            rptrHelpsList.DataBind();
        }
    }
}