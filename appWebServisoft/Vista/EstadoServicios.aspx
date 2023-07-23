<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="EstadoServicios.aspx.cs" Inherits="appWebServisoft.Vista.EstadoServicios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/e5246dcec8.js" crossorigin="anonymous"></script>
    <link href="Css/Estilos_EstadoServicio.css" rel="stylesheet" />

    <!-- Agrega la referencia de SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert@11/dist/sweetalert.min.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container mt-3">
       <asp:GridView ID="gvServicio" runat="server" DataKeyNames="idsolicitudServicio" AutoGenerateColumns="false" CssClass="table table-striped" OnRowDataBound="gvServicio_RowDataBound">
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
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true">
                            <ContentTemplate>
                              <asp:Button ID="btnOpenModal" runat="server" Text="Comentar" CommandName="AbrirVentanaModal" CommandArgument='<%# Eval("idsolicitudServicio") %>' OnClick="btnOpenModal_Click" />
                                <asp:Label ID="Label1" runat="server" Text="" CssClass="labelClass" Visible="false"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div id="gvServicioRow">
                            <asp:Button ID="btnCancelar" CssClass="btn third" runat="server" Text="Cancelar" OnClick="btnCancelar_Click" CommandArgument='<%# Eval("idsolicitudServicio") %>' />
                            <a href="#" class="btn third" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="setSelectedId('<%# Eval("idsolicitudServicio") %>')">Reprogramar</a>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>



    <%--Ventana Modal Comentarios--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:HiddenField ID="hdnSelectedRating" runat="server" Value="0" />
            <asp:HiddenField ID="hdnSelectedLevel" runat="server" Value="" />
            <asp:HiddenField ID="HiddenField2" runat="server" />
            <div class="modal" id="miModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button ID="btnCerrar" runat="server" CssClass="close" Text="&times;" onclick="btnCerrar_Click"/>

                            <h4 class="modal-title">Calificar y Comentar</h4>
                            <asp:Label ID="Label2" runat="server" Text="" Visible="false"></asp:Label>
                        </div>
                        <div class="modal-body">
                            <div id="rating-stars">
                                <input type="radio" id="star5" name="rating" value="5" data-rating="5" data-level="Excelente" onclick="captureRating(5, 'Excelente')">
                                <label for="star5"></label>
                                <input type="radio" id="star4" name="rating" value="4" data-rating="4" data-level="Muy Bueno" onclick="captureRating(4, 'Muy Bueno')">
                                <label for="star4"></label>
                                <input type="radio" id="star3" name="rating" value="3" data-rating="3" data-level="Bueno" onclick="captureRating(3, 'Bueno')">
                                <label for="star3"></label>
                                <input type="radio" id="star2" name="rating" value="2" data-rating="2" data-level="Regular" onclick="captureRating(2, 'Regular')">
                                <label for="star2"></label>
                                <input type="radio" id="star1" name="rating" value="1" data-rating="1" data-level="Malo" onclick="captureRating(1, 'Malo')">
                                <label for="star1"></label>
                            </div>
                            <form id="comment-form">
                                <asp:TextBox ID="txtComentario" runat="server" placeholder="Escribe tu comentario aquí"></asp:TextBox>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" OnClick="btnEnviar_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <style>
  .close {
    font-size: 20px;
    color: #fff; /* Puedes cambiar el color según tus necesidades */
    background-color: red; /* Puedes cambiar el color de fondo según tus necesidades */
    border: none;
    cursor: pointer;
    padding: 5px 10px;
  }
</style>

    <script>
        $(document).ready(function () {
            // Función para mostrar el modal y asignar el número de solicitud seleccionado
            function mostrarModal(solicitudId) {
                $('#miModal').modal('show'); // Mostrar el modal
                $('#hdnSelectedId').val(solicitudId); // Asignar el número de solicitud seleccionado al HiddenField
            }

            // Asignar el evento click al botón de abrir el modal
            $('[id*=gvServicio] [id*=btnOpenModal]').click(function () {
                var solicitudId = $(this).closest('tr').find('[id*=hdnServicioId]').val(); // Obtener el número de solicitud de servicio desde el HiddenField en la misma fila del botón
                mostrarModal(solicitudId); // Mostrar el modal y asignar el número de solicitud seleccionado
            });
        });
    </script>


    <%--Script Calificacion y Comentarios--%>
    <script>
        let selectedRating = 0;
        let selectedLevel = ""; // Variable para almacenar el nivel de calificación

        function captureRating(rating, level) {
            selectedRating = rating;
            selectedLevel = level; // Almacenar el nivel seleccionado
            document.getElementById('<%= hdnSelectedRating.ClientID %>').value = rating;
            document.getElementById('<%= hdnSelectedLevel.ClientID %>').value = level; // Almacenar el nivel seleccionado en el HiddenField
        }
    </script>

    <script>
        function setSelectedId(id) {
            document.getElementById('<%= hdnSelectedId.ClientID %>').value = id;
        }

        function mostrarModal(id) {
            setSelectedId(id);
            $('#miModal').modal('show');
        }

        function captureRating(rating, level) {
            document.getElementById('<%= hdnSelectedRating.ClientID %>').value = rating;
            document.getElementById('<%= hdnSelectedLevel.ClientID %>').value = level;
        }
    </script>





    <style>
        #rating-stars {
            direction: rtl;
            display: inline-block;
        }

            #rating-stars input[type="radio"] {
                display: none;
            }

            #rating-stars label {
                font-size: 24px;
                color: #ddd;
                cursor: pointer;
                padding: 5px;
            }

                #rating-stars label:before {
                    content: "\2605";
                }

            #rating-stars input[type="radio"]:checked ~ label {
                color: #ffcc00;
            }
    </style>

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

   <%-- <script>
        function mostrarModal() {
            $('#miModal').modal('show'); // miModal es el ID del elemento modal
        }

    </script>--%>
</asp:Content>
