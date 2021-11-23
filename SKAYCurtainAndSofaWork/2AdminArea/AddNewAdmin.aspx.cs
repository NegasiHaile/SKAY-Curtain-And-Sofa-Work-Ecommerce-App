using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _2AdminArea_AddNewAdmin : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null)
        {
            if (Session["AccountType"].ToString() == "Super Admin")
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;
            }
            else
            {
                Response.Redirect("../1PublicArea/LogIn.aspx");
            }
        }
        else
        {
            Response.Redirect("../1PublicArea/LogIn.aspx");
        }
    }
    private string Encrpt()
    {
        string strEncrString = tbSAPassword.Text;
        if (tbSAPassword.Text == "")
        {
            strEncrString = "SA@SeniCurtain";
        }
        byte[] arrybyte = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(arrybyte);
        return Eecripted;
    }
    protected void btnAddNewAdmin_Click(object sender, EventArgs e)
    {
        if (CheckAccount())
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {

                SqlCommand Cmd_CreateSAAccount = new SqlCommand(
                                     "INSERT INTO Accounts (PhoneNumber, Email, Password, Account_Type, Account_Status) " +
                                     "Values(@PhoneNumber, @Email, @Password, @Account_Type, @Account_Status)", Con);
                Cmd_CreateSAAccount.Parameters.Add("@PhoneNumber",
                SqlDbType.NVarChar, 13).Value = tbSAPhoneNumber.Text;
                Cmd_CreateSAAccount.Parameters.Add("@Email",
                SqlDbType.NVarChar, 50).Value = tbSAEmail.Text;
                Cmd_CreateSAAccount.Parameters.Add("@Password",
                SqlDbType.NVarChar, 50).Value = Encrpt();
                Cmd_CreateSAAccount.Parameters.Add("@Account_Type",
                SqlDbType.NVarChar, 30).Value = "Super Admin";
                Cmd_CreateSAAccount.Parameters.Add("@Account_Status",
                SqlDbType.NVarChar, 5).Value = "ON";

                Con.Open();
                Cmd_CreateSAAccount.ExecuteNonQuery();
                Con.Close();

                divAlertError.Visible = false;
                divAlertSuccess.Visible = true;
            }
        }
        else
        {
            divAlertSuccess.Visible = false;
            divAlertError.Visible = true;
            spnErrorAlertText.InnerHtml = "<i class='fa fa-times-circle'></i> There is an account with this phone number please check change it!";
        }
    }
    protected bool CheckAccount()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_CheckAccount = new SqlCommand("SELECT * FROM Accounts WHERE PhoneNumber='" + tbSAPhoneNumber.Text + "'", Con);
            SqlDataAdapter da_CheckAccount = new SqlDataAdapter(cmd_CheckAccount);
            DataTable dt__CheckAccount = new DataTable();
            da_CheckAccount.Fill(dt__CheckAccount);
            if (dt__CheckAccount.Rows.Count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}