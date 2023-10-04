<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterProfesional.Master" AutoEventWireup="true" CodeBehind="TabTrabajosPen.aspx.cs" Inherits="appWebServisoft.Vista.TabTrabajosPen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Estilos_DataTables.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <script src="Js/jquery-3.6.0.js"></script>
    <script src="Js/tablaAprendices.js"></script>
    <script src="Js/bootstrap.bundle.js"></script>
    <script src="Js/bootstrap.min.js"></script>
    <script src="SweetAlert/Scripts/sweetalert.min.js"></script>
    <link href="SweetAlert/Styles/sweetalert.css" rel="stylesheet" />
    <link href="css/Input.css" rel="stylesheet" />

    <script src="JavaScript/sweetalert-dev.js"></script>
    <link href="css/sweetalert.css" rel="stylesheet" />
    <script src="JavaScript/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="form1" runat="server">
        <div class="container my-2" style="margin-left: 380px; width: 40%;">
            <div class="row flex-shrink-1" style="margin-top: 50px;">
                <table id="DataTableTrabajosP" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Descripcion</th>
                            <th>Ubicacion</th>
                            <th>Ciudad</th>
                            <th>Nombre Cliente</th>
                            <th>Telefono Cliente</th>
                            <th>Estado</th>
                            <th>Opc</th>
                            
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
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
    <asp:HiddenField ID="hdnSelectedId" runat="server" />
    <script>
        function setSelectedId(id) {
            document.getElementById('<%= hdnSelectedId.ClientID %>').value = id;
        }
    </script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</asp:Content>
