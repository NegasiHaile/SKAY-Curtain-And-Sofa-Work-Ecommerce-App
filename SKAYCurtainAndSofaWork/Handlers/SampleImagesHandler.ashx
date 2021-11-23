<%@ WebHandler Language="C#" Class="SampleImagesHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public class SampleImagesHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
                 SqlDataReader rdr = null;
            SqlConnection conn = new SqlConnection (ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString);
           // SqlCommand selcmd = null;

        try
            {
                
              SqlCommand  selcmd = new SqlCommand("SELECT Image FROM Samples WHERE Id='"+context.Request.QueryString["Id"].ToString()+"'", conn);
                conn.Open();
                rdr=selcmd.ExecuteReader();
                while (rdr.Read())
                {
                    context.Response.ContentType = "image/jpg";
                    context.Response.BinaryWrite((byte[])rdr["Image"]);
                }             
                rdr.Close();
            }
            finally
            {
                conn.Close();
            } 
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}