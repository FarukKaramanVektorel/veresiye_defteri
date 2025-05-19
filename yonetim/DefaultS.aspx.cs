using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_Default : System.Web.UI.Page
{
    dcDataContext db=new dcDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMusteri.Text = ToplamMusteri();
        lblTSatis.Text = ToplamSatis();
        lblAlinan.Text = ToplamAlinan();
        lblAlinacak.Text = ToplamAlacak();
        MusteriListele();
    }

    private void MusteriListele()
    {
        var musteriler = from i in db.tblMusterilers
                         orderby i.m_ad
                         select i;

        foreach (var m in musteriler)
        {
            double toplamalacak = 0;
            var ch = from i in db.tblCariHarekets
                     where i.m_id == m.m_id
                     select i;
            var cth = from i in db.tblCariHarekets
                      where i.m_id == m.m_id
                      orderby i.ch_id ascending
                      select i;

            DateTime tarih = DateTime.Today;
            DateTime bgun = DateTime.Today;
            foreach (var trh in cth)
            {
                tarih = Convert.ToDateTime(trh.ch_tarih);
            }
            TimeSpan Sonuc = bgun - tarih;

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

            lblMusteriler.Text += "<tr><td>" + m.m_ad + " " + m.m_soyad + "</td>" +
                "<td>" + m.m_ceptel + "</td>" +
                "<td>" + m.m_aciklama + "</td>" +
                "<td><a href='MusteriDetay.aspx?mId=" + m.m_id + "'><img width=\"30\" src=\"img/profile.png\" alt=\"Müşteri Düzenle\" /></a>" +
                "<a href='BorcIslemleri.aspx?mId=" + m.m_id + "'><img width=\"30\" src=\"img/odeme.png\" /></a>" +
                "<a href='MusteriEkleGuncelle.aspx?mId=" + m.m_id + "'><img width=\"30\" src=\"img/medit.png\" /></a</td>" +
                "<td>" + String.Format("{0:0.00}", toplamalacak) + " TL</td>" +
                "<td>" + Math.Floor(Sonuc.TotalDays) + " gündür işlem yapılmıyor!</td></tr>";
        }
    }

    private string ToplamAlacak()
    {
        double satis = Convert.ToDouble(ToplamSatis());
        double alinan = Convert.ToDouble(ToplamAlinan());
        return (satis - alinan).ToString("###,##0.####");
    }

    private string ToplamAlinan()
    {
        double TAlinan = 0;
        var satis = from i in db.tblCariHarekets
                    where i.ch_harekettipi == 0
                    select i;
        foreach (var s in satis)
        {
            TAlinan += Convert.ToDouble(s.ch_tutar);
        }
        return TAlinan.ToString("###,##0.####");
    }

    private string ToplamSatis()
    {
        double TSatis = 0;
        var satis = from i in db.tblCariHarekets
                    where i.ch_harekettipi == 1
                    select i;
        foreach (var s in satis)
        {
            TSatis += Convert.ToDouble(s.ch_tutar);
        }
        return TSatis.ToString("###,##0.####");
    }

    private string ToplamMusteri()
    {
        var musteri = from i in db.tblMusterilers
                      select i;
        return musteri.Count().ToString("###,##0.####");
    }
}