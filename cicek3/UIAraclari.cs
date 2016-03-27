using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MiniCore;
using System.Xml;
using System.Data;
using System.Net.Mail;
using System.IO;
using System.Net;
using System.Text;
namespace cicek3
{
    public enum eStatusType : short
    {
        Onay = 1,
        Bilgi = 2,
        Uyari = 3,
        Hata = 4
    }

    public class cUIAraclari
    {
        public static int _iKullaniciID
        {
            get
            {
                if (HttpContext.Current.Session["USERID"] == null)
                {
                    return 0;
                }
                else
                    return HttpContext.Current.Session["USERID"].ToInt(0);
            }
            set
            {
                HttpContext.Current.Session["USERID"] = value;
            }
        }
        public static eKullaniciTipi _iKullaniciTipi
        {
            get
            {
                if (HttpContext.Current.Session["KULLANICITIPI"] == null)
                {
                    return eKullaniciTipi.Misafir;
                }
                //9 olmasının sebebi misafir kullanıcı atıyoruz
                else
                    return (eKullaniciTipi)HttpContext.Current.Session["KULLANICITIPI"].ToShort(9);
            }
            set
            {
                HttpContext.Current.Session["KULLANICITIPI"] = value;
            }
        }
        public static cLogging cLog;
        public static void MailGonder(string bodyMesaj, string konu, string aliciMail)
        {
            try
            {
                MailMessage mesaj = new MailMessage();
                mesaj.From = new MailAddress("bilgilendirme@cicekmicicek.com");
                mesaj.To.Add(new MailAddress(aliciMail));
                
                mesaj.Subject = konu;
                mesaj.IsBodyHtml = true;
                mesaj.BodyEncoding = Encoding.GetEncoding(1254);
                mesaj.Body = bodyMesaj + "<br /><hr /><h2>Bu mail size cicekmicicek.com sisteminden gönderilmiştir!</h2>";
                SmtpClient client = new SmtpClient();
                client.Host = "smtp.yandex.ru";
                client.Port = 587;
                client.Credentials = new NetworkCredential("bilgilendirme@cicekmicicek.com", "bilgi74123");
                client.EnableSsl = true;
                client.Send(mesaj);
            }
            catch (Exception ex)
            {
                cLog.Write(ex, -1);
                MessageBox.Show("Hata" + ex, MessageBox.MesajTipleri.Error, "0", true);
            }

        }
    }


}