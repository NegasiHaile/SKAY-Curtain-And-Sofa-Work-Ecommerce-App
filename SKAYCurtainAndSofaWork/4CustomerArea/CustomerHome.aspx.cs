using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _4CustomerArea_CustomerHome : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    public string CustomName;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null && Session["AccountType"].ToString() == "Customer")
        {
            divCustomWelcome.Visible = true;
            defaultwelcom.Visible = false;
            divAlertSuccess.Visible = false;
            divAlertError.Visible = false;
            if (!IsPostBack)
                {
                    //string data = Request.QueryString["IdNumber"].ToString();
                    //string[] dArr = data.Split(',');

                    //SofaClothIdNumber = dArr[1];

                    FetchUserDetail();
                }
                // ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
                
        }

        else
        {
            defaultwelcom.Visible = true;
            divCustomWelcome.Visible = false;
            divAlertSuccess.Visible = false;
            divAlertError.Visible = false;
            //Response.Redirect("../1PublicArea/LogIn.aspx");
        }
    }

    private void CheckCookie()
    {
        //HttpCookie cookie = Request.Cookies["NoOfMaterial"];
        //string Materials = cookie["Materials"].ToString();
        //if (cookie["Materials"] == null)
        //{

        //}
        //else
        //{

        //}
    }

    private void FetchUserDetail()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand cmd_fetchUserDetail = new SqlCommand("Select * FROM Customers INNER JOIN Accounts ON Customers.PhoneNumber = Accounts.PhoneNumber WHERE Customers.PhoneNumber='"+ Session["UserPhoneNumber"] +"'", Con);
            SqlDataAdapter sda_fetchUserDetail = new SqlDataAdapter(cmd_fetchUserDetail);
            DataTable dt_fetchUserDetail = new DataTable();
            sda_fetchUserDetail.Fill(dt_fetchUserDetail);

            CustomName = dt_fetchUserDetail.Rows[0][1].ToString();
            spnUserFullName.InnerText = dt_fetchUserDetail.Rows[0][1].ToString();
        }
        }
    protected void btnSendFeedBack_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection Con = new SqlConnection(CS))
            {

                SqlCommand Cmd_InsertFeedBack = new SqlCommand(
                                        "INSERT INTO FeedBacks (FullName, Phone_Email, Subject, Message, Status) " +
                                        "Values(@FullName, @Phone_Email, @Subject, @Message, @Status)", Con);
                Cmd_InsertFeedBack.Parameters.Add("@FullName", SqlDbType.NVarChar, 50).Value = tbFeedBackerName.Text;

                Cmd_InsertFeedBack.Parameters.Add("@Phone_Email", SqlDbType.NVarChar, 13).Value = tbFeedBackerPhoneNo.Text;

                Cmd_InsertFeedBack.Parameters.Add("@Subject", SqlDbType.NVarChar, 100).Value = tbFeedBackSubject.Text;


                Cmd_InsertFeedBack.Parameters.Add("@Message", SqlDbType.NVarChar, 500).Value = tbFeedBackDetail.Text;

                Cmd_InsertFeedBack.Parameters.Add("@Status", SqlDbType.NVarChar, 10).Value = "New";

                Con.Open();
                Cmd_InsertFeedBack.ExecuteNonQuery();
                Con.Close();

                tbFeedBackerName.Text = "";
                tbFeedBackerPhoneNo.Text = "";
                tbFeedBackSubject.Text = "";
                tbFeedBackDetail.Text = "";
                tbFeedBackerName.Focus();

                divAlertError.Visible = false;
                divAlertSuccess.Visible = true;
            }
        }
        catch
        {
            divAlertSuccess.Visible = false;
            divAlertError.Visible = true;
        }
    }
    //protected void btnSaveFreReplay_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        using (SqlConnection Con = new SqlConnection(CS))
    //        {

    //            SqlCommand Cmd_InsertFeedBack = new SqlCommand(
    //                                    "INSERT INTO FeedBacks (FullName, Phone_Email, Subject, Message, Status) " +
    //                                    "Values(@FullName, @Phone_Email, @Subject, @Message, @Status)", Con);
    //            Cmd_InsertFeedBack.Parameters.Add("@FullName", SqlDbType.NVarChar, 50).Value = "F.T.A";

    //            Cmd_InsertFeedBack.Parameters.Add("@Phone_Email", SqlDbType.NVarChar, 13).Value = "0901266946";

    //            Cmd_InsertFeedBack.Parameters.Add("@Subject", SqlDbType.NVarChar, 100).Value = "Replay My Feeling";


    //            Cmd_InsertFeedBack.Parameters.Add("@Message", SqlDbType.NVarChar, 500).Value = tbfreReplay.Text;

    //            Cmd_InsertFeedBack.Parameters.Add("@Status", SqlDbType.NVarChar, 10).Value = "New";

    //            Con.Open();
    //            Cmd_InsertFeedBack.ExecuteNonQuery();
    //            Con.Close();
    //            Response.Write("<script>alert('mesage successfuly sent.')</script>");
    //        }
    //    }
    //    catch
    //    {
    //        Response.Write("<script>alert('mesage not sent, Try again.')</script>");
    //    }

    //}
}