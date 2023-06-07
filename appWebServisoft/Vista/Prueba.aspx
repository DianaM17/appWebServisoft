<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="appWebServisoft.Vista.Prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <asp:GridView ID="grrDatos" runat="server" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="nombres" HeaderText="Nombres" />
        <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
        <asp:BoundField DataField="fotos" HeaderText="Fotos" />
        <asp:BoundField DataField="estado" HeaderText="Estado" />
    </Columns>
</asp:GridView>
    </form>
</body>
</html>
