<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterProfesional.Master" AutoEventWireup="true" CodeBehind="Trabajos_pendientes.aspx.cs" Inherits="appWebServisoft.Vista.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://kit.fontawesome.com/e5246dcec8.js" crossorigin="anonymous"></script>
    <!-- Referencia a Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <!-- Referencia a Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- Referencia a jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Referencia a Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div runat="server">
        <div>
            <h3 style="text-align: center; margin-top: 40px; font-family: Georgia;">TRABAJOS PENDIENTES</h3>
            <br />
            <br />

            <style>
                .centered-header th {
                    text-align: center;
                }

                .Encabezado {
                    font-family: Cambria, Cochin, Georgia, Times, Times New Roman, serif;
                    font-size: 15px;
                }

                .filas {
                    font-family: 'Bookman Old Style';
                    font-size: 14px;
                }
            </style>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvTrabajos" runat="server" DataKeyNames="idsolicitudServicio" BorderColor="#000099" BorderStyle="Groove" BorderWidth="3px" AutoGenerateColumns="False" Style="margin: auto;">
                        <HeaderStyle CssClass="centered-header Encabezado" BackColor="#99ccff" />
                        <AlternatingRowStyle BackColor="#cedcfd" />
                        <RowStyle BackColor="white" CssClass="filas" />
                        <Columns>
                            <asp:BoundField DataField="idsolicitudServicio" HeaderText="Servicio" Visible="false" />
                            <asp:BoundField DataField="fecha" HeaderText="Fecha" />
                            <asp:BoundField DataField="hora" HeaderText="Hora" />
                            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                            <asp:BoundField DataField="ubicacion" HeaderText="Direccion" />
                            <asp:BoundField DataField="nombre" HeaderText="Ciudad" />
                            <asp:BoundField DataField="NombreCompleto" HeaderText="Cliente" />
                            <asp:BoundField DataField="telefonoCliente" HeaderText="Telefono Cliente" />
                            <asp:TemplateField HeaderText="Estado">
                                <ItemTemplate>
                                    <asp:Label ID="lblEstado" runat="server" Text='<%# Eval("estadoServ") %>'></asp:Label>
                                </ItemTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Editar">
                                <ItemTemplate>
                                    <div style="text-align: center;">
                                        <a href="#" data-toggle="modal" data-target="#myModal" onclick="setSelectedId('<%# Eval("idsolicitudServicio") %>')">
                                    </div>
                                    <i class="fa fa-pencil"></i>
                                    </a>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

            <!-- Modal -->
            <div id="myModal" class="modal fade" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Editar Estado</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <asp:DropDownList ID="ddlEstadoModal" runat="server"></asp:DropDownList>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-primary" OnClick="btnGuardar_Click" />
                        </div>
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
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</asp:Content>
