using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_CariIslemDuzenle : System.Web.UI.Page
{
    dcDataContext db = new dcDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        string cid = Request.QueryString["cID"];

        if (cid != null)
        {
            if (!IsPostBack)
            {
                CariIslemDoldur(cid);
            }

        }
    }

    private void CariIslemDoldur(string cid)
    {
        var cislem = (from i in db.tblCariHarekets
                      where i.ch_id.ToString() == cid
                      select i).Single();
        txtAciklama.Text = cislem.ch_aciklama;
        txtTarih.Text = cislem.ch_tarih;
        txtTutar.Text = String.Format("{0:0.00}",cislem.ch_tutar);
        txtUrun.Text = cislem.ch_urun;
        ddlİslem.SelectedValue = cislem.ch_harekettipi.ToString();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string cid = Request.QueryString["cID"];
        string mid = Request.QueryString["mId"];

        var cislem = (from i in db.tblCariHarekets
                      where i.ch_id.ToString() == cid
                      select i).Single();

        cislem.ch_aciklama = txtAciklama.Text;
        cislem.ch_tarih = txtTarih.Text;
        cislem.ch_tutar = Convert.ToDouble(txtTutar.Text);
        cislem.ch_urun = txtUrun.Text;
        cislem.ch_harekettipi = Convert.ToInt32(ddlİslem.SelectedValue);
        db.SubmitChanges();
        Response.Redirect("MusteriDetay.aspx?mId=" + mid);
    }
}