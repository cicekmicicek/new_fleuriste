<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Malzeme.aspx.cs" Inherits="cicek3.Malzeme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
     Malzeme
<small>Malzemecileri ve Seracıları Görüntüleyin</small>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <i class="fa fa-modx""></i>
    Malzeme
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
</asp:Content>
