<%@ WebHandler Language="C#" Class="AccessoriesPhotoHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class AccessoriesPhotoHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        SqlDataReader rdr = null;
        SqlConnection conn = new SqlConnection (ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString);

        int Acce_Id = int.Parse(context.Request.QueryString["Id"]);
         try
            {
              SqlCommand  selcmd = new SqlCommand("SELECT Acce_Photo FROM Accessories WHERE Id='"+Acce_Id+"'", conn);
                conn.Open();
                rdr=selcmd.ExecuteReader();
                while (rdr.Read())
                {
                    context.Response.ContentType = "image/jpg";
                    context.Response.BinaryWrite((byte[])rdr["Acce_Photo"]);
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