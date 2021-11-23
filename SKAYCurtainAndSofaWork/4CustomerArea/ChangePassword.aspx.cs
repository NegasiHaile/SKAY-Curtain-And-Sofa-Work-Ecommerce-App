using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
public partial class _4CustomerArea_ChangePassword : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {
            divAlertError.Visible = false;
            divAlertSuccess.Visible = false;
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }
    private string Encrpt(string strEncrString)
    {

        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(b);
        return Eecripted;
    }
    private string getOldPasswordFromDatabase()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_GetEncriptePassword = new SqlCommand("SELECT Password FROM Accounts WHERE PhoneNumber='" + Session["UserPhoneNumber"].ToString() + "'", Con);
            SqlDataAdapter da_GetEncriptPassword = new SqlDataAdapter(Cmd_GetEncriptePassword);
            DataTable dt_GetEncriptPassword = new DataTable();
            da_GetEncriptPassword.Fill(dt_GetEncriptPassword);

            if (dt_GetEncriptPassword.Rows.Count != 0)
                return dt_GetEncriptPassword.Rows[0][0].ToString();
            else
                return "aWFtPml3YXNAU0tBWTEyMw==";
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        string Old_PasswordFromDatabase = getOldPasswordFromDatabase();
        string Old_passwordTyped = Encrpt(tbOldPassword.Text);
        string New_Password = Encrpt(tbNewPassword.Text);
        int NewLeng = (tbNewPassword.Text).Length;

        if (Old_PasswordFromDatabase == Old_passwordTyped)
        {
            if (tbNewPassword.Text == tbRetypeNewPassword.Text)
            {
                if (NewLeng >= 6)
                {
                    using (SqlConnection Con = new SqlConnection(CS))
                    {
                        SqlCommand Cmd_Update = new SqlCommand("UPDATE Accounts SET Password=@Password WHERE PhoneNumber ='" + Session["UserPhoneNumber"].ToString() + "'", Con);
                        Cmd_Update.Parameters.Add("@Password", SqlDbType.NVarChar, 50).Value = New_Password;

                        Con.Open();
                        Cmd_Update.ExecuteNonQuery();
                        Con.Close();

                        divAlertSuccess.Visible = true;
                        spnSuccessAlertText.InnerHtml = "<i class='fa fa-check'></i> Your password is changed successfuly, now you can logout and login with the new pasword!";
                    }
                }
                else
                {
                    divAlertError.Visible = true;
                    spnErrorAlertText.InnerHtml = "<i class='fa fa-times'></i> The new password is too weak, please make it strong!";
                    tbNewPassword.Focus();
                }
            }
            else
            {
                divAlertError.Visible = true;
                spnErrorAlertText.InnerHtml = "<i class='fa fa-times'></i> New password not mached!";
                tbNewPassword.Focus();
            }
        }
        else
        {
            divAlertError.Visible = true;
            spnErrorAlertText.InnerHtml = "<i class='fa fa-times'></i> Wrong old password!";
            tbOldPassword.Focus();
        }

    }
}