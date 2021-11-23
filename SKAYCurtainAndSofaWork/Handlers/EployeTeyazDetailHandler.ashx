<%@ WebHandler Language="C#" Class="EployeTeyazDetailHandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class EployeTeyazDetailHandler : IHttpHandler {
    
   public void ProcessRequest (HttpContext context) {
        SqlDataReader rdr = null;
            SqlConnection conn = new SqlConnection (ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString);
            SqlCommand selcmd = null;
            try
            {
                
                selcmd = new SqlCommand("SELECT Teyaz_Detail FROM Employees WHERE PhoneNumber='"+context.Request.QueryString["PhoneNumber"].ToString()+"'", conn);
                conn.Open();
                rdr=selcmd.ExecuteReader();
                while (rdr.Read())
                {
                    context.Response.ContentType = "image/jpg";
                    context.Response.BinaryWrite((byte[])rdr["Teyaz_Detail"]);
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