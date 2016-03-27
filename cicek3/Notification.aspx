<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="cicek3.Notification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
       Uyarılar
<small>Yaklaşan Etkinlikler..</small>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <i class="fa fa-calendar-check-o"></i>
    Uyarılar
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    <div class="row">
        <div class="col-lg-6">
            <asp:Calendar ID="Calendar1" runat="server"   Font-Names="Verdana"  OnDayRender="Calendar1_DayRender"  
BackColor="White"   BorderColor="Black"   BorderStyle="Solid"   CellSpacing="1"   Font-Size="9pt"  
ForeColor="Black"   Height="250px"   NextPrevFormat="ShortMonth">  
    <SelectedDayStyle BackColor="#333399" ForeColor="White" />  
    <TodayDayStyle BackColor="#999999" ForeColor="White" />  
    <OtherMonthDayStyle ForeColor="#999999" />  
    <DayStyle BackColor="#CCCCCC" Height="50px" Width="100px" />  
    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />  
    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />  
    <TitleStyle BackColor="#222" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />  
</asp:Calendar> 
        </div>
        <div class="col-lg-6 pull-right">
            <div class="alert alert-warning">
                    <strong>Bugünki Etkinlikler</strong> Saat sırasına göre sıralanmıştır.
                </div>
        </div>
        <div class="col-lg-6 pull-right pre-scrollable">
            <asp:Repeater ID="RptEtkilesim" runat="server">
                <ItemTemplate>
                    <div class="col-sm-12">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <h3 class="panel-title"><%# DataBinder.Eval(Container.DataItem, "Tur") %></h3>
                            </div>
                            <div class="panel-body">

                                <%# DataBinder.Eval(Container.DataItem, "adSoyad") %>
                                <%# DataBinder.Eval(Container.DataItem, "Tarih") %>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
        </div>
        </div>
    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#66FF33"></asp:Label>
    </asp:Content>
