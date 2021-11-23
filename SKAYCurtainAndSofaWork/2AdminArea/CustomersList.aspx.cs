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

public partial class _2AdminArea_CustomersList : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string NoOfCustomes;
    protected void Page_Load(object sender, EventArgs e)
    {
        divAlertSuccess.Visible = false;
        divAlertError.Visible = false;
        if (Session["UserPhoneNumber"] != null)
        {
            fetchCustomers();
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }

    private void fetchCustomers()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            

            SqlCommand cmd_FetchAllCustomers = new SqlCommand("Select * FROM Customers INNER JOIN Accounts ON Customers.PhoneNumber = Accounts.PhoneNumber", Con);
            SqlDataAdapter sda_FetchAllCustomers = new SqlDataAdapter(cmd_FetchAllCustomers);
            DataTable dt_FetchAllCustomers = new DataTable();
            sda_FetchAllCustomers.Fill(dt_FetchAllCustomers);

            NoOfCustomes = dt_FetchAllCustomers.Rows.Count.ToString();
            rptrCustomersList.DataSource = dt_FetchAllCustomers;
            rptrCustomersList.DataBind();
        }
    }

    protected void btnBlockAccount_Click(object sender, EventArgs e)
    {


        LinkButton lbtnBlockingAccountId = sender as LinkButton;
        string BlockingAccount = lbtnBlockingAccountId.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_BlockCustomerAccount = new SqlCommand("UPDATE Accounts SET Account_Status = 'OFF' WHERE PhoneNumber='" + BlockingAccount + "'", Con);

            Con.Open();
            cmd_BlockCustomerAccount.ExecuteNonQuery();
            Con.Close();

            fetchCustomers();

            divAlertSuccess.Visible = true;
            spnSuccessAlertText.InnerText = "Customer Account is Blocked Successfuly!";
        }
    }
    protected void lbtnActivateAccount_Click(object sender, EventArgs e)
    {


        LinkButton lbtnActivatingAccountId = sender as LinkButton;
        string BlockingAccount = lbtnActivatingAccountId.CommandArgument.ToString();

        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_ActivateCustomerAccount = new SqlCommand("UPDATE Accounts SET Account_Status = 'ON' WHERE PhoneNumber='" + BlockingAccount + "'", Con);

            Con.Open();
            cmd_ActivateCustomerAccount.ExecuteNonQuery();
            Con.Close();

            fetchCustomers();

            divAlertSuccess.Visible = true;
            spnSuccessAlertText.InnerText = "Customer Account is Successfuly Activated!";
        }
    }
}