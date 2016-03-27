using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cicek3
{
    public struct UserTbl
    {
        public int user_Id { get; set; }
        public string KullaniciAdi { get; set; }
        public string Sifre { get; set; }
        public string Ad { get; set; }
        public string Soyad { get; set; }
        public string TcNo { get; set; }
        public string VergiNo { get; set; }
        public string Telefon { get; set; }
        public string Mail { get; set; }
        public String Il { get; set; }
        public string Adres { get; set; }
        public int FirmaTur_Id { get; set; }
        public string Resim { get; set; }
        public DateTime UyelikBaslangicTarihi { get; set; }
        public DateTime UyelikBitisTarihi { get; set; }
    }
    public struct UFirmaTurTbl
    {
        public int FirmaTur_Id { get; set; }
        public string TurAdi { get; set; }
    }
}