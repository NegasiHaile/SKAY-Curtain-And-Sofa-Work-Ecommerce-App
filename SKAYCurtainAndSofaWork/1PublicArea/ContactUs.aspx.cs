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

public partial class _1PublicArea_ContactUs : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        divAlertError.Visible = false;
        divAlertSuccess.Visible = false;
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

                Cmd_InsertFeedBack.Parameters.Add("@Subject", SqlDbType.NVarChar, 100).Value = tbFeedBackerPhoneNo.Text;


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
}