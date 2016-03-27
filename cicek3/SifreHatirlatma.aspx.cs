using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MiniCore;
namespace cicek3
{
    public partial class SifreSifirlama : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        DataClassesDataContext dcdc = new DataClassesDataContext();
        protected void btn_sifreGonder(object sender, EventArgs e)
        {
            int KullaniciId = dcdc.fnc_UserMailKontrol(txt_Mail.Text).ToInt();
            if (KullaniciId > 0)
            {

                UserTbl kullanici = new UserTbl();
                uUser user = new uUser();
                kullanici = user.Kullanici_Listele(KullaniciId);
                String MailMesajIcerigi =string.Format( "E-mail = {0} \n Kullanıcı Adı: {1} \n Şifre: {2} \n",kullanici.Mail,kullanici.KullaniciAdi,kullanici.Sifre);
                cUIAraclari.MailGonder(MailMesajIcerigi,"Cicekmicicek Şifre Sıfırlama", txt_Mail.Text);
                MessageBox.Show("Şifreniz gönderildi", MessageBox.MesajTipleri.Success, "0", true);
            }
            else
            {
                MessageBox.Show("Mail adresi yanlış veya sistemde kayıtlı değil", MessageBox.MesajTipleri.Info, "1", true);
            }
        }
    }
}