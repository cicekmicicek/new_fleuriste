using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiniCore;
namespace cicek3
{
    public partial class Giris : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Chck_Hatirla.Checked = true;

            HttpCookie cookie = Request.Cookies["Fleuriste_User"];
            if (cookie != null)
            {
                txt_KullaniciAdi.Text=cookie["kullaniciAdi"];
                //txt_Sifre.Text=cookie["sifre"];
                txt_Sifre.Attributes.Add("value", Convert.ToString(cookie["sifre"]));//textmode password olunca böyle
            }
        }
        DataClassesDataContext dcdc = new DataClassesDataContext();
        protected void btn_giris(object sender, EventArgs e)
        {
            int KullaniciId =dcdc.fnc_UserLogin(txt_KullaniciAdi.Text, txt_Sifre.Text).ToInt();
            if (KullaniciId>0)
            {
                UserTbl kullanici=new UserTbl();
                uUser user = new uUser();
                kullanici = user.Kullanici_Listele(KullaniciId);
                if (Chck_Hatirla.Checked == true && Request.Cookies["Fleuriste_User"] == null)
                {
                    HttpCookie userCookie = new HttpCookie("Fleuriste_User");
                    userCookie["kullaniciAdi"] = kullanici.KullaniciAdi;
                    userCookie["sifre"] = kullanici.Sifre;
                    userCookie.Expires = DateTime.Now.AddDays(363);
                    Response.Cookies.Add(userCookie); 
                }
                Session["Kullanici"] = kullanici;
                Response.Redirect("AnaEkran.aspx");
            }
            else
            {
                MessageBox.Show("Kullanıcı Adı veya Şifre Yanlış", MessageBox.MesajTipleri.Error, "2", true);
            }

            //string baslangic = kullanici.UyelikBaslangicTarihi.ToString();
            //DateTime bitis = kullanici.UyelikBitisTarihi;
            //DateTime suan = DateTime.Now;
            ////string now = "2018-06-06 00:00:00.000";
            ////suan = DateTime.Parse(now);
            //TimeSpan zaman = bitis - suan;
            //if (bitis <= suan)
            //{
            //    MessageBox.Show("kullanım süreniz bitmiştir.Sistem yöneticimizle temasa geçiniz.", MessageBox.MesajTipleri.Warning, "0", true);
            //}
            //else
            //{
            //    //MessageBox.Show("kullanım süreniz devam etmektedir Kalan gün sayısı=" + zaman.Days.ToString(), MessageBox.MesajTipleri.Warning, "0", true);
            //}
        }
        
    }
}