<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterProfesional.Master" AutoEventWireup="true" CodeBehind="interfazProfesional.aspx.cs" Inherits="appWebServisoft.Vista.interfazProfecional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-o8PzrEX2TAtKfG69ho/S3PvosKYYg3sMwQcov3a7oIE=" crossorigin="anonymous"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <nav class="navbar">
        <div class="navbar-content">
            <h3>Cotizaciones Disponibles</h3>
        </div>
    </nav>

    <style>
        .navbar {
            background-color: #E3E3E3; /* Estilos para la barra de navegación, como colores de fondo, altura, etc. */
            height: 100px; /* Ajusta la altura según tus necesidades */
        }

        .navbar-content {
            display: flex;
            align-items: center;
            justify-content: center; /* Centrar horizontalmente */
            height: 100%; /* Asegúrate de que el contenedor tenga el 100% de altura del padre */
            width: 100%; /* Asegúrate de que el contenedor tenga el 100% de ancho del padre */
        }

        h3 {
            margin: 5px; /* Asegúrate de que no haya margen que afecte el centrado */
            padding: 5px; /* Asegúrate de que no haya padding que afecte el centrado */
            font-size: 45px;
            font-family: 'Segoe UI';
            /* Otros estilos para el título h3 */
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3O+6WOoHFiQz1Uph6u8iB1pMnqzu1mGbgwyOBk=" crossorigin="anonymous"></script>


    <asp:Label ID="lblUsuario" runat="server" Text="Label" Style="margin-right: 20px;" Visible="false"></asp:Label>
    <asp:Label ID="lblIdCategoria" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

 
    <div class="container">
        <div class="row justify-content-center">
            <asp:Repeater ID="repeaterListar" runat="server" OnItemDataBound="RepeaterListar_ItemDataBound">
                <ItemTemplate>
                    <div class="col-sm-6 col-md-6 col-lg-6">
                        <div class="card-content">
                            <asp:Label ID="lblIdCotizacion" runat="server" Text='<%# Eval("idCotizacion") %>' Visible="false"></asp:Label>
                            <div class="card1-container1">
                                <asp:Label runat="server" ID="lblCategoria" class="lblCategoria centrar-texto" Text='<%# Eval("tituloServicio") %>'></asp:Label>
                                <!-- Resto del contenido de la tarjeta -->
                            </div>
                            <br />
                            <asp:Label runat="server" ID="Label1" CssClass="Label1" Text='<%# Eval("descripcion") %>'></asp:Label>
                            <br />
                            <br />
                            <asp:Label runat="server" ID="Label2" class="Label2">
                    <img src="Imagenes/Iconos/Ubicacion.png" alt="Ubicación" class="icon-location-img" /> Dirección: <%# Eval("direccion") %>
                            </asp:Label>
                            <div class="boton-container">
                                <br />
                                <br />
                                <asp:UpdatePanel runat="server" ID="updPanel2" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Button ID="btnSolicitarTrabajo" runat="server" Text="Solicitar Trabajo" CssClass="boton-derecha"
                                            OnClick="BtnSolicitarTrabajo_Click" OnClientClick="solicitarTrabajo(<%# Container.ItemIndex %>); return false;"
                                            CommandArgument='<%# Eval("idCotizacion") %>' />
                                        <asp:Label ID="lblChulito" runat="server" Text="&#10004;" CssClass="chulito" Visible="false"></asp:Label>
                                        <asp:Label ID="lblTextoSolicitado" runat="server" Text="Cotización Solicitada" CssClass="texto-solicitado" Visible="false"></asp:Label>
                                        <asp:Button ID="btnCancelarSolicitud" runat="server" Text="Cancelar Solicitud" CssClass="boton-derecha1" OnClick="btnCancelarSolicitud_Click" Visible="false" />
                                        <!-- Agregar el Label fuera del Repeater -->
                                        <asp:Label ID="lblIdSeleccionCotizacion" runat="server" Text="" Visible="false"></asp:Label>

                                        </div>
                                  </div>
                             </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                     
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>



    <asp:UpdatePanel ID="updatePanelGridView" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="gridViewDatos" runat="server" AutoGenerateColumns="False" Visible="false"> 
                <Columns>
                    <asp:BoundField DataField="idSeleccionCotizacion" HeaderText="idSeleccionCotizacion" />
                    <asp:BoundField DataField="seleccionProfesional" HeaderText="seleccionProfesional" />
                    <asp:BoundField DataField="idProfesional" HeaderText="idProfesional" />
                    <asp:BoundField DataField="idCotizacion" HeaderText="idCotizacion" />
                </Columns>
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="timerActualizar" EventName="Tick" />
        </Triggers>
    </asp:UpdatePanel>

    <asp:Timer ID="timerActualizar" runat="server" Interval="1000" OnTick="timerActualizar_Tick"></asp:Timer>

              
      
    <style>
        .chulito {
    font-size: 24px;
    color: green;
}

.texto-solicitado {
    font-size: 14px;
    color: green;
}

         </style>

    <script>
        // Función para mostrar el chulito y el texto "Solicitado"
        function mostrarTrabajoSolicitado() {
            document.getElementById('chulito').style.display = 'inline';
            document.getElementById('textoSolicitado').style.display = 'inline';
               <%--document.getElementById('<%= btnSolicitarTrabajo.ClientID %>').style.display = 'none';--%>
        }
    </script>

    <style>
   .custom-card {
        margin-top: 40px; /* Ajusta la cantidad de margen superior según tus preferencias */
    }

.card-content {
    margin-top: 20px;
   border-bottom: 50px;
            padding: 30px;
            background-color: #f0f0f0;
            box-sizing: border-box;
            border: 2px solid transparent; 
}

     

        .card-content:hover{
             border-color:#2C43B4;
        }


        .boton-container {
            
            position: relative;
        }

        .card1-container1{
text-align: center;
        }

      .lblCategoria {
        font-size: 20px;
        font-family: 'Segoe UI';
        color: #2C43B4;
        font-weight: bold; /* Aplicar negrita */
        text-align: center;
    }

.Label1{
    font-size: 18px;
    font-family: 'Segoe UI';
    color: #000000;
}

.Label2{
    font-size: 17px;
    font-family: 'Segoe UI';
    color: #000000;
    font-weight: bold; /* Aplicar negrita */
}
    .icon-location-img {
        width: 30px;
        height: 30px;
        margin-right: 5px;
        vertical-align: middle;
    }


         .boton-derecha {
             position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            border: none;
            font-family: "Times New Roman", Times, serif; /* Fuente Times New Roman */
            font-size: 20px;
            background-color: #f44336;
            width: 150px;
            height: 40px;
            border-radius: 15px;
        }

            .boton-derecha:hover {
                background-color: #b01b1b;
            }

             .boton-derecha1 {
             position: absolute;
            top: 80%;
            right: -15px;
            transform: translateY(-50%);
            border: none;
            font-family: "Times New Roman", Times, serif; /* Fuente Times New Roman */
            font-size: 15px;
            background-color: #f44336;
            width: 150px;
            height: 30px;
            border-radius: 15px;
        }

            .boton-derecha1:hover {
                background-color: #b01b1b;
            }


        .boton-container {
            position: relative;
        }

        .boton-derecha {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
        }
    </style>

</asp:Content>
