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

public partial class _2AdminArea_EmployeeDetail : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string EmplPhoneNumber;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Super Admin")
        {
            EmplPhoneNumber = Request.QueryString["PhoneNumber"].ToString();
            divAlertSuccess.Visible = false;
            divAlertError.Visible = false;
        if (!IsPostBack)
        {
            fetchDetailPerEmployee();
        }
        }
        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }
    }

    private void fetchDetailPerEmployee()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {

            SqlCommand cmd_FetchAllEmployess = new SqlCommand("Select * FROM Employees INNER JOIN Accounts ON Employees.PhoneNumber = Accounts.PhoneNumber  WHERE Employees.PhoneNumber='" + Request.QueryString["PhoneNumber"].ToString()+"'", Con);
            SqlDataAdapter sda_FetchAllEmployees = new SqlDataAdapter(cmd_FetchAllEmployess);
            DataTable dt_FetchAllEmployees = new DataTable();
            sda_FetchAllEmployees.Fill(dt_FetchAllEmployees);

            rptrAllEmployees.DataSource = dt_FetchAllEmployees;
            rptrAllEmployees.DataBind();

            tbEmployeeName.Text = dt_FetchAllEmployees.Rows[0][1].ToString();
            tbEmployeeFathersName.Text = dt_FetchAllEmployees.Rows[0][2].ToString();
            tbEmployeeGrandFathersName.Text = dt_FetchAllEmployees.Rows[0][3].ToString();
            //tbEmployeePhoneNumber.Text= dt_FetchAllEmployees.Rows[0][10].ToString();
            //tbEmployeeEmailAddress.Text= dt_FetchAllEmployees.Rows[0][11].ToString();
            tbEnployeeSalary.Text = dt_FetchAllEmployees.Rows[0][5].ToString();
            ddlEmployeeBranch.Text = dt_FetchAllEmployees.Rows[0][6].ToString();
            ddlEployeePostion.Text = dt_FetchAllEmployees.Rows[0][7].ToString();

            if(dt_FetchAllEmployees.Rows[0][4].ToString() == "Male")
            {
                rbEmployeeGenderMale.Checked = true;
            }
            if (dt_FetchAllEmployees.Rows[0][4].ToString() == "Female")
            {
                rbEmployeeGenderFemale.Checked = true;
            }

            if(dt_FetchAllEmployees.Rows[0][14].ToString() == "ON")
            {
                lbtnActivateEmployeeAccount.Visible = false;
                lbtnDeactivateEmployeeAccount.Visible = true;
            }
            if (dt_FetchAllEmployees.Rows[0][14].ToString() == "OFF")
            {
                lbtnActivateEmployeeAccount.Visible = true;
                lbtnDeactivateEmployeeAccount.Visible = false;
            }

        }
    }
    private string getGender()
    {
        string gender;
        if (rbEmployeeGenderMale.Checked)
        {
            gender = "Male";
        }
        else
        {
            gender = "Female";
        }

        return gender;
    }
    protected void lbtnDeactivateEmployeeAccount_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_DeactivateEmployeeAccount = new SqlCommand("UPDATE Accounts SET Account_Status = 'OFF' WHERE PhoneNumber='"+ Request.QueryString["PhoneNumber"].ToString() + "'", Con);

            Con.Open();
            cmd_DeactivateEmployeeAccount.ExecuteNonQuery();
            Con.Close();

            fetchDetailPerEmployee();

            divAlertError.Visible = true;
            spnErrorAlertText.InnerHtml = "<i class='fa fa-check-circle'></i> Employee Account Has been Deactivatedd successfuly.";
        }
    }
    protected void lbtnActivateEmployeeAccount_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_ActivateEmployeeAccount = new SqlCommand("UPDATE Accounts SET Account_Status = 'ON'WHERE PhoneNumber='" + Request.QueryString["PhoneNumber"].ToString() + "'", Con);

            Con.Open();
            cmd_ActivateEmployeeAccount.ExecuteNonQuery();
            Con.Close();

            fetchDetailPerEmployee();

            divAlertSuccess.Visible = true;
            spnSuccessAlertText.InnerHtml = "<i class='fa fa-check-circle'></i> Employee Account Has been Activatedd successfuly.";
        }
    }
    protected void btnSaveChangeInEmployeeDetail_Click(object sender, EventArgs e)
    {

        using (SqlConnection Con = new SqlConnection(CS))
        {
            if (fupldEmployeePhoto.HasFile)
            {
                Byte[] bytes = null;

                string filename = fupldEmployeePhoto.PostedFile.FileName;
                string filePath = Path.GetFileName(filename);
                Stream fs = fupldEmployeePhoto.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                bytes = br.ReadBytes((Int32)fs.Length);

                SqlCommand cmd_UpdateEmployeDetail = new SqlCommand("UPDATE Employees SET FName=@FName, MName=@MName, LName=@LName, Gender=@Gender, Salary=@Salary, Branch=@Branch, Position=@Position, Photo=@Photo WHERE PhoneNumber='" + Request.QueryString["PhoneNumber"].ToString() + "'", Con);

                cmd_UpdateEmployeDetail.Parameters.Add("@FName", SqlDbType.NVarChar, 23).Value = tbEmployeeName.Text;
                cmd_UpdateEmployeDetail.Parameters.Add("@MName", SqlDbType.NVarChar, 23).Value = tbEmployeeFathersName.Text;
                cmd_UpdateEmployeDetail.Parameters.Add("@LName", SqlDbType.NVarChar, 23).Value = tbEmployeeGrandFathersName.Text;
                cmd_UpdateEmployeDetail.Parameters.Add("@Gender", SqlDbType.NVarChar, 7).Value = getGender();
                cmd_UpdateEmployeDetail.Parameters.Add("@Salary", SqlDbType.Float).Value = float.Parse(tbEnployeeSalary.Text);
                cmd_UpdateEmployeDetail.Parameters.Add("@Branch", SqlDbType.NVarChar, 20).Value = ddlEmployeeBranch.SelectedItem.Value;
                cmd_UpdateEmployeDetail.Parameters.Add("@Position", SqlDbType.NVarChar, 23).Value = ddlEployeePostion.SelectedItem.Value;
                cmd_UpdateEmployeDetail.Parameters.Add("@Photo", SqlDbType.Binary).Value = bytes;


                SqlCommand cmd_UpdateEmployeAccount = new SqlCommand("UPDATE Accounts SET Email=@Email WHERE PhoneNumber='" + Request.QueryString["PhoneNumber"].ToString() + "'", Con);
                cmd_UpdateEmployeAccount.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = tbEmployeeEmailAddress.Text;

                Con.Open();
                cmd_UpdateEmployeDetail.ExecuteNonQuery();
                cmd_UpdateEmployeAccount.ExecuteNonQuery();
                Con.Close();

                fetchDetailPerEmployee();

                divAlertSuccess.Visible = true;


            }

            else
            {
                SqlCommand cmd_UpdateEmployeDetail = new SqlCommand("UPDATE Employees SET FName=@FName, MName=@MName, LName=@LName, Gender=@Gender, Salary=@Salary, Branch=@Branch, Position=@Position WHERE PhoneNumber='" + Request.QueryString["PhoneNumber"].ToString() + "'", Con);

                cmd_UpdateEmployeDetail.Parameters.Add("@FName", SqlDbType.NVarChar, 23).Value = tbEmployeeName.Text;
                cmd_UpdateEmployeDetail.Parameters.Add("@MName", SqlDbType.NVarChar, 23).Value = tbEmployeeFathersName.Text;
                cmd_UpdateEmployeDetail.Parameters.Add("@LName", SqlDbType.NVarChar, 23).Value = tbEmployeeGrandFathersName.Text;
                cmd_UpdateEmployeDetail.Parameters.Add("@Gender", SqlDbType.NVarChar, 7).Value = getGender();
                cmd_UpdateEmployeDetail.Parameters.Add("@Salary", SqlDbType.Float).Value = float.Parse(tbEnployeeSalary.Text);
                cmd_UpdateEmployeDetail.Parameters.Add("@Branch", SqlDbType.NVarChar, 20).Value = ddlEmployeeBranch.SelectedItem.Value;
                cmd_UpdateEmployeDetail.Parameters.Add("@Position", SqlDbType.NVarChar, 23).Value = ddlEployeePostion.SelectedItem.Value;

                SqlCommand cmd_UpdateEmployeAccount = new SqlCommand("UPDATE Accounts SET Email=@Email WHERE PhoneNumber='" + Request.QueryString["PhoneNumber"].ToString() + "'", Con);
                cmd_UpdateEmployeAccount.Parameters.Add("@Email", SqlDbType.NVarChar, 50).Value = tbEmployeeEmailAddress.Text;

                Con.Open();
                cmd_UpdateEmployeDetail.ExecuteNonQuery();
                cmd_UpdateEmployeAccount.ExecuteNonQuery();
                Con.Close();

                fetchDetailPerEmployee();

                divAlertSuccess.Visible = true;
            }

        }


    }
}