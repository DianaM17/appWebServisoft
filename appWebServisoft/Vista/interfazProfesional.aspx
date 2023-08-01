<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterProfesional.Master" AutoEventWireup="true" CodeBehind="interfazProfesional.aspx.cs" Inherits="appWebServisoft.Vista.interfazProfecional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
    <asp:Label ID="lblUsuario" runat="server" Text="Label" Style="margin-right: 20px;" Visible="false"></asp:Label>
    <asp:Label ID="lblIdCategoria" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Repeater ID="repeaterListar" runat="server" OnItemDataBound="RepeaterListar_ItemDataBound">
        <ItemTemplate>
            <div class="card-container col-8 col-sm-6 col-md-4 col-lg-3">
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
                    <br />
                    <br />
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div class="boton-container">
                                <br />
                                <asp:Button ID="btnSolicitarTrabajo" runat="server" Text="Solicitar Trabajo" CssClass="boton-derecha" OnClick="BtnSolicitarTrabajo_Click" OnClientClick="return solicitarTrabajo();" />
                                  <asp:Label ID="lblChulito" runat="server" Text="&#10004;" CssClass="chulito" Visible="false"></asp:Label>
    <asp:Label ID="lblTextoSolicitado" runat="server" Text="Cotización Solicitada" CssClass="texto-solicitado" Visible="false"></asp:Label>
                           <asp:Button ID="btnCancelarSolicitud" runat="server" Text="Cancelar Solicitud" CssClass="boton-derecha1" onclick="btnCancelarSolicitud_Click" Visible="false" />
                                </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <asp:GridView ID="GridView1" runat="server" DataKeyNames="idsolicitudServicio"></asp:GridView>

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


    <style>
        .card-container {
       display: inline-block;
            margin: 40px;
            padding: 20px;
            background-color: #f0f0f0;
            box-sizing: border-box;
            border: 2px solid transparent; 
        }

        .card-container:hover{
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
    </style>


</asp:Content>
