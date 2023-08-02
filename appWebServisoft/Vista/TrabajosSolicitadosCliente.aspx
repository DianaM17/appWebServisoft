<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="TrabajosSolicitadosCliente.aspx.cs" Inherits="appWebServisoft.Vista.TrabajosSolicitadosCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <!-- Carga jQuery (asegúrate de ajustar la ruta si es necesario) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- CSS de Bootstrap (asegúrate de ajustar la ruta si es necesario) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- JS de Bootstrap (asegúrate de ajustar la ruta si es necesario) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

     <!-- Link to Bootstrap CSS -->
    <link rel="stylesheet" href="path/to/bootstrap.min.css">
    <!-- Link to your custom CSS file -->
    <link rel="stylesheet" href="path/to/styles.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <nav class="navbar">
    <div class="navbar-content">
        <h3>Cotizaciones Pendientes</h3>
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

    
    <asp:HiddenField ID="hfIdCotizacion" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Repeater ID="repeaterListar" runat="server">
                <ItemTemplate>
                <div class="card-container">
                    <div class="card-content">
                            <asp:Label runat="server" ID="Label3" Text='<%# Eval("idCotizacion") %>' Visible="false"></asp:Label>
                            
                        <asp:Label runat="server" ID="lblCategoria" class="lblCategoria" Text='<%# Eval("tituloServicio") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:Label runat="server" ID="Label1" class="Label1" Text='<%# Eval("descripcion") %>'></asp:Label>
                        <br />
                        <br />
                        <asp:Label runat="server" ID="Label2" class="Label2">
   
                            <img src="Imagenes/Iconos/Ubicacion.png" alt="Ubicación" class="icon-location-img" /> Dirección: <%# Eval("direccion") %>
                        </asp:Label>
                        <br />
                        <br />
                           <div class="reprogramar-link-container">
                                <asp:LinkButton runat="server" CssClass="reprogramar-link" CommandArgument='<%# Eval("idCotizacion") %>' OnClick="ReprogramarLinkButton_Click">Ver Profesionales</asp:LinkButton>
                            
                           </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </ContentTemplate>
    </asp:UpdatePanel>

<style>
   .container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

.card-container {
    max-width: 40%; /* Cambiar el valor de max-width para hacer los elementos más anchos */
    margin: 30px;
    padding: 30px;
    background-color: #f0f0f0;
    box-sizing: border-box; /* Incluir el margen dentro del ancho */
     
}

.card-container:hover {
    border-left: 5px solid pink; /* Puedes cambiar "pink" por el color que prefieras y ajustar el grosor del borde según tus necesidades */

}

.card-content {
    width: 100%;
    margin: 1px;
}

.lblCategoria{
     font-size: 30px;
    font-family: 'Segoe UI';
    color: #2C43B4;
    font-weight: bold; /* Aplicar negrita */
}

.Label1{
    font-size: 18px;
    font-family: 'Segoe UI';
    color: #000000;
}

.Label2{
    font-size: 20px;
    font-family: 'Segoe UI';
    color: #000000;
}

.reprogramar-link-container {
    display: flex;
    justify-content: flex-end; /* Align the link to the bottom-right of the container */
}

.reprogramar-link {
    font-size: 20px;
    font-family: 'Segoe UI';
    color: #2C43B4;
    font-weight: bold; /* Aplicar negrita */
}

    .icon-location-img {
        width: 30px;
        height: 30px;
        margin-right: 5px;
        vertical-align: middle;
    }


</style>


    <%--Ventana Modal Profecionales--%>
    <!-- Ventana Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" data-bs-onshown="openModal">
        <div class="modal-dialog modal-xl modal-dialog-centered">
            <!-- Agrega las clases "modal-xl" y "modal-dialog-centered" aquí -->
            <div class="modal-content">
                <!-- Aquí puedes agregar el contenido que desees mostrar en la ventana modal -->
                <div class="modal-header">
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="Label4" runat="server" Text="" Visible="false"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-body">
                    <div class="navbar-content">
                        <h6>Profesionales que les interesa la cotización</h6>
                    </div>
                    <div class="navbar-content">
                        <h5>Titulo del Servicio</h5>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="navbar-content">
                                <asp:Label ID="lblTituloServicio" class="lblTituloServicio" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <div class="content1">
                        <h5>Profesionales</h5>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grrProfesional" runat="server" OnRowDataBound="grrProfesional_RowDataBound" CssClass="gridview-con-espacio gridview-con-espacio-filas" BorderStyle="None">
                                <HeaderStyle CssClass="centrar-encabezados" />
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

    <style>

        h6 {
    margin: 5px; /* Asegúrate de que no haya margen que afecte el centrado */
    padding: 5px; /* Asegúrate de que no haya padding que afecte el centrado */
    color: #2C43B4;
    font-size: 25px;
    font-family: 'Segoe UI';
    font-weight: bold;
    /* Otros estilos para el título h3 */
}

        /* Add the blue line (bottom border) to the h6 element */
.navbar-content h6 {
    border-bottom: 2px solid blue;
    padding-bottom: 5px; /* Optional: Add some space between the text and the line */
}

  h5 {
    margin: 5px; /* Asegúrate de que no haya margen que afecte el centrado */
    padding: 5px; /* Asegúrate de que no haya padding que afecte el centrado */
    color: #2C43B4;
    font-size: 20px;

    font-family: 'Segoe UI';
    font-weight: bold;
    /* Otros estilos para el título h3 */
}

  .lblTituloServicio{
       margin: 5px; /* Asegúrate de que no haya margen que afecte el centrado */
    padding: 5px; /* Asegúrate de que no haya padding que afecte el centrado */
    color: #080A13;
    font-size: 20px;
    font-family: 'Segoe UI';
    font-weight: bold;
  }

        .gridview-con-espacio td {
            padding: 10px; /* Ajusta el valor para el espaciado deseado */
        }

         .gridview-con-espacio-filas tr {
        margin-bottom: 8px; /* Ajusta el valor para el espaciado vertical deseado */
    }

         
</style>

    <style>
        /* Customize the modal content */
.modal-content {
    background-color: #f1f1f1; /* Change the background color */
    border: 2px solid #ccc; /* Add a border around the modal */
    border-radius: 10px; /* Round the corners of the modal */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Add a box shadow */
    
}

/* Customize the modal header */
.modal-header {
    background-color: #007bff; /* Change the header background color */
    color: #fff; /* Change the header text color */
}

/* Customize the modal body */
.modal-body {
    padding: 20px; /* Add some padding to the modal body */
}

/* Customize the modal footer */
.modal-footer {
    background-color: #f9f9f9; /* Change the footer background color */
}

/* Customize the close button */
.btn-default {
    background-color: #ccc; /* Change the button background color */
    color: #fff; /* Change the button text color */
    border: none; /* Remove the button border */
    border-radius: 5px; /* Round the button corners */
}

/* Agrega una punta triangular en el lado izquierdo */
.modal-dialog {
    position: relative;
    max-width: 600px; /* Set the maximum width to your desired value */
    margin-left: auto; /* Ajusta este valor para posicionar la ventana modal más a la izquierda */
    margin-right: 200px; /* Asegúrate de que el margen derecho sea automático para mantener la alineación central */
}


/* Crea el triángulo apuntando hacia afuera */
.modal-dialog::before {
    content: "";
    position: absolute;
    bottom: 26%;
    left: -20px; /* Ajusta este valor según el tamaño y la posición horizontal del triángulo */
    border-width: 10px 0 10px 20px; /* Ajusta el tamaño del triángulo */
    border-style: solid;
    border-color: transparent transparent transparent #f1f1f1; /* Ajusta el color del triángulo */
    transform: rotate(180deg); /* Rota el triángulo para que apunte hacia afuera */
}

.gridview-con-espacio-filas td {
  font-family: Segoe UI, sans-serif; /* Cambia la fuente del texto */
  font-size: 16px; /* Cambia el tamaño del texto */
   font-weight: bold;
}
    </style>

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

