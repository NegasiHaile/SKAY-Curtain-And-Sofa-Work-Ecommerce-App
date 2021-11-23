using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class _2AdminArea_WriteHelp : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserPhoneNumber"] != null)
        {
            if (!IsPostBack)
            {
                FetchHelpsData();
            }
            divAlertSuccess.Visible = false;
            divAlertError.Visible = false;
        }

        else
        {
            Response.Redirect("../4CustomerArea/LogIn.aspx");
        }

    }

    private void FetchHelpsData()
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_FetchHelpsData = new SqlCommand("Select * From Helps  Order by Id DESC", Con);
            SqlDataAdapter sda_FetchHelpsData = new SqlDataAdapter(Cmd_FetchHelpsData);
            DataTable dt_FetchHelpsData = new DataTable();
            sda_FetchHelpsData.Fill(dt_FetchHelpsData);


            rptrHelpsList.DataSource = dt_FetchHelpsData;
            rptrHelpsList.DataBind();
        }
    }

    protected void btnAddNewHelp_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            SqlCommand Cmd_Insert_Help = new SqlCommand(
                               "INSERT INTO Helps (Help_Subject, Help_Detail) " +
                               "Values(@Help_Subject, @Help_Detail)", Con);
            Cmd_Insert_Help.Parameters.Add("@Help_Subject",
                SqlDbType.NVarChar, 100).Value = tbhelpSubject.Text;
            Cmd_Insert_Help.Parameters.Add("@Help_Detail",
                SqlDbType.NVarChar, 600).Value = tbHelpDetail.Value;

            Con.Open();
            Cmd_Insert_Help.ExecuteNonQuery();
            Con.Close();

            FetchHelpsData();
            divAlertSuccess.Visible = true;
            spnAlertSuccess.InnerHtml = "<i class='fa fa-check-circle'></i> Help added successfuly!";
        }
        }
    protected void lbtnHelpEditSaveChange_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            RepeaterItem Item = (sender as LinkButton).NamingContainer as RepeaterItem;

            string IdNumber = (Item.FindControl("lblHelpId") as Label).Text;
            string helpSubject = (Item.FindControl("tbEditHelpSubject") as TextBox).Text;
            string helpdetail = (Item.FindControl("tbEditHelpDetail") as TextBox).Text;

            SqlCommand cmd_Update_Help = new SqlCommand("UPDATE Helps SET Help_Subject=@Help_Subject, Help_Detail=@Help_Detail WHERE Id='" + IdNumber + "'", Con);


            cmd_Update_Help.Parameters.Add("@Help_Subject",
                SqlDbType.NVarChar, 100).Value = helpSubject;
            cmd_Update_Help.Parameters.Add("@Help_Detail",
                SqlDbType.NVarChar, 600).Value = helpdetail;

            Con.Open();
            cmd_Update_Help.ExecuteNonQuery();
            Con.Close();
            
            FetchHelpsData();
            divAlertSuccess.Visible = true;
            spnAlertSuccess.InnerHtml = "<i class='fa fa-check-circle'></i> The help detail is successfuly updated.";
        }
    }

    protected void lbtnHelpDelete_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection(CS))
        {
            RepeaterItem Item = (sender as LinkButton).NamingContainer as RepeaterItem;

            string IdNumber = (Item.FindControl("lblHelpId") as Label).Text;

            SqlCommand cmd_Delete_Help = new SqlCommand("DELETE FROM Helps WHERE Id='" + IdNumber + "'", Con);

            Con.Open();
            cmd_Delete_Help.ExecuteNonQuery();
            Con.Close();

            FetchHelpsData();
            divAlertSuccess.Visible = true;
            spnAlertSuccess.InnerHtml = "<i class='fa fa-check-circle'></i> Item deleted successfuly.";
        }
    }
}