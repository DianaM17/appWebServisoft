<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SolicitudServicio.aspx.cs" Inherits="appWebServisoft.Vista.SolicitudServicio" %>


<!DOCTYPE html>
<html>
<head>
    <title>Calendario</title>
    <link href="Css/Estilos_SolicitudServicio.css" rel="stylesheet" />
</head>
<body>
    <h1>Calendario</h1>
    <div id="calendar-container">
        <h2>Selecciona el mes y el año:</h2>
        <div class="select-container">
            <select id="month">
                <option value="0">Enero</option>
                <option value="1">Febrero</option>
                <option value="2">Marzo</option>
                <option value="3">Abril</option>
                <option value="4">Mayo</option>
                <option value="5">Junio</option>
                <option value="6">Julio</option>
                <option value="7">Agosto</option>
                <option value="8">Septiembre</option>
                <option value="9">Octubre</option>
                <option value="10">Noviembre</option>
                <option value="11">Diciembre</option>
            </select>
            <select id="year"></select>
        </div>
        <div class="button-container">
            <button onclick="loadCalendar()">Mostrar Calendario</button>
        </div>
        <div id="calendar"></div>
    </div>

    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Crear evento</h2>
            <div>
                <input type="text" id="event-date" disabled>
            </div>
            <div>
           <%--     <label for="fechaServicio">Fecha Servicio:</label>
                <input type="date" name="fechaSevicio" runat="server" id="txtfechaServicio">
            </div>
            <div>
                <label for="hora">Hora:</label>
                <input type="time" name="hora" runat="server" id="txtHora">
            </div>
            <div>
                <label for="descripcion">Descripcion:</label>
                <input type="text" id="txtDescripcion" runat="server" name="descripcion" placeholder="Descripcion">
            </div>
            <div>
                <label for="estado">Estado:</label>
                <input type="text" id="txtEstado" runat="server" name="estado" placeholder="Estado">
            </div>
            <div>
                <label for="direccion">Direccion:</label>
                <%--<input type="text" id="txtDireccion" runat="server" name="direccion" placeholder="Direccion">--%>
            </div>
            <form runat="server">
                <div>
                    <asp:Label ID="lblFecha" runat="server" Text="Fecha Servicio:"></asp:Label>
                    <asp:TextBox ID="txtFecha" runat="server" Type="date" ></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lblHora" runat="server" Text="Hora:"></asp:Label>
                    <asp:TextBox ID="txtHora" type="time" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción: "></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lblEstado" runat="server" Text="Estado:"></asp:Label>
                    <asp:TextBox ID="txtEstado" runat="server" placeholder="Estado"></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="lblDireccion" runat="server" Text="Direccion:"></asp:Label>
                    <asp:TextBox ID="txtDireccion" runat="server" placeholder="Direccion"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" Text="Solicitar" />
            </form>
            <%--<button id="btnGuardar" type="submit" name="guardar" runat="server" onserverclick="btnGuardar_ServerClick">Guardar</button>--%>
        </div>
    </div>

    <script src="Js/Js_SolicitudServicio.js"></script>
</body>
</html>

