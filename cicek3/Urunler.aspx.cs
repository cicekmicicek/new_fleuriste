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
            if (txt_urunAdi.Text == "" || txt_urunFiyat.Text == "" || txt_eklenenTarih.Text == "")
            {
                MessageBox.Show("Lütfen Tüm alanları Doldurunuz !!", MessageBox.MesajTipleri.Warning, "0", true);
            }
            else
            {


                try
                {
                    Urunler kayit = new Urunler();
                    {

                        kayit._Ad = txt_urunAdi.Text;
                        kayit._Fiyat = Convert.ToInt32(txt_urunFiyat.Text);
                        kayit._Eklenme_Tarihi = Convert.ToDateTime(txt_eklenenTarih.Text);
                        kayit._OzelNot = txt_ozelnot.Text;
                        kayit._Kategori_Id = int.Parse(drop_kategoriler.SelectedItem.Value);

                        kayit._User_Id = kullanici.user_Id;


                    }
                    dcdc.Urunlers.InsertOnSubmit(kayit);
                    dcdc.SubmitChanges();


                    MessageBox.Show("Yeni Ürün Eklendi", MessageBox.MesajTipleri.Success, "0", true);


                }
                catch (Exception)
                {
                    MessageBox.Show("Hata", MessageBox.MesajTipleri.Error, "0", true);
                }

            }
        }

        protected void btn_KategoriEkle_Click1(object sender, EventArgs e)
        {

            try
            {
                Kategori kayit = new Kategori();
                {
                    kayit.Ad = txt_kategoriAd.Text;
                    kayit.User_Id = kullanici.user_Id;
                }
                dcdc.Kategoris.InsertOnSubmit(kayit);
                dcdc.SubmitChanges();

                MessageBox.Show("Yeni Kategori Eklendi", MessageBox.MesajTipleri.Success, "0", true);


            }
            catch (Exception)
            {
                MessageBox.Show("Hata", MessageBox.MesajTipleri.Error, "0", true);
            }

        }

        protected void Repeater_UrunTbl_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

            Urunler urun = new Urunler();
            if (e.CommandName == "delete") // commandName si delete olan button tıklanmışsa bu işlemi yap
            {
                urun._Urun_Id = Convert.ToInt32(e.CommandArgument); // commandArgument te verilen isme göre işlem yap, yanı(Urun_Id)

                dcdc.usp_UrunSil(urun._Urun_Id, kullanici.user_Id);

                MessageBox.Show("silme İşlemi Gerçekleştirilmiştir", MessageBox.MesajTipleri.Success, "0", true);
               
            }

            //if (e.CommandName == "duzenle")
            //{
            //    urun._Urun_Id = Convert.ToInt32(e.CommandArgument);
            //    drpGuncelle_kategoriler.DataSource = dcdc.usp_KategorileriGetir(kullanici.user_Id);
            //    drpGuncelle_kategoriler.DataValueField = "Kategori_Id";
            //    drpGuncelle_kategoriler.DataTextField = "Ad";
            //    drpGuncelle_kategoriler.DataBind();

            //    dcdc.usp_UrunleriGetir(kullanici.user_Id);
            //    //txtGuncelle_urunAdi.Text =
            //    txtGuncelle_fiyat.Text = urun.Fiyat.ToString();
            //    txtGuncelle_ozelnot.Text = urun.OzelNot;
            //    txtGuncelle_tarih.Text = urun.Eklenme_Tarihi.ToString();

            //}
        }

        protected void btn_urunGuncelle_Click(object sender, EventArgs e)
        {
            Urunler urun = new Urunler();

            drpGuncelle_kategoriler.DataSource = dcdc.usp_KategorileriGetir(kullanici.user_Id);
            drpGuncelle_kategoriler.DataValueField = "Kategori_Id";
            drpGuncelle_kategoriler.DataTextField = "Ad";
            drpGuncelle_kategoriler.DataBind();
            var urunler = dcdc.usp_UrunGuncelle(urun.Ad, urun.Fiyat, urun.Eklenme_Tarihi, urun.OzelNot, urun.Kategori_Id, kullanici.user_Id, urun._Urun_Id);
            urun.Ad = txtGuncelle_urunAdi.Text;
            urun.Fiyat = Convert.ToDecimal(txtGuncelle_fiyat.Text);
            urun.OzelNot = txtGuncelle_ozelnot.Text;
            urun.Eklenme_Tarihi = Convert.ToDateTime(txtGuncelle_tarih.Text);
            urun.Kategori_Id = int.Parse(drpGuncelle_kategoriler.SelectedItem.Value);
           
        }

        protected void btn_UrunBul_ServerClick(object sender, EventArgs e)
        {
            Urunler urun = new Urunler();
            if (txtGuncelle_UrunId.Text == "")
            {
                MessageBox.Show("Lütfen Bir İd Numarası Giriniz", MessageBox.MesajTipleri.Success, "1", true);
                
            }
            else
            {
                int urunid = int.Parse(txtGuncelle_UrunId.Text);
                var urundoldur = dcdc.usp_UrunleriBulGetir(kullanici.user_Id, urunid);

                foreach (var item in urundoldur)
                {

                    drpGuncelle_kategoriler.DataSource = dcdc.usp_KategorileriGetir(kullanici.user_Id);
                    drpGuncelle_kategoriler.DataValueField = "Kategori_Id";
                    drpGuncelle_kategoriler.DataTextField = "Ad";
                    drpGuncelle_kategoriler.DataBind();


                    txtGuncelle_urunAdi.Text = item.Ad;
                    txtGuncelle_fiyat.Text = item.Fiyat.ToString();
                    txtGuncelle_ozelnot.Text = item.OzelNot;
                    txtGuncelle_tarih.Text = item.Eklenme_Tarihi.ToString();
                    drpGuncelle_kategoriler.DataValueField = item.Kategori_Id.ToString();
                    drpGuncelle_kategoriler.DataTextField = item.kad;

                }
            }



        }

    }

}