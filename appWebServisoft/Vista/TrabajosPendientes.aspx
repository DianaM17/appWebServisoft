<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrabajosPendientes.aspx.cs" Inherits="appWebServisoft.Vista.Trabajos_a_realizar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Trabajos</h3>

            <style>
                .centered-header th {
                    text-align: center;
                }
            </style>

            <asp:GridView ID="gvTrabajos" runat="server" BorderColor="#9900FF" BorderStyle="Groove" BorderWidth="2px" BackColor="#FFCCFF" AutoGenerateColumns="False" Style="margin: auto;">
                <HeaderStyle CssClass="centered-header" />
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
                            <a href="#" data-toggle="modal" data-target="#myModal">
                                <i class="fa fa-pencil"></i>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

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
                            <button type="button" class="btn btn-primary" onclick="btnGuardar_Click">Guardar</button>
                        </div>
                    </div>
                </div>
            </div>
            <asp:HiddenField ID="hdnSelectedId" runat="server" />

        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
