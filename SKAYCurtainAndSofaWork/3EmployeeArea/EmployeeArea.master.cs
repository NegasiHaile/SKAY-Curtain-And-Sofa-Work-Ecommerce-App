using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _3EmployeeArea_EmployeeArea : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lbtnLogOut_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Redirect("../1PublicArea/LogIn.aspx");

    }
}
