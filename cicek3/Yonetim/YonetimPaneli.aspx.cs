using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using MiniCore;
namespace cicek3.Yonetim
{
    public partial class YonetimPaneli : System.Web.UI.Page
    {
        // DataClassesDataContext dcdc = new DataClassesDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    Repeater_UserTbl = uUser.Table_UserListele(Repeater_UserTbl);
                    DropDown_FirmaTurleri = uUserFirmaTur.Drpdwn_FirmaTurDoldur(DropDown_FirmaTurleri);
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Hata", MessageBox.MesajTipleri.Error, "0", true);
                    cUIAraclari.cLog.Write(ex, 1000);
                }
            }

        }
        protected void btn_UserEkle_Click(object sender, EventArgs e)
        {
            try
            {

                if (txt_KullaniciAdi.Text == "" || txt_Sifre.Text == "" || txt_Ad.Text == "" || txt_Soyad.Text == "" || txt_TcNo.Text == "" || txt_VergiNo.Text == "" || txt_Telefon.Text == "" || txt_Mail.Text == "" || txt_Il.Text == "" || txt_Adres.Text == "" || txt_UbitisTarihi.Text == "")
                {
                    MessageBox.Show("Boş Alan Bırakmadığınıza eminmisiniz?", MessageBox.MesajTipleri.Warning, "0", true);
                }
                else
                {
                    int firmaturId = int.Parse(DropDown_FirmaTurleri.SelectedItem.Value);
                    DateTime uyelikBitisTarihi = DateTime.Parse(txt_UbitisTarihi.Text);
                    UserTbl usertbl;
                    using (uUser user = new uUser())
                    {
                        usertbl = new UserTbl();
                        usertbl.KullaniciAdi = txt_KullaniciAdi.Text;
                        usertbl.Sifre = txt_Sifre.Text;
                        usertbl.Ad = txt_Ad.Text;
                        usertbl.Soyad = txt_Soyad.Text;
                        usertbl.TcNo = txt_TcNo.Text;
                        usertbl.VergiNo = txt_VergiNo.Text;
                        usertbl.Telefon = txt_Telefon.Text;
                        usertbl.Mail = txt_Mail.Text;
                        usertbl.Il = txt_Il.Text;
                        usertbl.Adres = txt_Adres.Text;
                        usertbl.FirmaTur_Id = firmaturId;
                        usertbl.UyelikBitisTarihi = uyelikBitisTarihi;
                        user.userOlustur(usertbl, FileUploadResim);
                    }
                    Response.Redirect("YonetimPaneli.aspx");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Hata", MessageBox.MesajTipleri.Error, "0", true);
                cUIAraclari.cLog.Write(ex, 1000);
            }
        }
        protected void btn_FirmaTurEkle_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_FirmaTurAdi.Text == "")
                {
                    MessageBox.Show("Lütfen bir Tür adı giriniz", MessageBox.MesajTipleri.Warning, "0", true);
                }
                else
                {
                    UFirmaTurTbl firmaTuru;
                    using (uUserFirmaTur firmaTur = new uUserFirmaTur())
                    {
                        firmaTuru = new UFirmaTurTbl();
                        firmaTuru.TurAdi = txt_FirmaTurAdi.Text;
                        firmaTur.firmaTurOlustur(firmaTuru);
                    }
                    DropDown_FirmaTurleri = uUserFirmaTur.Drpdwn_FirmaTurDoldur(DropDown_FirmaTurleri);
                }
            }
            catch (Exception ex)
            {
                cUIAraclari.cLog.Write(ex, 1000);
            }
        }
        protected void btn_UserSil_Click(object sender, EventArgs e)
        {
            try
            {
                if (txt_KullaniciSil.Text == "")
                {
                    MessageBox.Show("Silmek istediğiniz kullanıcının Id'sini giriniz", MessageBox.MesajTipleri.Warning, "0", true);
                }
                else
                {
                    UserTbl usertbl;
                    using (uUser user = new uUser())
                    {
                        usertbl = new UserTbl();
                        usertbl.user_Id = int.Parse(txt_KullaniciSil.Text);
                        user.userSil(usertbl);
                    }
                    Repeater_UserTbl = uUser.Table_UserListele(Repeater_UserTbl);
                }
            }
            catch (Exception ex)
            {

                cUIAraclari.cLog.Write(ex, 1000);
            }
        }
        protected void btn_UserGuncelle_Click(object sender, EventArgs e)
        {
            if (txtGuncelle_KullaniciAdi.Text == "" || txtGuncelle_Sifre.Text == "" || txtGuncelle_Ad.Text == "" || txtGuncelle_Soyad.Text == "" || txtGuncelle_TcNo.Text == "" || txtGuncelle_Vergi.Text == "" || txtGuncelle_Tel.Text == "" || txtGuncelle_Mail.Text == "" || txtGuncelle_Il.Text == "" || txtGuncelle_Adres.Text == "" || txtGuncelle_UBitisTarihi.Text == "")
            {
                MessageBox.Show("Boş Alan Bırakmadığınıza eminmisiniz?", MessageBox.MesajTipleri.Warning, "0", true);
            }
            else
            {
                int firmaturId = int.Parse(DropDownGuncelle_FirmaTurleri.SelectedItem.Value);
                int kullaniciId = int.Parse(txtGuncelle_KullaniciId.Text);
                string oncekiResim = TextBox1.Text;
                DateTime uyelikBitisTarihi = DateTime.Parse(txtGuncelle_UBitisTarihi.Text);
                UserTbl usertbl;
                using (uUser user = new uUser())
                {
                    usertbl = new UserTbl();
                    usertbl.KullaniciAdi = txtGuncelle_KullaniciAdi.Text;
                    usertbl.Sifre = txtGuncelle_Sifre.Text;
                    usertbl.Ad = txtGuncelle_Ad.Text;
                    usertbl.Soyad = txtGuncelle_Soyad.Text;
                    usertbl.TcNo = txtGuncelle_TcNo.Text;
                    usertbl.VergiNo = txtGuncelle_Vergi.Text;
                    usertbl.Telefon = txtGuncelle_Tel.Text;
                    usertbl.Mail = txtGuncelle_Mail.Text;
                    usertbl.Il = txtGuncelle_Il.Text;
                    usertbl.Adres = txtGuncelle_Adres.Text;
                    usertbl.FirmaTur_Id = firmaturId;
                    usertbl.UyelikBitisTarihi = uyelikBitisTarihi;
                    usertbl.Resim = TextBox1.Text;
                    user.userGuncelle(usertbl, kullaniciId, oncekiResim, FileUploadGuncelleResim);
                }
                Response.Redirect("YonetimPaneli.aspx");
            }
        }

        protected void btn_UserBul_Click(object sender, EventArgs e)
        {
            if (txtGuncelle_KullaniciId.Text == "")
            {
                MessageBox.Show("Güncellememk istediğiniz kullanıcının Id'sini giriniz", MessageBox.MesajTipleri.Warning, "0", true);
            }
            else
            {
                DropDownGuncelle_FirmaTurleri = uUserFirmaTur.Drpdwn_FirmaTurDoldur(DropDownGuncelle_FirmaTurleri);
                int kullaniciId = int.Parse(txtGuncelle_KullaniciId.Text);
                UserTbl kullanici;
                using (uUser user = new uUser())
                {
                    kullanici = user.Kullanici_Listele(kullaniciId);
                    txtGuncelle_KullaniciAdi.Text = kullanici.KullaniciAdi;
                    txtGuncelle_Sifre.Text = kullanici.Sifre;
                    txtGuncelle_Ad.Text = kullanici.Ad;
                    txtGuncelle_Soyad.Text = kullanici.Soyad;
                    txtGuncelle_TcNo.Text = kullanici.TcNo;
                    txtGuncelle_Vergi.Text = kullanici.VergiNo;
                    txtGuncelle_Tel.Text = kullanici.Telefon;
                    txtGuncelle_Mail.Text = kullanici.Mail;
                    txtGuncelle_Il.Text = kullanici.Il;
                    txtGuncelle_Adres.Text = kullanici.Adres;
                    txtGuncelle_UBitisTarihi.Text = kullanici.UyelikBitisTarihi.ToString();
                    //resim = kullanici.Resim;
                    TextBox1.Text = kullanici.Resim;

                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Repeater_UserTbl = uUser.Table_UserListele(Repeater_UserTbl);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label3.Text = DropDown_FirmaTurleri.SelectedItem.Value;
        }

    }
}