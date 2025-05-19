using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_CariCek : System.Web.UI.Page
{
    dcDataContext db = new dcDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    private void BindGrid()
    {
        using (dcDataContext context = new dcDataContext())
        {
            var cariHareketler = context.tblCariHarekets.ToList();
            GridView1.DataSource = cariHareketler;
            GridView1.DataBind();
        }
    }
}