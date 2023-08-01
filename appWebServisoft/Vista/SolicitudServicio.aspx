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
    <div>
        <a href="interfazCliente.aspx" class="cta">
            <span>Volver</span>
            <svg width="13px" height="10px" viewBox="0 0 13 10" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M1,5 L5,1 L5,3 L11,3 L11,7 L5,7 L5,9 L1,5" stroke="black" stroke-width="1.5" fill="black"></path>
            </svg>


        </a>
        <style>
            a {
                text-decoration: none;
                color: inherit;
                top: 30px;
                right: -30px;
            }

            .cta {
                position: relative;
                margin: auto;
                padding: 19px 22px;
                transition: all 0.2s ease;
            }

                .cta:before {
                    content: "";
                    position: absolute;
                    top: 0;
                    left: 0;
                    display: block;
                    border-radius: 28px;
                    background: rgba(255, 171, 157, 0.5);
                    width: 56px;
                    height: 56px;
                    transition: all 0.3s ease;
                }

                .cta span {
                    position: relative;
                    font-size: 16px;
                    line-height: 18px;
                    font-weight: 900;
                    letter-spacing: 0.25em;
                    text-transform: uppercase;
                    vertical-align: middle;
                }

                .cta svg {
                    position: relative;
                    top: 0;
                    margin-left: 10px;
                    fill: none;
                    stroke-linecap: round;
                    stroke-linejoin: round;
                    stroke: #111;
                    stroke-width: 2;
                    transform: translateX(-5px);
                    transition: all 0.3s ease;
                }

                .cta:hover:before {
                    width: 100%;
                    background: #ffab9d;
                }

                .cta:hover svg {
                    transform: translateX(0);
                }

                .cta:active {
                    transform: scale(0.96);
                }
        </style>
    </div>
    <br />
    <br />
    <h1 style="font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">Solicitar Servicio</h1>
    <br />
    <div id="calendar-container">
        <h2 style="font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;">Selecciona el mes y el año:</h2>
        <br />
        <asp:Label ID="lblIdCliente" runat="server" Visible="false" Text="Label"></asp:Label>
        <div class="select-container">
            <select id="month" style="font-family: 'Bookman Old Style';">
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
            <select id="year" style="font-family: 'Bookman Old Style';"></select>
        </div>
        <div class="button-container">
            <button style="font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;" onclick="loadCalendar()">Ver Calendario</button>
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

