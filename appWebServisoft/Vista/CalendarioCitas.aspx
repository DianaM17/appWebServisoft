<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalendarioCitas.aspx.cs" Inherits="appWebServisoft.Vista.CalendarioCitas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.print.min.css" media="print" />
    <link href="Css/Calendario_Servicios.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--<input type="date" id="fechaSeleccionada" />--%>
            <asp:TextBox ID="txtFecha" runat="server" Type="date"></asp:TextBox>
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
        </div>
    </form>
    <%--<script>
        function buscarTrabajos() {
            var fechaSeleccionada = document.getElementById('fechaSeleccionada').value;

            // Aquí puedes realizar una llamada a tu backend o procesar los datos localmente
            // para obtener los trabajos programados para la fecha seleccionada

            // Ejemplo de datos de trabajos programados
            var trabajos = [
                { titulo: 'Trabajo 1', fecha: '2023-07-11' },
                { titulo: 'Trabajo 2', fecha: '2023-07-11' },
                { titulo: 'Trabajo 3', fecha: '2023-07-12' },
                { titulo: 'Trabajo 4', fecha: '2023-07-12' },
            ];

            // Filtrar los trabajos por la fecha seleccionada
            var trabajosFiltrados = trabajos.filter(function (trabajo) {
                return trabajo.fecha === fechaSeleccionada;
            });

            // Mostrar los trabajos en el resultado
            var resultadoTrabajos = document.getElementById('resultadoTrabajos');
            resultadoTrabajos.innerHTML = '';

            if (trabajosFiltrados.length > 0) {
                trabajosFiltrados.forEach(function (trabajo) {
                    var trabajoElement = document.createElement('p');
                    trabajoElement.textContent = trabajo.titulo;
                    resultadoTrabajos.appendChild(trabajoElement);
                });
            } else {
                resultadoTrabajos.textContent = 'No hay trabajos programados para la fecha seleccionada.';
            }
        }
    </script>--%>
</body>

</html>
