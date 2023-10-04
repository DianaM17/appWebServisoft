<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="RecuperarContraseña.aspx.cs" Inherits="appWebServisoft.Vista.RecuperarContraseña" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Estilos_RecuperarContraseña.css" rel="stylesheet" />
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css" />
 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form container" runat="server">
        <span class="title">¿Olvidaste tu contraseña?</span>
        <p class="description">Ingresa el correo con el que inicias sesión para enviarte una nueva contraseña.</p>
        <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje"></asp:Label><br />
        <div>
            <input placeholder="Correo electronico" type="email" name="txtEmail" id="txtEmail" runat="server" />
            <asp:Button ID="btnRecuperar" runat="server" CssClass="button" Text="Recuperar" OnClick="btnRecuperar_Click" />
            <%--<button type="submit" id="btnRecuperar" runat="server" onserverclick="btnRecuperar_ServerClick">Recuperar</button>--%>
        </div>
    </div>
</asp:Content>
