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

public partial class _2AdminArea_WorkingPricing : System.Web.UI.Page
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

                FetchFunctionsPrice();
            }
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
    private void FetchFunctionsPrice()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_FetchFunctionsPrice = new SqlCommand("SELECT * FROM FunctionsPrices", Con);
            SqlDataAdapter sda_FetchFunctionsPrice = new SqlDataAdapter(cmd_FetchFunctionsPrice);
            DataTable dt_FetchFunctionsPrice = new DataTable();
            sda_FetchFunctionsPrice.Fill(dt_FetchFunctionsPrice);

            spnNumberOfFunctions.InnerText = dt_FetchFunctionsPrice.Rows.Count.ToString();

            rptrFuctionsPrices.DataSource = dt_FetchFunctionsPrice;
            rptrFuctionsPrices.DataBind();
        }
        }

    protected void btnFunctionPrice_Click(object sender, EventArgs e)
    {
        using(SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand CmdInsert_Function_Price = new SqlCommand(
                               "INSERT INTO FunctionsPrices (FunctionName, PricePermeterOrTask, FunctionDescription)" +
                               "Values(@FunctionName, @PricePermeterOrTask, @FunctionDescription)", Con);
            CmdInsert_Function_Price.Parameters.Add("@FunctionName",
                SqlDbType.NVarChar, 25).Value = ddlPricingFunction.SelectedItem.Value.ToString();
            CmdInsert_Function_Price.Parameters.Add("@PricePermeterOrTask",
                SqlDbType.Float).Value = float.Parse(tbFunctionPricePerMeter.Text);
            CmdInsert_Function_Price.Parameters.Add("@FunctionDescription",
                SqlDbType.NVarChar, 150).Value = tbFunctionPricingDescription.Text.ToString();

            Con.Open();
            CmdInsert_Function_Price.ExecuteNonQuery();
            Con.Close();

            divAlertSuccess.Visible = true;
            FetchFunctionsPrice();
        }
    }


    protected void btnFunctionalPriceSaveChange_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
           // RepeaterItem items = (sender as LinkButton).Nam
            RepeaterItem Item = (sender as LinkButton).NamingContainer as RepeaterItem;

            string IdNumber = (Item.FindControl("tbid") as TextBox).Text;
            string FunctionName = (Item.FindControl("tbFunctionNameEdit") as TextBox).Text;
            string Price = (Item.FindControl("tbFunctionPricePerMeterEdit") as TextBox).Text;
            string Description = (Item.FindControl("tbFunctionPricingDescriptionEdit") as TextBox).Text;

            SqlCommand cmd_FunctionsPrice = new SqlCommand("UPDATE FunctionsPrices SET PricePermeterOrTask=@PricePermeterOrTask, FunctionDescription=@FunctionDescription WHERE Id='" + IdNumber + "'", Con);

            //cmd_FunctionsPrice.Parameters.Add("@FunctionName",
            //    SqlDbType.NVarChar, 25).Value = FunctionName;
            cmd_FunctionsPrice.Parameters.Add("@PricePermeterOrTask",
                SqlDbType.Float).Value = float.Parse(Price);
            cmd_FunctionsPrice.Parameters.Add("@FunctionDescription",
                SqlDbType.NVarChar, 150).Value = Description;

            Con.Open();
            cmd_FunctionsPrice.ExecuteNonQuery();
            Con.Close();

            FetchFunctionsPrice();
            divAlertSuccess.Visible = true;
            spnAlertSccess.InnerHtml = "<i class='fa fa-check-circle'></i> Pricing updated successfuly!";
        }
    }
}