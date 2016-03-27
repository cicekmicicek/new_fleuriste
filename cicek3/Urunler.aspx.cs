using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using MiniCore;
using System.Drawing;

namespace cicek3
{

    public partial class Urunler : System.Web.UI.Page
    {
        DataClassesDataContext dcdc = new DataClassesDataContext();
        UserTbl kullanici = new UserTbl();          
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToString(Session["Kullanici"]) == "") { Response.Redirect("Giris.aspx"); Response.End(); }
            kullanici = (UserTbl)Session["Kullanici"];
            // gridvieww veri çekmee

            if (!IsPostBack)
            {
                drop_kategoriler.DataSource = dcdc.usp_KategorileriGetir(kullanici.user_Id);
                drop_kategoriler.DataValueField = "Kategori_Id";
                drop_kategoriler.DataTextField = "Ad";
                drop_kategoriler.DataBind();

                Repeater_UrunTbl.DataSource = dcdc.usp_UrunleriGetir(kullanici.user_Id);
                Repeater_UrunTbl.DataBind();
            }
           

        }

        protected void btn_urunEkle_Click(object sender, EventArgs e)
        {
            // urunler classını kullanarak urunler tabloma ulaşıyorum, ordan parametreleri alıyorrum
            // onun içinde dataclasses e urunler tablosunu ekliyorum ki onlara ulaşabileyim
            Urunler kayit = new Urunler();
            {
              
                kayit._Ad = txt_urunAdi.Text;
                kayit._Fiyat = Convert.ToInt32(txt_urunFiyat.Text);
                kayit._Eklenme_Tarihi = Convert.ToDateTime(txt_eklenenTarih.Text);
                kayit._OzelNot = txt_ozelnot.Text;
                kayit._Kategori_Id= int.Parse(drop_kategoriler.SelectedItem.Value);
                    
                kayit._User_Id = kullanici.user_Id;


            }
            dcdc.Urunlers.InsertOnSubmit(kayit);
            dcdc.SubmitChanges();
        }

        protected void btn_urunGuncelle_Click(object sender, EventArgs e)
        {
            
        }

        protected void btn_UrunSil_Click(object sender, EventArgs e)
        {
        }

        protected void btn_KategoriEkle_Click(object sender, EventArgs e)
        {
            Kategori kayit = new Kategori();
            {
                kayit.Ad = txt_kategoriAd.Text;
                kayit.User_Id = kullanici.user_Id;
            }
            dcdc.Kategoris.InsertOnSubmit(kayit);
            dcdc.SubmitChanges();
        }

        //public struct UKategoriTbl
        //{
        //    public int Kategori_Id { get; set; }
        //    public string KategoriAdi { get; set; }
        //}

    
    }
   
}