using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class yonetim_Login : System.Web.UI.Page
{
    dcDataContext db = new dcDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        HttpCookie Cookie = Request.Cookies["enkaLogin"];
        if (Cookie?["Konum"] == "YıldızTabya")
        {
            Session["Admin"] = true;
            Response.Redirect("Default.aspx");
        };       
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        var admin = (from i in db.tblAyarlars
                    where i.id == 1
                    select i).First();
        if (txtKadi.Text == admin.k_adi && txtParola.Text == admin.sifre)
        {
            Session["Admin"] = true;
            if (Response.Cookies["enkaLogin"] == null)
            {
                //Cookie nesnesi oluşturuyoruz.
                HttpCookie Cookie = new HttpCookie("enkaLogin");
                //Cookie bilgilerini tanımlıyoruz.
                Cookie["Konum"] = "YıldızTabya";
                Cookie["MusteriNo"] = "En-Ka-001";
                Cookie["EPosta"] = "enkacelik@gmail.com";
                Cookie["Nitelik"] = "Zunccaciye";
                //Cookie'nin tutulacak süresini belirtiyoruz.
                Cookie.Expires = DateTime.Now.AddMinutes(100);
                //Cookie'yi ekleyerek, fiziksel olarak oluşturuyoruz.
                Response.Cookies.Add(Cookie);
            }
            Response.Redirect("Default.aspx");
        }
        else
        {
            lblDurum.Text = "Kullanıcı Adı veya Parola Hatalı!!!";
        }


    }
}