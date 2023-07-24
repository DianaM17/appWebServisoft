<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterProfesional.Master" AutoEventWireup="true" CodeBehind="CalendarioCitass.aspx.cs" Inherits="appWebServisoft.Vista.CalendarioCitass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Calendario Citas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="Css/Calendario_Servicios.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="form1" runat="server">
        <h3 class="center-containers">Consulta tus Servicios Pendientes</h3>
        <div class="center-container">
            <%--<input type="date" id="fechaSeleccionada" />--%>

            <asp:TextBox ID="txtFecha" CssClass="Fecha" runat="server" Type="date"></asp:TextBox><br />
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
            <%--<button onclick="buscarTrabajos()">Buscar</button>--%>
        </div>
        <%--<div id="resultadoTrabajos"></div>--%>
        <div class="container mt-3">
            <asp:GridView ID="gvServicio" runat="server" AutoGenerateColumns="false" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="idsolicitudServicio" HeaderText="Servicio" Visible="false" />
                    <asp:BoundField DataField="fecha" HeaderText="Fecha" />
                    <asp:BoundField DataField="hora" HeaderText="Hora" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                    <asp:BoundField DataField="ubicacion" HeaderText="Ubicación" />
                    <asp:BoundField DataField="nombre" HeaderText="Ciudad" />
                    <asp:BoundField DataField="servicio" HeaderText="Servicio" />
                    <asp:BoundField DataField="NombreCompleto" HeaderText="Cliente" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
