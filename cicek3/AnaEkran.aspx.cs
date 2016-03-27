using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiniCore;
namespace cicek3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Kullanici"]) == "") { Response.Redirect("Giris.aspx"); Response.End(); }
            LblDuyuru.Text = "Flueriste Çiçekçilik Yönetim Sistemine Hoş Geldiniz";
            DataClassesDataContext dcdl = new DataClassesDataContext();
            RptEtkilesim.DataSource = dcdl.usp_EtkilesimListele();
            RptEtkilesim.DataBind();
 
            LblTeslimEdilenSiparis.Text = Convert.ToString(IstatistikGetir(dcdl,"Teslim Edilen Siparis"));
            LblTamamlanmamisSiparis.Text = Convert.ToString(IstatistikGetir(dcdl, "Tamamlanmamis"));
            LblHazirlananSiparis.Text = Convert.ToString(IstatistikGetir(dcdl, "Hazırlanmis"));
            
        }
        private static int IstatistikGetir(DataClassesDataContext dcdl, string ss)
        {
            int sayi=0;
            var SiparisSayisi = dcdl.usp_SiparisIstatistik(ss);
            foreach (var item in SiparisSayisi)
            {
                sayi = item.sayisi.ToInt();
            }
            return sayi;
        }
        
        //git denemesi
        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        //protected void btn1_ServerClick(object sender, EventArgs e)
        //{
        //    Label1.Text = "mert";
        //}

        //protected void Button1_Click1(object sender, EventArgs e)
        //{
        //    Label1.Text = "mertmialtun";
        //}

    }
}