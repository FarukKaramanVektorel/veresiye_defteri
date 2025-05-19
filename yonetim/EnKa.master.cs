using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_EnKa : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie Cookie = Request.Cookies["enkaLogin"];
        if (Cookie?["Konum"] == "YıldızTabya")
        {
            Session["Admin"] = true;
        };
        if ((bool)Session["Admin"] != true)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void imgBtn_Click(object sender, ImageClickEventArgs e)
    {
        Session["Admin"] = false;
        Response.Redirect("Login.aspx");
    }
}
