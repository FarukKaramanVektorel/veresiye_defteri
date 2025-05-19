using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_MusteriDetay : System.Web.UI.Page
{
    dcDataContext db = new dcDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["mId"];
        if (id != null)
        {
            musteriIslem(id);
            var musteri = (from i in db.tblMusterilers
                           where i.m_id.ToString() == id
                           select i).First();
            lblMusteri.Text += musteri.m_ad + " " + musteri.m_soyad;
            lblTelefon.Text += musteri.m_ceptel;
            lblAciklama.Text += musteri.m_aciklama;
            lblAdres.Text += musteri.m_adres;

            double toplamalacak = 0;
            var ch = from i in db.tblCariHarekets
                     where i.m_id == musteri.m_id
                     select i;
            double Odenen = 0;
            double Alinan = 0;
            foreach (var borc in ch)
            {
                if (borc.ch_harekettipi == 0)
                    Odenen += Convert.ToDouble(borc.ch_tutar);
                else if (borc.ch_harekettipi == 1)
                    Alinan += Convert.ToDouble(borc.ch_tutar);
            }
            toplamalacak += Alinan - Odenen;
            lblBorc.Text += String.Format("{0:0.00}", Convert.ToDouble(toplamalacak)) + " TL";
            lblToplamAlinan.Text += Alinan + " TL";
            lblToplamOdenen.Text += Odenen + " TL";
            Label1.Text += "<a href='BorcIslemleri.aspx?mId=" + musteri.m_id + "'><img width=\"50\" src=\"img/odeme.png\" /></a>";
        }

    }
    private void musteriIslem(string id)
    {
        var mislem = from i in db.tblCariHarekets
                     where i.m_id.ToString() == id
                     orderby i.ch_id descending
                     select i;
        var sb = new StringBuilder();
        foreach (var m in mislem)
        {
            DateTime tar = Convert.ToDateTime(m.ch_tarih);
            m.ch_tarih = tar.ToShortDateString();
            if (m.ch_harekettipi == 0)
            {
                sb.Append("<tr class=\"text-success\"><td><strong>Borç Ödeme</strong></td>" +
                    "<td>" + m.ch_tarih + "</td>" +
                   "<td>" + m.ch_urun + "</td>" +
                   "<td>" + m.ch_aciklama + "</td>" +
                  "<td>" + String.Format("{0:0.00}", m.ch_tutar) + " TL</td>"+
                  "<td><a href='CariIslemDuzenle.aspx?cID="+m.ch_id+"&mId="+id+"'><img width=\"30\" src=\"img/medit.png\" /></a></td>");
            }
            else
            {
                sb.Append("<tr class=\"text-danger\"><td><strong>Alış Veriş</strong></td>" +
                    "<td>" + m.ch_tarih + "</td>" +
                   "<td>" + m.ch_urun + "</td>" +
                   "<td>" + m.ch_aciklama + "</td>" +
                  "<td>" + String.Format("{0:0.00}", m.ch_tutar) + " TL</td>"+
                   "<td><a href='CariIslemDuzenle.aspx?cID=" + m.ch_id + "&mId=" + id + "'><img width=\"30\" src=\"img/medit.png\" /></a></td>");
            }

        }
        lblMusteriler.Text = sb.ToString();
    } 
}