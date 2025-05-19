using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_MusteriDetay : System.Web.UI.Page
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
           


            var cariHareketler = context.tblMusterilers.ToList();

            // Sütunların adlarını al
            var columns = cariHareketler.FirstOrDefault()?.GetType().GetProperties();

            if (columns != null)
            {
                foreach (var column in columns)
                {
                    BoundField field = new BoundField();
                    field.DataField = column.Name;
                    field.HeaderText = $"{column.Name} ({column.PropertyType.Name})";
                    GridView1.Columns.Add(field);
                }
            }

            GridView1.DataSource = cariHareketler;
            GridView1.DataBind();

        }
    }
}