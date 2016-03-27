using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cicek3
{
    public partial class KullaniciBilgileri : System.Web.UI.Page
    {
        UserTbl kullanici = new UserTbl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Kullanici"]) == "") { Response.Redirect("Giris.aspx"); Response.End(); }
            kullanici = (UserTbl)Session["Kullanici"];

            //Image1.ImageUrl = "Images/Users/"+kullanici.KullaniciAdi+"/"+kullanici.Resim+"";

            img1.Src = "Images/Users/" + kullanici.KullaniciAdi + "/" + kullanici.Resim + "";
            lbl_KullaniciAdSoyad.Text = kullanici.Ad + " " + kullanici.Soyad;
            lbl_Il.Text = kullanici.Il;
         
        }
    }
}