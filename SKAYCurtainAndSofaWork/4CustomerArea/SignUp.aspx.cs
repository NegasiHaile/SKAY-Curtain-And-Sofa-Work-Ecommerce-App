using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _4CustomerArea_SignUp : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        divAlertSuccess.Visible = false;
        divAlertError.Visible = false;
    }
    private string Encrpt(string strEncrString)
    {

        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(b);
        return Eecripted;
    }
    private string getGender()
    {
        string gender;
        if (rbMaleGender.Checked)
        {
            gender = "Male";
        }

        else
        {
            gender = "Female";
        }

        return gender;
    }

    protected void btnSignup_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            if (CheckAccount())
            {
                if (tbPassword.Text == tbRetypePassword.Text && (tbPassword.Text).Length > 6)
                {
                    SqlCommand CmdCustomer = new SqlCommand(
                                    "INSERT INTO Customers (PhoneNumber, FullName, Gender, FullAddress) " +
                                    "Values(@PhoneNumber, @FullName, @Gender, @FullAddress)", Con);
                    CmdCustomer.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar, 13).Value = tbPhoneNumber.Text;

                    CmdCustomer.Parameters.Add("@FullName", SqlDbType.NVarChar, 50).Value = tbFullName.Text;

                    CmdCustomer.Parameters.Add("@Gender", SqlDbType.NVarChar, 7).Value = getGender();

                    CmdCustomer.Parameters.Add("@FullAddress", SqlDbType.NVarChar, 50).Value = tbAddress.Text;


                    SqlCommand CmdAccount = new SqlCommand(
                                         "INSERT INTO Accounts (PhoneNumber, Email, Password, Account_Type, Account_Status) " +
                                         "Values(@PhoneNumber, @Email, @Password, @Account_Type, @Account_Status)", Con);
                    CmdAccount.Parameters.Add("@PhoneNumber",
                    SqlDbType.NVarChar, 13).Value = tbPhoneNumber.Text;
                    CmdAccount.Parameters.Add("@Email",
                    SqlDbType.NVarChar, 50).Value = tbEmail.Text;
                    CmdAccount.Parameters.Add("@Password",
                    SqlDbType.NVarChar, 50).Value = Encrpt(tbPassword.Text);
                    CmdAccount.Parameters.Add("@Account_Type",
                    SqlDbType.NVarChar, 30).Value = "Customer";
                    CmdAccount.Parameters.Add("@Account_Status",
                    SqlDbType.NVarChar, 5).Value = "ON";

                    Con.Open();
                    CmdCustomer.ExecuteNonQuery();
                    CmdAccount.ExecuteNonQuery();
                    Con.Close();

                    divAlertError.Visible = false;
                    divAlertSuccess.Visible = true;
                }

                else
                {
                    divAlertSuccess.Visible = false;
                    divAlertError.Visible = true;
                    spnErrorAlertText.InnerHtml = "<i class='fa fa-times-circle'></i> Password is weak or not match, (allowed more than 6 characters)!";
                }
            }
            else
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = true;
                spnErrorAlertText.InnerHtml = "<i class='fa fa-times-circle'></i> There is an account with this phone number please check change it!";
            }
        }
    }

    protected bool CheckAccount()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_CheckAccount = new SqlCommand("SELECT * FROM Accounts WHERE PhoneNumber='" + tbPhoneNumber.Text + "'", Con);
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