using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_MusteriEkleGuncelle : System.Web.UI.Page
{
    dcDataContext db = new dcDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Visible = false;
        Button2.Visible = false;

        string id = Request.QueryString["mId"];

        if (id != null)
        {
            Button1.Visible = false;
            Button2.Visible = true;
            Button3.Visible = true;
            if (!IsPostBack)
            {
                MusteriDoldur(id);
            }
           
        }
        else
        {
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }
    }

    private void MusteriDoldur(string id)
    {
        var musteri=(from i in db.tblMusterilers
                     where i.m_id.ToString() == id
                     select i).First();
        txtAd.Text=musteri.m_ad;
        txtSoyad.Text=musteri.m_soyad;
        txtTelefon.Text = musteri.m_ceptel;
        txtAdres.Text = musteri.m_adres;
        txtAciklama.Text = musteri.m_aciklama;

    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        string ad = txtAd.Text.ToUpper();
        string soyad = txtSoyad.Text.ToUpper();
        string telefon = txtTelefon.Text;

        // Aynı ad, soyad ve telefon numarasına sahip başka bir müşteri var mı kontrol et
        bool varMi = db.tblMusterilers.Any(m => m.m_ad.ToUpper() == ad && m.m_soyad.ToUpper() == soyad && m.m_ceptel == telefon);
        if (varMi)
        {
            // Uyarı mesajı göster
            lblMesaj.Text = "Bu müşteri zaten kayıtlı!";
            return;
        }

        tblMusteriler musteri = new tblMusteriler();
        musteri.m_ad = ad;
        musteri.m_soyad = soyad;
        musteri.m_ceptel = telefon;
        musteri.m_adres = txtAdres.Text;
        musteri.m_aciklama = txtAciklama.Text;
        db.tblMusterilers.InsertOnSubmit(musteri);
        db.SubmitChanges();
        var sonM = (from i in db.tblMusterilers
                    orderby i.m_id descending
                    select i.m_id).First();
        Response.Redirect("BorcIslemleri.aspx?mId=" + sonM);
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["mId"];
        var musteri = (from i in db.tblMusterilers
                       where i.m_id.ToString() == id
                       select i).First();
        musteri.m_ad = txtAd.Text.ToUpper();
        musteri.m_soyad = txtSoyad.Text.ToUpper();
        musteri.m_ceptel = txtTelefon.Text;
        musteri.m_adres = txtAdres.Text;
        musteri.m_aciklama = txtAciklama.Text;        
        db.SubmitChanges();      
        Response.Redirect("MusteriDetay.aspx?mId=" + id);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["mId"];
        var musteri = (from i in db.tblMusterilers
                       where i.m_id.ToString() == id
                       select i).First();



        var chList = db.tblCariHarekets.Where(ch => ch.m_id.ToString() == id);

        

        double Odenen = chList.Where(ch => ch.ch_harekettipi == 0).Sum(ch => (double?)ch.ch_tutar) ?? 0;
        double Alinan = chList.Where(ch => ch.ch_harekettipi == 1).Sum(ch => (double?)ch.ch_tutar) ?? 0;

        double toplamalacak = Alinan - Odenen;



       

        if (toplamalacak > 0)
        {
            lblMesaj.Text = "Müşterinin " + toplamalacak +" TL borcu olduğu için silme işlemi yapılamaz!";
            return;
        }

        // Borcu yoksa müşteriyi sil
        db.tblMusterilers.DeleteOnSubmit(musteri);
        db.SubmitChanges();

        Response.Redirect("MusteriListele.aspx");
    }

}