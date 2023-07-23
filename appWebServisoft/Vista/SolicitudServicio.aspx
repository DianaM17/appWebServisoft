<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SolicitudServicio.aspx.cs" Inherits="appWebServisoft.Vista.SolicitudServicio" %>


<!DOCTYPE html>
<html>
<head>
    <title>Realizar solicitud de servicio:</title>
    <link href="Css/Estilos_SolicitudServicio.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/e5246dcec8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="../Scripts/sweetalert.min.js"></script>
    <link href="Css/sweetalert.css" rel="stylesheet" />
</head>
<body>
    <h1>Solictar Servicio</h1>
    <div id="calendar-container">
        <h2>Selecciona el mes y el año:</h2>
        <asp:Label ID="lblIdCliente" runat="server" Visible="false" Text="Label"></asp:Label>
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
            <button onclick="loadCalendar()">Ver Calendario</button>
        </div>
        <div id="calendar"></div>
    </div>

    <div id="modal" class="modal">
        <div class="modal-content" style="height: 600px;">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 style="color: darkblue;">Solicitar Servicio</h2>
            <div>
                <input type="text" id="event-date" disabled>
            </div>
            <form runat="server">
                <div>
                    <i class="bi bi-calendar-date-fill" style="color: darkblue;"></i>
                    <asp:Label ID="lblFecha" runat="server" Font-Bold="true" Style="color: darkblue;" Text="Fecha Servicio:"></asp:Label>
                    <asp:TextBox ID="txtFecha" runat="server" Type="date"></asp:TextBox>
                </div>
                <br />
                <div>
                    <i class="bi bi-alarm-fill" style="color: darkblue;"></i>
                    <asp:Label ID="lblHora" runat="server" Font-Bold="true" Style="color: darkblue;" Text="Hora:"></asp:Label>
                    <input type="time" id="txtHora" runat="server" name="txtHora">
                    <br />
                </div>
                <br />
                <div>
                    <i class="bi bi-card-list" style="color: darkblue;"></i>
                    <asp:Label ID="lblDescripcion" runat="server" Font-Bold="true" Style="color: darkblue;" Text="Descripción: "></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                    <br />
                </div>
                <br />
                <div>
                    <asp:Label ID="lblEstado" runat="server" Font-Bold="true" Style="color: darkblue;" Text="Estado:"></asp:Label>
                    <asp:DropDownList ID="ddlEstadoSev" runat="server"></asp:DropDownList>
                    <%--<asp:TextBox ID="txtEstado" runat="server" Enabled="false">En Proceso</asp:TextBox>--%>
                    <br />
                </div>
                <br />
                <div>
                    <i class="bi bi-houses-fill" style="color: darkblue;"></i>
                    <asp:Label ID="lblDireccion" runat="server" Font-Bold="true" Style="color: darkblue;" Text="Direccion:"></asp:Label>
                    <asp:TextBox ID="txtDireccion" runat="server" placeholder="Direccion"></asp:TextBox>
                    <br />
                </div>
                <div>
                    <br />
                    <i class="bi bi-buildings-fill" style="color: darkblue;"></i>
                    <asp:Label ID="lblCiudad" class="ubuntu" Style="color: darkblue;" Font-Bold="true" runat="server" Text="Ciudad:"></asp:Label>
                    <asp:DropDownList ID="ddlCiudad" runat="server"></asp:DropDownList>
                </div>
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div>
                            <br />
                            <i class="bi bi-tools" style="color: darkblue;"></i>
                            <label for="categoria" class="ubuntu" style="color: darkblue;">Categoria:</label>
                            <asp:DropDownList ID="ddlCategoria" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div>
                            <br />
                            <i class="bi bi-wrench-adjustable-circle-fill" style="color: darkblue;"></i>
                            <label for="servicio" style="color: darkblue;" class="ubuntu">Servicio:</label>
                            <asp:DropDownList ID="ddlServicio" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlServicio_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <br />
                        <i class="bi bi-person-badge-fill" style="color: darkblue;"></i>
                        <label for="profesional" style="color: darkblue;" class="ubuntu">Profesional:</label>
                        <asp:DropDownList ID="ddlProfesional" runat="server"></asp:DropDownList>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
                <asp:Button ID="Button1" class="btn third" Style="width: 150px; height: 40px; color: black;" OnClick="Button1_Click" runat="server" Text="Solicitar Servicio" />

            </form>

        </div>
    </div>

    <script src="Js/Js_SolicitudServicio.js"></script>
</body>
</html>

