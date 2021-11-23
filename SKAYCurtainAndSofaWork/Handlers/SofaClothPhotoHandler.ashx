<%@ WebHandler Language="C#" Class="SofaClothPhotoHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class SofaClothPhotoHandler : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
       SqlDataReader rdr = null;
            SqlConnection conn = new SqlConnection (ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString);
            SqlCommand selcmd = null;
            try
            {
                
                selcmd = new SqlCommand("SELECT Photo FROM SofaCloths WHERE IdNumber='"+context.Request.QueryString["IdNumber"].ToString()+"'", conn);
                conn.Open();
                rdr=selcmd.ExecuteReader();
                while (rdr.Read())
                {
                    context.Response.ContentType = "image/jpg";
                    context.Response.BinaryWrite((byte[])rdr["Photo"]);
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