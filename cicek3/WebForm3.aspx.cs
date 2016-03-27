using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cicek3
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        UserTbl kullanici = new UserTbl();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Kullanici"]) == "") { Response.Redirect("Giris.aspx"); Response.End(); }

            
            kullanici = (UserTbl)Session["Kullanici"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            //MessageBox.Show("Deneme metni", MessageBox.MesajTipleri.Success, true, 10000);
            MessageBox.Show("Deneme metni", MessageBox.MesajTipleri.Info,"0", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //string baslangic = kullanici.UyelikBaslangicTarihi.ToString();
            //DateTime bitis = kullanici.UyelikBitisTarihi;
            //DateTime suan = DateTime.Now;
            ////string now = "2018-06-06 00:00:00.000";
            ////suan = DateTime.Parse(now);
            //TimeSpan zaman = bitis - suan;
            //if (bitis<=suan)
            //{
            //    Label6.Text = "kullanım süreniz bitmiştir.Sistem yöneticimizle temasa geçiniz.";
            //}
            //else
            //{
            //    Label6.Text = "kullanım süreniz devam etmektedir Kalan gün sayısı=" + zaman.Days.ToString();
            //}
        }
        
    }
}