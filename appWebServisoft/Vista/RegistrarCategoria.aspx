<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="RegistrarCategoria.aspx.cs" Inherits="appWebServisoft.Vista.RegistrarCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Estilos_RegistrarCategoria.css" rel="stylesheet" />
    <script src="../Scripts/sweetalert.min.js"></script>
    <link href="Css/sweetalert.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div action="" class="form containers">
        <div class="Group">
            <label for="Email">Categoria</label>
            <input placeholder="Nombre Categoria" id="txtCategoria" name="txtCategoria" runat="server" type="text" />
        </div>
        <div class="">
            <label for="Password">Password</label>
            <asp:FileUpload ID="FuImagen" runat="server" />
            <%--<input id="Password" type="password">--%>
        </div>
        <div class="Group">
            <asp:Button ID="btnRegistrar" CssClass="btn" Text="Registrar" runat="server" OnClick="btnRegistrar_Click" />
        </div>
    </div>
</asp:Content>
