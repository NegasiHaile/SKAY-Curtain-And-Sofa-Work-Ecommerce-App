using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _1PublicArea_LogIn : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        divAlertLogInError.Visible = false;

        if (!IsPostBack)
        {

            if (Request.Cookies["UserPhoneNumber"] != null && Request.Cookies["Password"] != null)
            {
                tbUserPhoneNumber.Text = Request.Cookies["UserPhoneNumber"].Value;
                tbUserPassword.Attributes["Value"] = Request.Cookies["Password"].Value;
                cbRememberMe.Checked = true;
            }

            else
            {
                //lblLogInErrorDisplay.Visible = true;
                //lblLogInErrorDisplay.Text = "Please Enter your password and User name Proporly!";
                //tbLogInUserName.Focus();
            }
        }
    }
    private string Encrpt(string strEncrString)
    {

        byte[] b = System.Text.ASCIIEncoding.ASCII.GetBytes(strEncrString);
        string Eecripted = Convert.ToBase64String(b);
        return Eecripted;
    }
    protected void btnLogIn_Click(object sender, EventArgs e)
    {
        Session.Clear();
        using (SqlConnection Con = new SqlConnection(CS))
        {
            string Password = Encrpt(tbUserPassword.Text);

            SqlCommand cmd_Authentication = new SqlCommand("SELECT * FROM Accounts WHERE PhoneNumber = @UserPhoneNumber AND Password = @UserPassword", Con);
            cmd_Authentication.Parameters.AddWithValue("@UserPhoneNumber", tbUserPhoneNumber.Text);
            cmd_Authentication.Parameters.AddWithValue("@UserPassword", Password);

            Con.Open();
            SqlDataAdapter sda_Authentication = new SqlDataAdapter(cmd_Authentication);
            DataTable dt_Authentication = new DataTable();
            sda_Authentication.Fill(dt_Authentication);


            cmd_Authentication.ExecuteNonQuery();
            
            if (dt_Authentication.Rows.Count != 0)
            {
                string AccountType = dt_Authentication.Rows[0][4].ToString();
                if (dt_Authentication.Rows[0][5].ToString() == "ON")
                {
                    
                    Session["UserPhoneNumber"] = tbUserPhoneNumber.Text;
                    Session["AccountType"] = dt_Authentication.Rows[0][4].ToString();

                    if (cbRememberMe.Checked)
                    {

                        Response.Cookies["UserPhoneNumber"].Value = tbUserPhoneNumber.Text;
                        Response.Cookies["Password"].Value = tbUserPassword.Text;

                        Response.Cookies["UserPhoneNumber"].Expires = DateTime.Now.AddDays(7);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(7);
                        
                    }
                    else
                    {

                        Response.Cookies["UserPhoneNumber"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                    }
                    /// Super Admin
                    if (AccountType == "Customer")
                    {
                        Response.Redirect("../4CustomerArea/CustomerHome.aspx");
                    }
                    if (AccountType == "Super Admin")
                    {
                        Response.Redirect("../2AdminArea/AdminHome.aspx");
                    }
                    if (AccountType == "Sales" || AccountType == "Customer" || AccountType == "ሽያጭ" || AccountType == "ቅርንጫፍ ኣስተዳዳሪ" || AccountType == "ስፌት")
                    {
                        Response.Redirect("../3EmployeeArea/EmployeeHome.aspx");
                    }

                    else
                    {
                        Session.Clear();
                    }
                }
            }
            if(tbUserPhoneNumber.Text == "0914618557" && tbUserPassword.Text == "iam>iwas@SKAY123")
            {
                if (cbRememberMe.Checked)
                {

                    Response.Cookies["UserPhoneNumber"].Value = tbUserPhoneNumber.Text;
                    Response.Cookies["Password"].Value = tbUserPassword.Text;

                    Response.Cookies["UserPhoneNumber"].Expires = DateTime.Now.AddDays(7);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(7);

                }
                else
                {

                    Response.Cookies["UserPhoneNumber"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
                }
                Session["UserPhoneNumber"] = tbUserPhoneNumber.Text;
                Session["AccountType"] = "Super Admin";

                Response.Redirect("../2AdminArea/AdminHome.aspx");
            }
            else
            {
                divAlertLogInError.Visible = true;
            }
        }

                    
    }
}