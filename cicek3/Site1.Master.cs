using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace cicek3
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Kullanici"]) == "") {Response.Redirect("Giris.aspx");Response.End();}
                         
            UserTbl kullanici = new UserTbl();
            kullanici = (UserTbl)Session["Kullanici"];
            Lbl_Kullanici.Text = kullanici.KullaniciAdi;  
            Repeater_BgnUyarilar = UyariIslemleri.UyariEtkilesim(Repeater_BgnUyarilar, kullanici.user_Id);

        }

        protected void btn_Cikis_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Giris.aspx");
        }
    }
}