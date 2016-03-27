using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MiniCore;
using System.Web.UI.WebControls;
namespace cicek3
{
    public class UyariIslemleri
    {
       static DataClassesDataContext dcdc = new DataClassesDataContext();

        public static string[,] UyariDoldur(int kullaniciId)
        {
           string [,] etkinlik = new string[13, 32];

            var uyari = dcdc.usp_UyariListele(kullaniciId);
            foreach (var item in uyari)
            {
                DateTime dtnow = item.Tarih.ToDateTime();
                int ay = dtnow.Month;
                int gun = dtnow.Day;
                etkinlik[ay, gun] = item.Tur + "</br>" + item.adSoyad;
            }
            return etkinlik;
        }
        public static Repeater UyariEtkilesim(Repeater uyariEtkilesim,int kullaniciId)
        {
            uyariEtkilesim.DataSource = dcdc.usp_UyariEtkilesim(kullaniciId);
            uyariEtkilesim.DataBind();
            return uyariEtkilesim;
        }
    }
}