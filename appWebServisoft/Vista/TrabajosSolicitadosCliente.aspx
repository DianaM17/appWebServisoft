<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="TrabajosSolicitadosCliente.aspx.cs" Inherits="appWebServisoft.Vista.TrabajosSolicitadosCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Carga jQuery (asegúrate de ajustar la ruta si es necesario) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- CSS de Bootstrap (asegúrate de ajustar la ruta si es necesario) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- JS de Bootstrap (asegúrate de ajustar la ruta si es necesario) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Trabajos Pendientes</h3>
    
    <asp:HiddenField ID="hfIdCotizacion" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Repeater ID="repeaterListar" runat="server">
                <ItemTemplate>
                    <div class="card-container col-6 col-sm-4 col-md-3 col-lg-2 ">
                        <div class="card-content">
                            <asp:Label runat="server" ID="Label3" Text='<%# Eval("idCotizacion") %>' Visible="false"></asp:Label>
                            <h6>Titulo del Servicio</h6>
                            <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("tituloServicio") %>'></asp:Label>
                            <br />
                            <h6>Descripción del trabajo</h6>
                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("descripcion") %>'></asp:Label>
                            <br />
                            <h6>Dirección</h6>
                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("direccion") %>'></asp:Label>

                            <asp:LinkButton runat="server" CssClass="reprogramar-link" CommandArgument='<%# Eval("idCotizacion") %>' OnClick="ReprogramarLinkButton_Click">Ver Profesionales</asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>

    <style>
        .card-container {
            width: calc(100% - 80px); /* Restar el doble del margen al ancho total */
            margin: 40px;
            padding: 20px;
            background-color: #f0f0f0;
            box-sizing: border-box; /* Incluir el margen dentro del ancho */
        }

        .card-content {
            width: 100%;
            margin: 1px;
        }
    </style>

    <%--Ventana Modal Profecionales--%>

    <%--Ventana Modal Profecionales--%>
    <!-- Ventana Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" data-bs-onshown="openModal">
    <div class="modal-dialog modal-xl modal-dialog-centered"> <!-- Agrega las clases "modal-xl" y "modal-dialog-centered" aquí -->
        <div class="modal-content">
            <!-- Aquí puedes agregar el contenido que desees mostrar en la ventana modal -->
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabProfesionales que aceptaron la cotizacioncion">Profesionales que aceptaron la cotización</h4>
                <asp:HiddenField ID="HiddenField1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <h6>Profesionales que les interesa la cotización</h6>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="grrProfesional" runat="server" OnRowDataBound="grrProfesional_RowDataBound">
           
                        </asp:GridView>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


    <script>
        function openModal(idCotizacion) {
            // Asigna el valor del idCotizacion al HiddenField
            document.getElementById('<%= hfIdCotizacion.ClientID %>').value = idCotizacion;

            // Mostrar el valor del idCotizacion en el Label4
            document.getElementById('<%= Label4.ClientID %>').innerText = idCotizacion;

            // Forzar la actualización del UpdatePanel2
            document.getElementById('<%= UpdatePanel2.ClientID %>').update();

            // Abre la ventana modal
            const myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
            myModal.show();
        }
    </script>

</asp:Content>

