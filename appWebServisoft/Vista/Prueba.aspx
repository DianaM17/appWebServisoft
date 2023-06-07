<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="appWebServisoft.Vista.Prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <h1>Profesionales Disponibles</h1>
    <form id="form1" runat="server">
        <asp:GridView ID="grrDatos" runat="server" class="grid-container" AutoGenerateColumns="false" BackColor="#0e213c" BorderColor="#244a7d" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="#ffffff" OnRowDataBound="grrDatos_RowDataBound">

            <Columns>
                
                <asp:BoundField DataField="idProfesional" HeaderText="idProfesional" Visible="false"/>
                <asp:BoundField DataField="nombres" HeaderText="Nombres" />
                <asp:BoundField DataField="apellidos" HeaderText="Apellidos" />
                <asp:BoundField DataField="estado" HeaderText="Estado" />


                <asp:TemplateField HeaderText="Fotos">
                    <ItemTemplate>
                        <asp:Image ID="ImgProf" runat="server" Height="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <RowStyle BackColor="#0e213c" ForeColor="#ffffff" />
            <HeaderStyle BackColor="#1a355e" Font-Bold="True" ForeColor="#ffffff" />
            <AlternatingRowStyle BackColor="#1a355e" ForeColor="#ffffff" />

        </asp:GridView>
        <style>
            .Ocultar {
                display: none;
            }
        </style>
    </form>
</body>
</html>
