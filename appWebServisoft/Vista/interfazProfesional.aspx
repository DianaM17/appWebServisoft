<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterProfesional.Master" AutoEventWireup="true" CodeBehind="interfazProfesional.aspx.cs" Inherits="appWebServisoft.Vista.interfazProfecional" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Trabajos Disponibles</h3>
    <asp:Label ID="lblUsuario" runat="server" Text="Label" style="margin-right: 20px;" Visible="false"></asp:Label>
            <asp:Label ID="lblIdCategoria" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Repeater ID="repeaterListar" runat="server">
    <ItemTemplate>
        <div class="card-container col-6 col-sm-4 col-md-3 col-lg-2">
            <div class="card-content">
                <asp:Label ID="lblIdCotizacion" runat="server" Text='<%# Eval("idCotizacion") %>' Visible="false"></asp:Label>

                <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("tituloServicio") %>'></asp:Label>
                <h6>Descripción del trabajo</h6>
                <asp:Label runat="server" ID="Label1" Text='<%# Eval("descripcion") %>'></asp:Label>
                <h6>Dirección</h6>
                <asp:Label runat="server" ID="Label2" Text='<%# Eval("direccion") %>'></asp:Label>
                <br />
                <br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server" ChildrenAsTriggers="true">
    <ContentTemplate>
        <div class="boton-container">
            <asp:Button ID="btnSolicitarTrabajo" runat="server" Text="Solicitar Trabajo" CssClass="boton-derecha" OnClick="BtnSolicitarTrabajo_Click" OnClientClick="return solicitarTrabajo();" />
            <span id="chulito" style="display: none;">&#10004;</span>
            <span id="textoSolicitado" style="display: none;">Solicitado</span>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

    <asp:GridView ID="GridView1" runat="server"></asp:GridView>


 
       <script>
           // Función para mostrar el chulito y el texto "Solicitado"
           function mostrarTrabajoSolicitado() {
               document.getElementById('chulito').style.display = 'inline';
               document.getElementById('textoSolicitado').style.display = 'inline';
               <%--document.getElementById('<%= btnSolicitarTrabajo.ClientID %>').style.display = 'none';--%>
           }
       </script>




    
   <%-- <script type="text/javascript">
        function mostrarMensaje(btnId) {
            // Ocultar el botón específico
            document.getElementById(btnId).style.display = "none";

            // Crear un nuevo elemento para el chulito
            var chulito = document.createElement("span");
            chulito.innerHTML = "&#10004;"; // Símbolo de chulito
            chulito.style.color = "green";
            chulito.style.fontWeight = "bold";

            // Mostrar el mensaje de "Trabajo solicitado"
            var mensaje = document.createElement("div");
            mensaje.innerHTML = "Trabajo solicitado";
            mensaje.style.color = "green";
            mensaje.style.fontWeight = "bold";
            mensaje.style.display = "inline-block";
            mensaje.style.marginLeft = "5px"; // Ajusta el margen izquierdo según sea necesario

            // Obtener el contenedor del botón
            var contenedor = document.getElementById(btnId).parentNode;

            // Agregar el chulito y el mensaje al contenedor específico
            contenedor.appendChild(chulito);
            contenedor.appendChild(mensaje);
        }--%>








    </script>

    <style>
       
    .card-container {
        width: calc(100% - 80px);
        margin: 40px;
        padding: 20px;
        background-color: #f0f0f0;
        box-sizing: border-box;
    }

    .card-content {
        width: 100%;
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
