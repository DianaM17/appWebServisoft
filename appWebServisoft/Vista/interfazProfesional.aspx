<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterProfesional.Master" AutoEventWireup="true" CodeBehind="interfazProfesional.aspx.cs" Inherits="appWebServisoft.Vista.interfazProfecional" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Trabajos Disponibles</h3>
   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Repeater ID="repeaterListar" runat="server">
            <ItemTemplate>
                <div class="card-container col-6 col-sm-4 col-md-3 col-lg-2">
                    <div class="card-content">
                        <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("tituloServicio") %>'></asp:Label>
                        <h6>Descripción del trabajo</h6>
                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("descripcion") %>'></asp:Label>
                        <h6>Dirección</h6>
                        <asp:Label runat="server" ID="Label2" Text='<%# Eval("direccion") %>'></asp:Label>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="btnSolicitarTrabajo" runat="server" Text="Solicitar Trabajo" CssClass="boton-derecha" OnClientClick="mostrarMensaje(this.id); return false;" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </ContentTemplate>
</asp:UpdatePanel>


    
        <script type="text/javascript">
            function mostrarMensaje(btnId) {
                // Ocultar el botón específico
                document.getElementById(btnId).style.display = "none";

                // Mostrar el mensaje con el chulito para ese botón
                var mensaje = document.createElement("div");
                mensaje.innerHTML = "Trabajo solicitado &#10004;";
                mensaje.style.color = "green";
                mensaje.style.fontWeight = "bold";
                document.getElementById(btnId).parentNode.appendChild(mensaje);
            }
        </script>




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
}


.boton-derecha {
   
    top: 50%;
    right: 10px; /* Ajusta el valor según la posición deseada */
    transform: translateY(-50%);
}


    </style>
</asp:Content>
