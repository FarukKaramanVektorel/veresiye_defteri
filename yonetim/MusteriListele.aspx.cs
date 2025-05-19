using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_MusteriListele : System.Web.UI.Page
{
    dcDataContext db = new dcDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        var musteriler = db.tblMusterilers.ToList();

        var satislar = db.tblCariHarekets
            .Where(i => i.ch_harekettipi == 1)
            .ToList();

        var alinanlar = db.tblCariHarekets
            .Where(i => i.ch_harekettipi == 0)
            .ToList();

        var today = DateTime.Today;

        var sb = new StringBuilder();
        foreach (var m in musteriler)
        {
            double toplamBorc = 0;
            var satislarMusteri = satislar.Where(i => i.m_id == m.m_id).ToList();
            var alinanlarMusteri = alinanlar.Where(i => i.m_id == m.m_id).ToList();

            double toplamAlinan = alinanlarMusteri.Sum(i => Convert.ToDouble(i.ch_tutar));
            double toplamOdenen = satislarMusteri.Sum(i => Convert.ToDouble(i.ch_tutar));

            if (satislarMusteri.Any())
            {
                var sonSatisTarihi = satislarMusteri.Max(i => Convert.ToDateTime(i.ch_tarih));
                TimeSpan gecenGun = today - sonSatisTarihi;
                toplamBorc = toplamOdenen - toplamAlinan;
                sb.Append("<tr><td>" + m.m_ad + " " + m.m_soyad + "</td>" +
                          "<td>" + m.m_ceptel + "</td>" +
                          "<td>" + m.m_aciklama + "</td>" +
                          "<td><a href='MusteriDetay.aspx?mId=" + m.m_id + "'><img width=\"30\" src=\"img/profile.png\" alt=\"Müşteri Düzenle\" /></a>" +
                          "<a href='BorcIslemleri.aspx?mId=" + m.m_id + "'><img width=\"30\" src=\"img/odeme.png\" /></a>" +
                          "<a href='MusteriEkleGuncelle.aspx?mId=" + m.m_id + "'><img width=\"30\" src=\"img/medit.png\" /></a</td>" +
                          "<td>" + String.Format("{0:0.00}", toplamBorc) + " TL</td>" +
                          "<td>" + Math.Floor(gecenGun.TotalDays) + " gündür işlem yapılmıyor!</td></tr>");
            }
        }

        lblMusteriler.Text = sb.ToString();
       
    }
}
