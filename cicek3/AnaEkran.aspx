<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AnaEkran.aspx.cs" Inherits="cicek3.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-9">
            <div class="alert alert-info alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <i class="fa fa-info-circle"></i><strong>
                    <asp:Label ID="LblDuyuru" runat="server" Text="Label"></asp:Label></strong><a href="http://www.flueriste.com.tr" class="alert-link"></a>
            </div>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col-lg-3 pull-right pre-scrollable">

            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:Repeater ID="RptEtkilesim" runat="server">
                        <ItemTemplate>
                            <div class="col-sm-12">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <a href="#">
                                            <div class="row">
                                                <div class="col-xs-9">
                                                    <h3 class="panel-title"><%# DataBinder.Eval(Container.DataItem, "KullaniciAdi") %></h3>
                                                </div>
                                                <div class="col-xs-3 text-right">
                                                    <img src='Images/Users/<%#DataBinder.Eval(Container.DataItem,"KullaniciAdi")%>/<%#DataBinder.Eval(Container.DataItem,"Resim")%>' height="20" width="20" alt="image description" />                                                 
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="panel-body">

                                        <p>Firma Türü:   <%# DataBinder.Eval(Container.DataItem, "TurAdi") %></p>
                                        <p>İl:  <%# DataBinder.Eval(Container.DataItem, "Il") %> </p>
                                        <p>Telefon: <%# DataBinder.Eval(Container.DataItem, "Telefon") %></p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </ContentTemplate>

            </asp:UpdatePanel>

        </div>

        <div class="col-lg-3 col-md-6">
            <div class="panel panel-green">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="glyphicon glyphicon-check fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">
                                <asp:Label ID="LblTeslimEdilenSiparis" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div>Teslim Edilen Sipariş</div>
                        </div>
                    </div>
                </div>
                <a href="TeslimEdilenler.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Detayları Görüntüle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-yellow">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="glyphicon glyphicon-thumbs-up fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">
                                <asp:Label ID="LblHazirlananSiparis" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div>Hazırlanan Sipariş</div>
                        </div>
                    </div>
                </div>
                <a href="Hazirlananlar.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Detayları Görüntüle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="glyphicon glyphicon-fire fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">
                                <asp:Label ID="LblTamamlanmamisSiparis" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div>Tamamlanmamış Sipariş</div>
                        </div>
                    </div>
                </div>
                <a href="SiparisKuyruk.aspx">
                    <div class="panel-footer">
                        <span class="pull-left">Detayları Görüntüle</span>
                        <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                        <div class="clearfix"></div>
                    </div>
                </a>
            </div>
        </div>
        <%--<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click1" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="True">
             <ContentTemplate>
         <button id="btn1" runat="server" onserverclick="btn1_ServerClick" type="button" class="btn btn-primary outline">Primary</button>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
     </ContentTemplate>
             <Triggers>
                 <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
             </Triggers>
        </asp:UpdatePanel>--%>
    </div>

</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <%--<i class="glyphicon glyphicon-home"></i>
    Ana Ekran--%>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder4">
    Ana Ekran
    <small>Başlangıç Ekranı</small>
</asp:Content>


