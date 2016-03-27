<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="cicek3.Urunler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    Ürünler
    <small>Ürünleri Görüntüleyin</small>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <i class="glyphicon glyphicon-list"></i>
    Ürünler
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $("#div1").hide(), $("#div2").hide(), $("#div3").hide(), $("#div4").hide(), $("#divUrunGuncelle").hide(), $("#div5").hide()
            $("#UrunEkle").click(function () { $("#div1").show("slow"), $("#div2").hide("slow"), $("#div3").hide("slow"), $("#div4").hide("slow"), $("#div5").hide("slow") });

            $("#UrunSil").click(function () { $("#div2").show("slow"), $("#div1").hide("slow"), $("#div3").hide("slow"), $("#div4").hide("slow"), $("#div5").hide("slow") });

            $("#UrunDuzenle").click(function () { $("#div3").show("slow"), $("#div1").hide("slow"), $("#div2").hide("slow"), $("#div4").hide("slow"), $("#div5").hide("slow") });

            $("#btn_UrunBul").click(function () { $("#divUrunGuncelle").show() });
            $("#KategoriEkle").click(function () { $("#div5").show("slow"), $("#div1").hide("slow"), $("#div2").hide("slow"), $("#div3").hide("slow"), $("#div4").hide("slow") });

            //$("#").click(function () { $("#div4").show("slow"), $("#div1").hide("slow"), $("#div2").hide("slow"), $("#div3").hide("slow") });
        });
    </script>

    <%-- deneme --%>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col col-lg-12">
            <a class="btn btn-success outline" href="#" id="UrunEkle">Ürün Ekle</a>
            <a class="btn btn-success outline" href="#" id="UrunSil">Ürün Sil</a>
            <a class="btn btn-success outline" href="#" id="UrunDuzenle">Ürün Düzenle</a>
            <a class="btn btn-success outline" href="#" id="KategoriEkle">Kategori Ekle</a>

            <div id="div1">
                <div class="row">
                    <div class="col col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Ürün Ekle
                            </div>
                            <div class="panel-body">

                                <table class="table table-hover table-bordered results pre-scrollable">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Ürün Adı</th>
                                            <th>Ürün Fiyatı</th>
                                            <th>Eklenme Tarihi</th>
                                            <th>Eklenen Ürün hakkında Kısa Bİlgi</th>
                                            <th>Kategoriler</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th></th>
                                            <th>
                                                <asp:TextBox ID="txt_urunAdi" runat="server" Width="110px" CssClass="form-control"></asp:TextBox></th>
                                            <th>
                                                <asp:TextBox ID="txt_urunFiyat" runat="server" Width="110px"  CssClass="form-control"></asp:TextBox></th>
                                            <th>
                                                <asp:TextBox ID="txt_eklenenTarih" TextMode="MultiLine" runat="server" Width="110px"  CssClass="form-control"></asp:TextBox></th>

                                            <th>
                                                <asp:TextBox ID="txt_ozelnot" TextMode="MultiLine" runat="server" Width="180px" Height="80px" CssClass="form-control"></asp:TextBox></th>
                                            <th>
                                                <asp:UpdatePanel ID="UpdatePanel20" runat="server">
                                                    <ContentTemplate>

                                                        <asp:DropDownList ID="drop_kategoriler" CssClass="form-control" runat="server"></asp:DropDownList>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </th>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="col-lg-12 text-center">
                                    <asp:Button ID="btn_urunEkle" CssClass="btn btn-primary raised" runat="server" Text="Kaydet" OnClick="btn_urunEkle_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="div2">
                <div class="row">
                    <div class="col col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Ürün Sil
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-3">
                                        <label>Ürün Id:</label>
                                        <asp:TextBox ID="txt_urunSil" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:Button ID="btn_UrunSil" CssClass="btn btn-danger raised" runat="server" Text="Sil" OnClick="btn_UrunSil_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="div3">
                <div class="row">
                    <div class="col col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Ürün Düzenle
                            </div>
                            <div class="panel-body">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <label>Güncellenecek Ürünün Id'si:</label>
                                                <div class="form-group input-group">
                                                    <asp:TextBox ID="txtGuncelle_urunId" runat="server" CssClass="form-control"></asp:TextBox>

                                                    <span class="input-group-btn">
                                                        <a class="btn btn-default" id="btn_UrunBul" runat="server" href="#"><i class="fa fa-search"></i></a>
                                                    </span>
                                                </div>
                                                <div id="divUrunGuncelle" class="col-lg-12">
                                                    <table class="table table-hover table-bordered results pre-scrollable">
                                                        <thead>
                                                            <tr>
                                                                <th>#</th>
                                                                <th>Ürün Adı</th>
                                                                <th>Ürün Fiyatı</th>
                                                                <th>Eklenen Tarih</th>
                                                                <th>Ürün Hakkında Kısa Bilgi</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <th></th>
                                                                <th>
                                                                    <asp:TextBox ID="txtGuncelle_urunAdi" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                <th>
                                                                    <asp:TextBox ID="txtGuncelle_fiyat" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                <th>
                                                                    <asp:TextBox ID="txtGuncelle_tarih" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                <th>
                                                                    <asp:TextBox ID="txtGuncelle_ozelnot" TextMode="MultiLine" runat="server" Width="180px" CssClass="form-control"></asp:TextBox></th>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <asp:Button ID="btn_urunGuncelle" CssClass="btn btn-danger raised" runat="server" Text="Güncelle" OnClick="btn_urunGuncelle_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
       

        
<div id="div5">
  <div class="row">
    <div class="col col-lg-12">
      <div class="panel panel-default">
        <div class="panel-heading">
            Yeni Kategori Ekle
        </div>
         <div class="panel-body">
           <div class="row">
            <div class="col-lg-3">
           <label>Kategori Adı:</label>
         <asp:TextBox ID="txt_kategoriAd" runat="server" CssClass="form-control"></asp:TextBox>
        <%-- <asp:Button ID="btn_FirmaTurEkle" CssClass="btn btn-primary raised" runat="server" Text="Kaydet" />--%>
                <asp:Button ID="btn_KategoriEkle" CssClass="btn btn-primary raised" runat="server" Text="Kaydet" OnClick="btn_KategoriEkle_Click" />
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
</div>
   </div>
    <%-- deneme son --%>

    <div>
        <div class="row">
            <div class="col col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body pre-scrollable">
                        <div class="row">
                            <div class="form-group pull-right">
                                <input type="text" class="search form-control" placeholder="Bulmak istediğiniz Ürün?" />
                            </div>
                            <span class="counter pull-right"></span>
                            <table class="table table-hover table-bordered results pre-scrollable">
                                <thead>
                                    <tr>
                                        <th style="width: 68px">ID</th>
                                        <th style="width: 147px">Ürün Adı</th>
                                        <th style="width: 91px">Ürün Fiyatı</th>
                                        <th style="width: 162px">eklenme Tarihi</th>
                                        <th>Ürün Hakkında Kısa Bilgi</th>
                                        <th>Kategori</th>
                                    </tr>
                                    <%--<tr class="warning no-result">
                                            <td colspan="15"><i class="fa fa-warning"></i>Kayıt Yok</td>
                                        </tr>--%>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater_UrunTbl" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <th scope="row"><%#DataBinder.Eval(Container.DataItem, "Urun_Id") %></th>
                                                <td><%# DataBinder.Eval(Container.DataItem, "Ad") %></td>
                                                <td><%# DataBinder.Eval(Container.DataItem, "Fiyat") %></td>
                                                <td><%# DataBinder.Eval(Container.DataItem, "Eklenme_Tarihi","{0:d}" ) %></td>
                                                <td><%# DataBinder.Eval(Container.DataItem, "OzelNot") %></td>
                                                <td><%# DataBinder.Eval(Container.DataItem, "kad") %></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>
</div>

</asp:Content>