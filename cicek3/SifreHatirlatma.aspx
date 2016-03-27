<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SifreHatirlatma.aspx.cs" Inherits="cicek3.SifreSifirlama" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
</head>
<body>
    
                   
                    <form id="form1" runat="server" class="form-horizontal templatemo-forgot-password-form templatemo-container" role="form" action="#" method="post">
                        <div class="form-group">
                            <div class="col-md-12">
                                Lütfen Websitemize kayıt olurken kullandığınız E-Mail adresinizi giriniz!</br>
                                Bilgileriniz mailinize gönderilecektir.
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                          
                                <asp:TextBox TextMode="Email" ID="txt_Mail" runat="server" CssClass="form-control" placeholder="Mail Adresiniz"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <button type="button" class="btn btn-danger" runat="server" onserverclick="btn_sifreGonder">Gönder</button>

                            </div>
                        </div>
                    </form>

                
</body>
</html>
