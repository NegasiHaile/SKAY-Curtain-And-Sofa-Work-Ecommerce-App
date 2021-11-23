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
public partial class _2AdminArea_EmployeesRegistration : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Super Admin")
        {
            if (!IsPostBack)
            {
                divAlertSuccess.Visible = false;
                divAlertError.Visible = false;
            }
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
    private string getGender()
    {
        string gender;
        if (rbEmplMaleGender.Checked)
        {
            gender = "Male";
        }

        else
        {
            gender = "Female";
        }

        return gender;
    }
    private bool checkPhoneNumber()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_CheckPhone = new SqlCommand("Select PhoneNumber FROM Accounts WHERE PhoneNumber='"+tbEmplPhoneNumber.Text+"'", Con);
            SqlDataAdapter sda_CheckPhone = new SqlDataAdapter(cmd_CheckPhone);
            DataTable dt_CheckPhone = new DataTable();
            sda_CheckPhone.Fill(dt_CheckPhone);

            if (dt_CheckPhone.Rows.Count == 0)
                return true;
            else
                return false;

        }
    }

    protected void btnSaveEmplDetail_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            Byte[] EmplPhotoByte = null;
            Byte[] EmplTeyazPhotoByte = null;
            if (checkPhoneNumber())
            {

                string Photofilename = fupldEmplPhoto.PostedFile.FileName;
                string PhotofilePath = Path.GetFileName(Photofilename);
                Stream Photofs = fupldEmplPhoto.PostedFile.InputStream;
                BinaryReader Photobr = new BinaryReader(Photofs);
                EmplPhotoByte = Photobr.ReadBytes((Int32)Photofs.Length);

                string Teyazfilename = fupldEplTeyazDetail.PostedFile.FileName;
                string TeyazfilePath = Path.GetFileName(Teyazfilename);
                Stream Teyazfs = fupldEplTeyazDetail.PostedFile.InputStream;
                BinaryReader Teyazbr = new BinaryReader(Teyazfs);
                EmplTeyazPhotoByte = Teyazbr.ReadBytes((Int32)Teyazfs.Length);

                SqlCommand Cmd_AddEmployee = new SqlCommand(
                                 "INSERT INTO Employees (PhoneNumber, FName, MName, LName, Gender, Salary, Branch, Position, Photo, Teyaz_Detail) " +
                                 "Values(@PhoneNumber, @FName, @MName, @LName, @Gender, @Salary, @Branch, @Position, @Photo, @Teyaz_Detail)", Con);
                Cmd_AddEmployee.Parameters.Add("@PhoneNumber",
                SqlDbType.NVarChar, 13).Value = tbEmplPhoneNumber.Text;
                Cmd_AddEmployee.Parameters.Add("@FName",
                SqlDbType.NVarChar, 23).Value = tbEmplFName.Text;
                Cmd_AddEmployee.Parameters.Add("@MName",
                SqlDbType.NVarChar, 23).Value = tbEmplMName.Text;
                Cmd_AddEmployee.Parameters.Add("@LName",
                SqlDbType.NVarChar, 23).Value = tbEmplLName.Text;
                Cmd_AddEmployee.Parameters.Add("@Gender",
                SqlDbType.NVarChar, 7).Value = getGender();
                Cmd_AddEmployee.Parameters.Add("@Salary",
                SqlDbType.Float).Value = tbEmplSalary.Text;
                Cmd_AddEmployee.Parameters.Add("@Branch",
                SqlDbType.NVarChar, 20).Value = ddlEmplBranch.SelectedItem.Value;
                Cmd_AddEmployee.Parameters.Add("@Position",
                SqlDbType.NVarChar, 23).Value = ddlEmplPosition.SelectedItem.Value;
                Cmd_AddEmployee.Parameters.Add("@Photo",
                SqlDbType.Binary).Value = EmplPhotoByte;
                Cmd_AddEmployee.Parameters.Add("@Teyaz_Detail",
                SqlDbType.Binary).Value = EmplTeyazPhotoByte;
            


            SqlCommand CmdAccount = new SqlCommand(
                                 "INSERT INTO Accounts (PhoneNumber, Email, Password, Account_Type, Account_Status) " +
                                 "Values(@PhoneNumber, @Email, @Password, @Account_Type, @Account_Status)", Con);
            CmdAccount.Parameters.Add("@PhoneNumber",
            SqlDbType.NVarChar, 13).Value = tbEmplPhoneNumber.Text;
            CmdAccount.Parameters.Add("@Email",
            SqlDbType.NVarChar, 50).Value = tbEmplEmail.Text;
            CmdAccount.Parameters.Add("@Password",
            SqlDbType.NVarChar, 50).Value = Encrpt("Sky@123");
            CmdAccount.Parameters.Add("@Account_Type",
            SqlDbType.NVarChar, 30).Value = ddlEmplPosition.SelectedItem.Value;
            CmdAccount.Parameters.Add("@Account_Status",
            SqlDbType.NVarChar, 5).Value = "ON";
            

            Con.Open();
            Cmd_AddEmployee.ExecuteNonQuery();
            CmdAccount.ExecuteNonQuery();
            Con.Close();

                divAlertError.Visible = false;
                divAlertSuccess.Visible = true;

        }
        
        else{
                divAlertError.Visible = false;
                divAlertError.Visible = true;
                spnErrorAlertText.InnerHtml = " <i class='fa fa-times'></i> ኣሁን ያስገቡት ቁጥር ስልክ በሌላ ተጠቃሚ ተይዘዋል፤ እባክዎ ሌላ ያስገቡ!";
        }
        }
    }
    protected void btnClearEmplDetail_Click(object sender, EventArgs e)
    {
        tbEmplFName.Text = "";
        tbEmplMName.Text = "";
        tbEmplLName.Text = "";
        tbEmplPhoneNumber.Text = "";
        tbEmplSalary.Text = "";
        tbEmplEmail.Text = "";
    }
}
