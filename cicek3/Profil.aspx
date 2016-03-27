<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="cicek3.KullaniciBilgileri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="css/profil.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    
		<div class="col-sm-12 col-md-12 user-details usr">
            <div class="user-image">
                <img id="img1" runat="server" alt="Karan Singh Sisodia" title="Karan Singh Sisodia" class="img-circle" height="100" width="100"/>
            </div>
            
            <div class="user-info-block">
                <div class="user-heading">
                    <h3>
                        <asp:Label ID="lbl_KullaniciAdSoyad" runat="server" Text="Label"></asp:Label></h3>
                    <span class="help-block">
                        <asp:Label ID="lbl_Il" runat="server" Text="Label"></asp:Label></span>
                </div>
                <ul class="navigation">
                    <li class="active">
                        <a data-toggle="tab" href="#information">
                            <span class="glyphicon glyphicon-user"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#settings">
                            <span class="glyphicon glyphicon-cog"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#email">
                            <span class="glyphicon glyphicon-envelope"></span>
                        </a>
                    </li>
                    <li>
                        <a data-toggle="tab" href="#events">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </a>
                    </li>
                </ul>
                <div class="user-body">
                    <div class="tab-content">
                        <div id="information" class="tab-pane active">
                            <h4>Account Information</h4>
                        </div>
                        <div id="settings" class="tab-pane">
                            <h4>Settings</h4>
                        </div>
                        <div id="email" class="tab-pane">
                            <h4>Send Message</h4>
                        </div>
                        <div id="events" class="tab-pane">
                            <h4>Events</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
</asp:Content>
