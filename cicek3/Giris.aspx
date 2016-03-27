<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="cicek3.Giris" EnableEventValidation="false"%> <%--enableeventfalse sonradan eklendi modal buton sorunu için--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Flueriste Giriş Ekranı</title>
    <link rel="shortcut icon" href="Images/favicon.ico" type="favicon/ico" />
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet" type="text/css">
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <link href="css/giris/bootstrap-theme.min.css" rel="stylesheet" type="text/css">
    <link href="css/giris/bootstrap-social.css" rel="stylesheet" type="text/css">
    <link href="css/giris/templatemo_style.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!-- messageBox -->
    <link rel="stylesheet" href="../js/plugins/msgbox/notifIt.css" />
    <script src="../js/jquery-2.0.3.min.js"></script>
    <script src="../js/plugins/msgbox/notifIt.js"></script>
    <script type="text/javascript">        //txt_sifre ye onkeydown="return handleEnter('btn_giri', event)" eklendi
        function handleEnter(obj, event) {
            var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
            if (keyCode == 13) {
                document.getElementById(obj).click();
                return false;
            }
            else {
                return true;
            }
        }
    </script>
</head>
<body class="templatemo-bg-image-1">
    <div class="container">
        <div class="col-md-12">
            <form class="form-horizontal templatemo-login-form-2" id="form1" runat="server">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Flueriste Yönetim Sistemi</h1>
                        
                    </div>
                </div>
                <div class="row">
                    <div class="templatemo-one-signin col-md-6">
                        <div class="form-group">
                            <div class="col-md-12">
                                <label for="username" class="control-label">Kullanıcı Adı</label>
                                <div class="templatemo-input-icon-container">
                                    <i class="fa fa-user"></i>
                                    <%--<input type="text" class="form-control" id="username" placeholder="">--%>
                                    <asp:TextBox ID="txt_KullaniciAdi" runat="server"  CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label for="password" class="control-label">Şifre</label>
                                <div class="templatemo-input-icon-container">
                                    <i class="fa fa-lock"></i>
                                    <%--<input type="password" class="form-control" id="password" placeholder="">--%>
                                    <asp:TextBox TextMode="Password" ID="txt_Sifre" runat="server" onkeydown="return handleEnter('btn_giri', event)"  CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <div class="checkbox">
                                    <label>
                                        <%--<input type="checkbox">--%>
                                        <asp:CheckBox ID="Chck_Hatirla" runat="server" />Beni Hatırla
                                        
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="button" id="btn_giri" class="btn btn-warning" runat="server" onserverclick="btn_giris">Giriş</button>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <a href="#" data-toggle="modal" data-target=".bs-example-modal-lg">Şifrenizimi Unuttunuz?</a>
                            </div>
                        </div>
                    </div>

                    <div class="templatemo-other-signin col-md-6">
                        <label class="margin-bottom-15">
                            Aşağıdaki sosyal hesapları sistemimize bağladıysanız bunlardan birisiyle giriş yapabilirsiniz.<a rel="nofollow" href="#">Detaylı Bilgi</a>
                        </label>
                        <a class="btn btn-block btn-social btn-facebook margin-bottom-15">
                            <i class="fa fa-facebook"></i>Facebook ile Giriş Yap
                        </a>
                        <a class="btn btn-block btn-social btn-twitter margin-bottom-15">
                            <i class="fa fa-twitter"></i>Twitter ile Giriş Yap
                        </a>
                        <a class="btn btn-block btn-social btn-google-plus">
                            <i class="fa fa-google-plus"></i>Google ile Giriş Yap
                        </a>
                    </div>
                </div>

            </form>
        </div>
    </div>
    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <iframe runat="server"  style="width:100%; height: 240px; width: 100%; text-align:center"  src="SifreHatirlatma.aspx" frameborder="0"></iframe>
            </div>
        </div>
    </div>
    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
