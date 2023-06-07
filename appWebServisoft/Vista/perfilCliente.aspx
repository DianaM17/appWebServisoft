<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="perfilCliente.aspx.cs" Inherits="appWebServisoft.Vista.perfilCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>PerfilCliente</h1>
    <asp:Label ID="lblIdCliente" runat="server"></asp:Label>
    <asp:TextBox ID="txtNombres" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtApellidos" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    <asp:TextBox ID="txtClave" runat="server"></asp:TextBox>
    <asp:DropDownList ID="ddlCiudad" runat="server"></asp:DropDownList>

    <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" />
</asp:Content>
