using System;
using System.Data;
using System.IO;
using System.Linq;
using OfficeOpenXml;

public partial class yonetim_AlacakListele : System.Web.UI.Page
{
    dcDataContext db = new dcDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        var musteriler = db.tblMusterilers.OrderBy(i => i.m_ad).ToList();

        foreach (var m in musteriler)
        {
            var chList = db.tblCariHarekets.Where(ch => ch.m_id == m.m_id).ToList();

            DateTime bgun = DateTime.Today;
            TimeSpan Sonuc = TimeSpan.Zero;

            if (chList.Any())
            {
                DateTime tarih = Convert.ToDateTime(chList.Last().ch_tarih);
                Sonuc = bgun - tarih;
            }

            double Odenen = chList.Where(ch => ch.ch_harekettipi == 0).Sum(ch => (double?)ch.ch_tutar) ?? 0;
            double Alinan = chList.Where(ch => ch.ch_harekettipi == 1).Sum(ch => (double?)ch.ch_tutar) ?? 0;

            double toplamalacak = Alinan - Odenen;

            if (toplamalacak > 0)
            {
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
    }




    protected void btnExtractToExcel_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("AdiSoyadi", typeof(string));
        dt.Columns.Add("Telefonu", typeof(string));
        dt.Columns.Add("Aciklama", typeof(string));
        dt.Columns.Add("ToplamBorc", typeof(string));
        dt.Columns.Add("ExportTarihi", typeof(string));

        var query = from m in db.tblMusterilers
                    join ch in db.tblCariHarekets on m.m_id equals ch.m_id into gj
                    from subch in gj.DefaultIfEmpty()
                    orderby m.m_ad
                    select new
                    {
                        Musteri = m,
                        SonIslemTarihi = !string.IsNullOrEmpty(subch.ch_tarih) ? Convert.ToDateTime(subch.ch_tarih) : DateTime.Today


                    };

        foreach (var item in query)
        {
            double toplamalacak = 0;
            var chList = db.tblCariHarekets.Where(ch => ch.m_id == item.Musteri.m_id);

            DateTime bgun = DateTime.Today;
            TimeSpan Sonuc = bgun - item.SonIslemTarihi;

            double Odenen = chList.Where(ch => ch.ch_harekettipi == 0).Sum(ch => (double?)ch.ch_tutar) ?? 0;
            double Alinan = chList.Where(ch => ch.ch_harekettipi == 1).Sum(ch => (double?)ch.ch_tutar) ?? 0;

            toplamalacak = Alinan - Odenen;

            if (toplamalacak > 0)
            {
                DataRow dr = dt.NewRow();
                dr["AdiSoyadi"] = item.Musteri.m_ad + " " + item.Musteri.m_soyad;
                dr["Telefonu"] = item.Musteri.m_ceptel;
                dr["Aciklama"] = item.Musteri.m_aciklama;
                dr["ToplamBorc"] = String.Format("{0:0.00}", toplamalacak) + " TL";
                dr["ExportTarihi"] = bgun.ToShortDateString();
                dt.Rows.Add(dr);
            }
        }

        string excelFileName = "AlacakListesi.xlsx";
        string filePath = Server.MapPath("~/excel/" + excelFileName);
        FileInfo file = new FileInfo(filePath);
        if (file.Exists)
        {
            file.Delete();
        }

        using (ExcelPackage package = new ExcelPackage(file))
        {
            ExcelWorksheet worksheet = package.Workbook.Worksheets.Add("AlacakListesi");

            for (int i = 0; i < dt.Columns.Count; i++)
            {
                worksheet.Cells[1, i + 1].Value = dt.Columns[i].ColumnName;
            }

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    worksheet.Cells[i + 2, j + 1].Value = dt.Rows[i][j];
                }
            }

            package.Save();
        }

        Response.Clear();
        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        Response.AddHeader("content-disposition", "attachment;  filename=" + excelFileName);
        Response.TransmitFile(filePath);
        Response.End();
    }


}