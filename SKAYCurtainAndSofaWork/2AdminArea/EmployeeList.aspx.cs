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

public partial class _2AdminArea_EmployeeList : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["UserPhoneNumber"] != null)
        {
            divAlertSuccess.Visible = false;
            fetchAllEmployees();
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }

    public void fetchAllEmployees()
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {


            //SqlCommand cmd_GetTraffics = new SqlCommand("Select * From Traffics Order by EplyID DESC", con);

            SqlCommand cmd_FetchAllEmployess = new SqlCommand("Select * From Employees Order by FName ASC", Con);
            SqlDataAdapter sda_FetchAllEmployees = new SqlDataAdapter(cmd_FetchAllEmployess);
            DataTable dt_FetchAllEmployees = new DataTable();
            sda_FetchAllEmployees.Fill(dt_FetchAllEmployees);

            //NoTotalTrafficsInZone.InnerHtml = dt_GetTraffics.Rows.Count.ToString();
            //NOSubscribers.InnerHtml = dt_GetDstrs.Rows.Count.ToString();

            rptrAllEmployees.DataSource = dt_FetchAllEmployees;
            rptrAllEmployees.DataBind();
        }
    }
    public void btnDeleteEmployee_Click(object sender, EventArgs e)
    {

        LinkButton lbtnDeleteEmpl = sender as LinkButton;
        string EmplPhoneNumber = lbtnDeleteEmpl.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeleteEmploDetail = new SqlCommand("DELETE FROM Employees WHERE PhoneNumber='" + EmplPhoneNumber + "'", Con);
            SqlCommand cmd_DeleteEmploAccount = new SqlCommand("DELETE FROM Accounts WHERE PhoneNumber='" + EmplPhoneNumber + "'", Con);
            Con.Open();
            cmd_DeleteEmploDetail.ExecuteNonQuery();
            cmd_DeleteEmploAccount.ExecuteNonQuery();
            Con.Close();


            fetchAllEmployees();
            divAlertSuccess.Visible = true;

            // Response.Redirect("../2AdminArea/DrapeClothRegistration.aspx");
        }
    }
}