<%@ WebHandler Language="C#" Class="DeletSofaClothHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public class DeletSofaClothHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
         SqlConnection Con = new SqlConnection (ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString);
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

       
            SqlCommand cmd_DeleteSofaCloth = new SqlCommand("DELETE FROM SofaCloths WHERE IdNumber='" + context.Request.QueryString["IdNumber"].ToString() + "'", Con);

            Con.Open();
            cmd_DeleteSofaCloth.ExecuteNonQuery();
            Con.Close();
            context.Response.Redirect("../2AdminArea/SofaClothRegistration.aspx");
       
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}