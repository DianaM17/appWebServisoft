<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperaciónContraseña.aspx.cs" Inherits="appWebServisoft.Vista.RecuperaciónContraseña" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Css/Estilos_RecuperarContraseña.css" rel="stylesheet" />
</head>
<body>
    <form class="form container" runat="server">
        <span class="title">¿Olvidaste tu contraseña?</span>
        <p class="description">Ingresa el correo con el que inicias sesión para enviarte una nueva contraseña.</p>
        <asp:Label ID="lblMensaje" runat="server" CssClass="mensaje"></asp:Label><br />
        <div>
            <input placeholder="Correo electronico" type="email" name="txtEmail" id="txtEmail" runat="server" />
            <asp:Button ID="btnRecuperar" runat="server" CssClass="button" Text="Recuperar" OnClick="btnRecuperar_Click" />
            <%--<button type="submit" id="btnRecuperar" runat="server" onserverclick="btnRecuperar_ServerClick">Recuperar</button>--%>
        </div>
    </form>
</body>
</html>
