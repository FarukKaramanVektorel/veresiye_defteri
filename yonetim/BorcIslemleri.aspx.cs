using System;
using System.Linq;

public partial class yonetim_BorcOde : System.Web.UI.Page
{
    dcDataContext db = new dcDataContext();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        txtTarih.Text = DateTime.Now.ToString();
        string id = Request.QueryString["mId"];

        if (id != null)
        {
            
            var musteri = (from i in db.tblMusterilers
                           where i.m_id.ToString() == id
                           select i).First();
            lblMusteri.Text = musteri.m_ad + " " + musteri.m_soyad;
            double toplamalacak = 0;
            var ch = from i in db.tblCariHarekets
                     where i.m_id == musteri.m_id
                     select i;
            double Odenen = 0;
            double Alinan = 0;
            foreach (var borc in ch)
            {
                if(borc.ch_harekettipi==0)
                Odenen += Convert.ToDouble(borc.ch_tutar);
                else if(borc.ch_harekettipi==1)
                    Alinan+= Convert.ToDouble(borc.ch_tutar);
            }            
            toplamalacak += Alinan-Odenen;

            lblBorc.Text += String.Format("{0:0.00}", Convert.ToDouble(toplamalacak)) + " TL";
        }
    }

    

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtTutar.Text == "")
        {
            lblDurum.Text="Lütfen tutar giriniz.";
        }
        else
        {

            string id = Request.QueryString["mId"];
            tblCariHareket yeni=new tblCariHareket();
            if (txtTarih.Text == string.Empty)
            {
                yeni.ch_tarih =DateTime.Now.ToShortDateString();
            }
            else
            {
                yeni.ch_tarih =txtTarih.Text;
            }
            
            yeni.ch_aciklama = txtAciklama.Text;
            yeni.ch_tutar = Convert.ToDouble((txtTutar.Text).Replace('.',','));
            yeni.ch_urun =  txtUrun.Text;
            yeni.m_id = Convert.ToInt32(id);
            if(ddlİslem.SelectedValue=="0")
            { yeni.ch_harekettipi = 0; }
            else { yeni.ch_harekettipi = 1; }            
            db.tblCariHarekets.InsertOnSubmit(yeni);
            db.SubmitChanges();
            Response.Redirect("MusteriDetay.aspx?mId=" + id);







        }
    }
   
}