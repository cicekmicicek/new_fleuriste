using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using MiniCore;
namespace cicek3
{
    public class uUser : IDisposable
    {
        UserTbl kullanici;
        static DataClassesDataContext dcdc = new DataClassesDataContext();
        int new_KullaniciId;
        public UserTbl Kullanici_Listele(int user_Id)
        {
            var userdoldur = dcdc.usp_UserGetir(user_Id);
            foreach (var item in userdoldur)
            {
                kullanici = new UserTbl();
                kullanici.user_Id = item.User_Id;
                kullanici.KullaniciAdi = item.KullaniciAdi;
                kullanici.Sifre = item.Sifre;
                kullanici.Ad = item.Ad;
                kullanici.Soyad = item.Soyad;
                kullanici.TcNo = item.TcNo;
                kullanici.VergiNo = item.VergiNo;
                kullanici.Telefon = item.Telefon;
                kullanici.Mail = item.Mail;
                kullanici.Il = item.Il;
                kullanici.Adres = item.Adres;
                kullanici.Resim = item.Resim;
                kullanici.FirmaTur_Id = item.FirmaTur_Id.ToInt();
                kullanici.UyelikBitisTarihi = Convert.ToDateTime(item.UyelikBitisTarihi);
                kullanici.UyelikBaslangicTarihi = Convert.ToDateTime(item.UyelikBaslangicTarihi);
            }
            return kullanici;
        }
        private void UserResimIslemleri(FileUpload yuklenecekUserResmi)
        {
            if (yuklenecekUserResmi.HasFile)
            {
                string dosyauzantisi = Path.GetExtension(yuklenecekUserResmi.PostedFile.FileName);
                string resim = "user_" + kullanici.KullaniciAdi + dosyauzantisi;
                if (dosyauzantisi == ".jpg" || dosyauzantisi == ".png" || dosyauzantisi == ".jpeg" || dosyauzantisi == ".bmp")
                    yuklenecekUserResmi.SaveAs(HttpContext.Current.Server.MapPath("../Images/Users/" + kullanici.KullaniciAdi + "/" + resim));
                kullanici.Resim = resim;
            }
        }
        private void UserKlasörIslemleri()
        {
            if (!Directory.Exists(HttpContext.Current.Server.MapPath("../Images/Users/" + kullanici.KullaniciAdi + "")))
            {
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../Images/Users/" + kullanici.KullaniciAdi + ""));
                Directory.CreateDirectory(HttpContext.Current.Server.MapPath("../Images/Users/" + kullanici.KullaniciAdi + "/UrunResimleri"));
            }
        }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public void userOlustur(UserTbl user, FileUpload yuklenecekUserResmi)
        {
            try
            {
                kullanici.KullaniciAdi = user.KullaniciAdi;
                kullanici.Sifre = user.Sifre;
                kullanici.Ad = user.Ad;
                kullanici.Soyad = user.Soyad;
                kullanici.TcNo = user.TcNo;
                kullanici.VergiNo = user.VergiNo;
                kullanici.Telefon = user.Telefon;
                kullanici.Mail = user.Mail;
                kullanici.Il = user.Il;
                kullanici.Adres = user.Adres;
                kullanici.FirmaTur_Id = user.FirmaTur_Id;
                kullanici.UyelikBitisTarihi = user.UyelikBitisTarihi;
                kullanici.UyelikBaslangicTarihi = DateTime.Now;

                UserKlasörIslemleri();
                UserResimIslemleri(yuklenecekUserResmi);
                UserVtEkle();

            }
            catch (Exception)
            {

                throw;
            }

        }
        private void UserVtEkle()
        {
            try
            {
                dcdc.usp_UserEkle(kullanici.KullaniciAdi, kullanici.Sifre, kullanici.Ad, kullanici.Soyad, kullanici.TcNo, kullanici.VergiNo, kullanici.Telefon, kullanici.Mail, kullanici.Il, kullanici.Adres, kullanici.FirmaTur_Id, kullanici.Resim, kullanici.UyelikBaslangicTarihi, kullanici.UyelikBitisTarihi);

            }
            catch (Exception)
            {

                throw;
            }
        }
        public void userGuncelle(UserTbl user, int user_Id, string oncekiResim, FileUpload yuklenecekUserResmi)
        {
            try
            {
                kullanici.user_Id = user_Id;
                kullanici.KullaniciAdi = user.KullaniciAdi;
                if (yuklenecekUserResmi.HasFile)
                    UserResimIslemleri(yuklenecekUserResmi);
                else
                    kullanici.Resim = oncekiResim;
                dcdc.usp_UserGuncelle(user_Id, user.KullaniciAdi, user.Sifre, user.Ad, user.Soyad, user.TcNo, user.VergiNo, user.Telefon, user.Mail, user.Il, user.Adres, user.FirmaTur_Id, kullanici.Resim, user.UyelikBitisTarihi);
            }
            catch (Exception)
            {

                throw;
            }

        }

        public void userSil(UserTbl user)
        {
            dcdc.usp_UserSil(user.user_Id);
        }
        public static Repeater Table_UserListele(Repeater userTbl_Rpt)
        {
            userTbl_Rpt.DataSource = dcdc.usp_UserGetirTumu();
            userTbl_Rpt.DataBind();
            return userTbl_Rpt;
        }
    }
    public class uUserFirmaTur : IDisposable
    {
        UFirmaTurTbl firmaTur;
        static DataClassesDataContext dcdc = new DataClassesDataContext();
        public void firmaTurOlustur(UFirmaTurTbl firmaTur)
        {
            this.firmaTur.TurAdi = firmaTur.TurAdi;
            FirmaTurVtEkle();
        }
        private void FirmaTurVtEkle()
        {
            dcdc.usp_FirmaTurEkle(firmaTur.TurAdi);
        }
        public static DropDownList Drpdwn_FirmaTurDoldur(DropDownList drp_FirmaTurleri)
        {
            drp_FirmaTurleri.DataSource = dcdc.usp_FirmaTurAdlariGetir();
            drp_FirmaTurleri.DataValueField = "FirmaTur_Id";
            drp_FirmaTurleri.DataTextField = "TurAdi";
            drp_FirmaTurleri.DataBind();
            return drp_FirmaTurleri;
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}