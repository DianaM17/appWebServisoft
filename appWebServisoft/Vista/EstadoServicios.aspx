<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="EstadoServicios.aspx.cs" Inherits="appWebServisoft.Vista.EstadoServicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/e5246dcec8.js" crossorigin="anonymous"></script>
    <link href="Css/Estilos_EstadoServicio.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-3">
        <asp:GridView ID="gvServicio" runat="server" DataKeyNames="idsolicitudServicio" AutoGenerateColumns="false" CssClass="table table-striped">
            <Columns>
                <asp:BoundField DataField="idsolicitudServicio" HeaderText="Servicio" Visible="false" />
                <asp:BoundField DataField="fecha" HeaderText="Fecha" />
                <asp:BoundField DataField="hora" HeaderText="Hora" />
                <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                <asp:BoundField DataField="ubicacion" HeaderText="Ubicación" />
                <asp:BoundField DataField="nombre" HeaderText="Ciudad" />
                <asp:BoundField DataField="servicio" HeaderText="Servicio" />
                <asp:BoundField DataField="NombreCompleto" HeaderText="Profesional" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <div id="gvServicioRow">
                            <asp:Button ID="btnCancelar" CssClass="btn third" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CommandArgument='<%# Eval("idsolicitudServicio") %>' />
                            <a href="#" class="btn third" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="setSelectedId('<%# Eval("idsolicitudServicio") %>')">Reprogramar</a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Reprogramar Servicio</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
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
                        <asp:Label ID="lblEstado" runat="server" Font-Bold="true" Style="color: darkblue;" Text="Estado:"></asp:Label>
                        <asp:TextBox ID="txtEstado" runat="server" placeholder="Estado" Enabled="false">Aceptado</asp:TextBox>
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
                    <asp:Button ID="Button1" class="btn third" Style="width: 150px; height: 40px; color: black;" OnClick="Button1_Click" runat="server" Text="Reprogramar" />
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdnSelectedId" runat="server" />
    <script>
        function setSelectedId(id) {
            document.getElementById('<%= hdnSelectedId.ClientID %>').value = id;
        }
    </script>
</asp:Content>
