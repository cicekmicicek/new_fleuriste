<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YonetimPaneli.aspx.cs" Inherits="cicek3.Yonetim.YonetimPaneli" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Flueriste Yönetim Paneli</title>
    <%--jquery--%>
    <script type="text/javascript" src="../js/jquery.js"></script>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />

    <link href="../css/buttons.css" rel="stylesheet" />
    <!-- Custom CSS -->

    <link href="../css/sb-admin.css" rel="stylesheet" />
    <!-- messageBox -->
    <link rel="stylesheet" href="../js/plugins/msgbox/notifIt.css" />
    <script src="../js/jquery-2.0.3.min.js"></script>
    <script src="../js/plugins/msgbox/notifIt.js"></script>

    <!-- Custom Fonts -->
    <link href="../fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="yonetimCustom.css" rel="stylesheet" />
    <script src="yonetimCustomjs.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#div1").hide(), $("#div2").hide(), $("#div3").hide(), $("#div4").hide(), $("#divUserGuncelle").hide()
            $("#KullaniciEkle").click(function () { $("#div1").show("slow"), $("#div2").hide("slow"), $("#div3").hide("slow"), $("#div4").hide("slow") });

            $("#KullaniciSil").click(function () { $("#div2").show("slow"), $("#div1").hide("slow"), $("#div3").hide("slow"), $("#div4").hide("slow") });

            $("#KullaniciDuzenle").click(function () { $("#div3").show("slow"), $("#div1").hide("slow"), $("#div2").hide("slow"), $("#div4").hide("slow") });

            $("#FirmaTurEkle").click(function () { $("#div4").show("slow"), $("#div1").hide("slow"), $("#div2").hide("slow"), $("#div3").hide("slow") });
            $("#FirmaTurEkle2").click(function () { $("#div4").show("slow"), $("#div1").hide("slow"), $("#div2").hide("slow"), $("#div3").hide("slow") });
            $("#btn_UserBul").click(function () { $("#divUserGuncelle").show() });
        });
    </script>
    <script src="fileUploadDenetim.js"></script><%--//onchange="return CheckFile(this);" fileupload a onchange olayı ekledim--%>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="row">
                <div class="col col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Yönetim Paneli
                        </div>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <div class="panel-body pre-scrollable">
                            <div class="row">
                                <div class="form-group pull-right">
                                    <input type="text" class="search form-control" placeholder="Bulmak istediğiniz kullanıcı?" />
                                </div>
                                <span class="counter pull-right"></span>
                                <table class="table table-hover table-bordered results pre-scrollable">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Kullanıcı Adı</th>
                                            <th>Sifre</th>
                                            <th>Ad</th>
                                            <th>Soyad</th>
                                            <th>Tc No</th>
                                            <th>Vergi No</th>
                                            <th>Telefon</th>
                                            <th>Mail</th>
                                            <th>İl</th>
                                            <th>Adres</th>
                                            <th>Firma Türü</th>
                                            <th>Resim</th>
                                            <th>Üyelik Bas. Tarihi</th>
                                            <th>Üyelik Bit. Tarihi</th>
                                        </tr>
                                        <tr class="warning no-result">
                                            <td colspan="15"><i class="fa fa-warning"></i>Kayıt Yok</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="Repeater_UserTbl" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <th scope="row"><%# DataBinder.Eval(Container.DataItem, "User_Id") %></th>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "KullaniciAdi") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "Sifre") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "Ad") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "Soyad") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "TcNo") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "VergiNo") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "Telefon") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "Mail") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "Il") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "Adres") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "TurAdi") %></td>
                                                    <%--<td><%# DataBinder.Eval(Container.DataItem, "Resim") %></td>--%>
                                                    <td>
                                                        <img src='../Images/Users/<%#DataBinder.Eval(Container.DataItem,"KullaniciAdi")%>/<%#DataBinder.Eval(Container.DataItem,"Resim")%>' height="20" width="20" alt="image description" />
                                                    </td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "UyelikBaslangicTarihi") %></td>
                                                    <td><%# DataBinder.Eval(Container.DataItem, "UyelikBitisTarihi") %></td>
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

            <div class="row">
                <div class="col col-lg-12">
                    <a class="btn btn-success outline" href="#" id="KullaniciEkle">Kullanıcı Ekle</a>
                    <a class="btn btn-success outline" href="#" id="KullaniciSil">Kullanıcı Sil</a>
                    <a class="btn btn-success outline" href="#" id="KullaniciDuzenle">Kullanıcı Düzenle</a>
                    <a class="btn btn-success outline" href="#" id="FirmaTurEkle">Firma Türü Ekle</a>
                    <div id="div1">
                        <div class="row">
                            <div class="col col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Kullanıcı Ekle
                                    </div>
                                    <div class="panel-body">
                                        <table class="table table-hover table-bordered results pre-scrollable">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Kullanıcı Adı</th>
                                                    <th>Sifre</th>
                                                    <th>Ad</th>
                                                    <th>Soyad</th>
                                                    <th>Tc No</th>
                                                    <th>Vergi No</th>
                                                    <th>Telefon</th>
                                                    <th>Mail</th>
                                                    <th>İl</th>
                                                    <th>Adres</th>
                                                    <th>Firma Türü</th>
                                                    <th>Resim</th>
                                                    <th>Üyelik Bit. Tarihi</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th></th>
                                                    <th>
                                                        <asp:TextBox ID="txt_KullaniciAdi" MaxLength="30" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_KullaniciAdi" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_Sifre" MaxLength="12" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_Sifre" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_Ad" MaxLength="20" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_Ad" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_Soyad" MaxLength="20" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_Soyad" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_TcNo" MaxLength="11" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_TcNo" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_VergiNo" MaxLength="11" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_VergiNo" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_Telefon" MaxLength="16" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_Telefon" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_Mail" MaxLength="30" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_Mail" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_Il" MaxLength="15" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_Il" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <asp:TextBox ID="txt_Adres" MaxLength="80" runat="server" Width="82px" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_Adres" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                    </th>
                                                    <th>
                                                        <a href="#" id="FirmaTurEkle2">Yeni Firma Türü Ekle</a>
                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                            <ContentTemplate>
                                                                <asp:DropDownList CssClass="form-control" ID="DropDown_FirmaTurleri" runat="server"></asp:DropDownList>

                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </th>
                                                    <th>
                                                        <asp:FileUpload ID="FileUploadResim" onchange="return CheckFile(this);" runat="server" Width="117px" />

                                                    </th>

                                                    <th>
                                                        <asp:TextBox TextMode="Date" ID="txt_UbitisTarihi" runat="server" Width="126px" CssClass="form-control"></asp:TextBox>
                                                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Boş Geçilemez" ControlToValidate="txt_UbitisTarihi" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                                        
                                                    </th>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="col-lg-12 text-center">


                                            <asp:Button ID="btn_UserEkle" CssClass="btn btn-primary raised" runat="server" Text="Kaydet" OnClick="btn_UserEkle_Click" />


                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
                                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>


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
                                        Kullanıcı Sil
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <label>Kullanıcı Id:</label>
                                                <asp:TextBox ID="txt_KullaniciSil" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:Button ID="btn_UserSil" CssClass="btn btn-danger raised" runat="server" Text="Sil" OnClick="btn_UserSil_Click" />
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
                                        Kullanıcı Düzenle
                                    </div>
                                    <div class="panel-body">
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                            <ContentTemplate>
                                                <div class="row">
                                                    <div class="col-lg-3">
                                                        <label>Güncellenecek kullanıcının Id'si:</label>
                                                        <div class="form-group input-group">
                                                            <asp:TextBox ID="txtGuncelle_KullaniciId" runat="server" CssClass="form-control"></asp:TextBox>
                                                            <span class="input-group-btn">
                                                                <a class="btn btn-default" id="btn_UserBul" runat="server" href="#" onserverclick="btn_UserBul_Click"><i class="fa fa-search"></i></a>
                                                            </span>
                                                        </div>
                                                        <div id="divUserGuncelle" class="col-lg-12">
                                                            <table class="table table-hover table-bordered results pre-scrollable">
                                                                <thead>
                                                                    <tr>
                                                                        <th>#</th>
                                                                        <th>Kullanıcı Adı</th>
                                                                        <th>Sifre</th>
                                                                        <th>Ad</th>
                                                                        <th>Soyad</th>
                                                                        <th>Tc No</th>
                                                                        <th>Vergi No</th>
                                                                        <th>Telefon</th>
                                                                        <th>Mail</th>
                                                                        <th>İl</th>
                                                                        <th>Adres</th>
                                                                        <th>Firma Türü</th>
                                                                        <th>Resim</th>
                                                                        <th>Üyelik Bit. Tarihi</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>
                                                                        <th></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_KullaniciAdi" MaxLength="30" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_Sifre" MaxLength="12" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_Ad" MaxLength="20" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_Soyad" MaxLength="20" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_TcNo" MaxLength="11" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_Vergi" MaxLength="11" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_Tel" MaxLength="16" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_Mail" MaxLength="30" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_Il" MaxLength="15" runat="server" Width="82px" CssClass="form-control"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:TextBox ID="txtGuncelle_Adres" MaxLength="80" runat="server" Width="82px" CssClass="form-control" TextMode="MultiLine"></asp:TextBox></th>
                                                                        <th>
                                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                                <ContentTemplate>
                                                                                    <asp:DropDownList CssClass="form-control" ID="DropDownGuncelle_FirmaTurleri" runat="server"></asp:DropDownList>
                                                                                </ContentTemplate>
                                                                            </asp:UpdatePanel>
                                                                        </th>
                                                                        <th>
                                                                            <asp:FileUpload ID="FileUploadGuncelleResim" onchange="return CheckFile(this);" runat="server" Width="117px" /></th>

                                                                        <th>
                                                                            <asp:TextBox TextMode="Date" ID="txtGuncelle_UBitisTarihi" runat="server" Width="82px" CssClass="form-control"></asp:TextBox>
                                                                        </th>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <asp:Button ID="btn_UserGuncelle" CssClass="btn btn-danger raised" runat="server" Text="Güncelle" OnClick="btn_UserGuncelle_Click" />
                                                            <asp:TextBox ID="TextBox1" runat="server" Width="29px" Visible="False"></asp:TextBox>
                                                        </div>

                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="btn_UserGuncelle" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <asp:LinkButton ID="LinkButton1" CssClass="btn-link" runat="server" OnClick="LinkButton1_Click">Sayfayı Yenile</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="div4">
                        <div class="row">
                            <div class="col col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Yeni Firma Türü Ekle
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-3">
                                                <label>Tür Adı:</label>
                                                <asp:TextBox ID="txt_FirmaTurAdi" MaxLength="50" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:Button ID="btn_FirmaTurEkle" CssClass="btn btn-primary raised" runat="server" Text="Kaydet" OnClick="btn_FirmaTurEkle_Click" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="../js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
</body>
</html>
