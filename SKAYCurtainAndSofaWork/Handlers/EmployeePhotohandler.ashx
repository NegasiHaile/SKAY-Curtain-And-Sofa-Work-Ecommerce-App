<%@ WebHandler Language="C#" Class="EmployeePhotohandler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class EmployeePhotohandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        SqlDataReader rdr = null;
            SqlConnection conn = new SqlConnection (ConfigurationManager.ConnectionStrings["SKYCurtainWorkCS"].ConnectionString);
            SqlCommand selcmd = null;
            try
            {
                selcmd = new SqlCommand("SELECT Photo FROM Employees WHERE PhoneNumber='"+context.Request.QueryString["PhoneNumber"].ToString()+"'", conn);
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