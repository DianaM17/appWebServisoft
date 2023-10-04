<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="perfilCliente.aspx.cs" Inherits="appWebServisoft.Vista.perfilCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="Css/app.css" rel="stylesheet" />
    <link href="Css/Estilos_PerfilProfesional.css" rel="stylesheet" />
    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.css">

    <!-- STYLE CSS -->
    <link href="Css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div runat="server">
        <div style="display: block; background: white;"">
            <section class="seccion-perfil-usuario container">
                <asp:Label ID="lblidCliente" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="lblTelCliente" runat="server" Visible="false"></asp:Label>
                <div class="perfil-usuario-header" style="background: linear-gradient(#e75f6c, transparent)">
                    <div class="perfil-usuario-portada">
                        <div class="perfil-usuario-avatar">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Image CssClass="imagenes" runat="server" ID="ImgPerfill" Height="150px" Width="1560px"/>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <%--<asp:FileUpload ID="cambiarImg" runat="server" onchange="imagen(this)" />--%>
                            <input type="file" id="imagenImput" runat="server" accept="image/**" style="display: none;">
                            <button type="button" class="boton-avatar" onclick="seleccionarImagenn()">
                                <i class="far fa-image"></i>
                            </button>
                            <asp:Button ID="btnGuardarImg" runat="server" Text="Button" OnClick="btnGuardarImg_Click" Style="display: none;" />
                            <script>
                                function seleccionarImagenn() {
                                    var input = document.getElementById('<%= imagenImput.ClientID%>');
                                    console.log("Imagen selecionada");
                                    input.click();
                                }

                                // Manejar el cambio de imagen seleccionada
                                var input = document.getElementById('<%= imagenImput.ClientID%>');
                                input.addEventListener('change', function () {
                                    var imagen = input.files[0];
                                    var btnGuardarImg = document.getElementById('<%= btnGuardarImg.ClientID%>');
                                    console.log("imagen para guardar");
                                    if (imagen) {
                                        var reader = new FileReader();

                                        reader.onload = function (e) {
                                            var imagenSeleccionada = e.target.result;

                                            // Asignar la URL de la imagen seleccionada al control ImgPerfil
                                            var imgPerfil = document.getElementById('<%= ImgPerfill.ClientID %>');
                                            imgPerfil.src = imagenSeleccionada;
                                            console.log("imagen guardada");
                                        }

                                        reader.readAsDataURL(imagen);
                                    }
                                    btnGuardarImg.click();
                                });
                            </script>
                        </div>
                        <button type="button" class="btn btn-primary boton-portada" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <i class="bi bi-pencil-square"></i>Editar Perfil
                        </button>
                    </div>
                </div>
                <div class="perfil-usuario-body">
                    <div class="perfil-usuario-bio">
                        <asp:Label ID="lblNombre" runat="server" CssClass="titulo"></asp:Label>
                        <asp:Label ID="lblPerfil" runat="server" CssClass="texto"></asp:Label>
                    </div>
                    <div class="perfil-usuario-footer">
                        <ul class="lista-datos">
                            <li><i class="icono fas fa-map-signs"></i>Direccion de usuario:
                                <asp:Label ID="lblDireccion" runat="server"></asp:Label></li>
                            <li><i class="icono fas fa-phone-alt"></i>Telefono:
                                <asp:Label ID="lblTelefono" runat="server"></asp:Label></li>
                            <li><i class="icono fas fa-envelope"></i>Email:
                                <asp:Label ID="lblEmail" runat="server"></asp:Label></li>
                            <li><i class="icono fas fa-map-marker-alt"></i>Ciudad:
                                <asp:Label ID="lblCiudad" runat="server"></asp:Label></li>

                        </ul>
                        <ul class="lista-datos">
                            <li><i class="icono fas fa-share-alt"></i>Redes sociales.</li>
                        </ul>
                    </div>

                </div>
            </section>

            <!-- The Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="width: 800px; height: 600px">
                        <%--cerrar--%>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="margin-left: 760px; margin-top: 6px"></button>
                        <div class="wrapper">
                            <div action="">
                                <div id="wizard">
                                    <!-- SECTION 1 -->
                                    <h4></h4>
                                    <section>
                                        <div class="form-header">
                                            <div class="avartar">
                                                <a href="#">
                                                    <asp:Image CssClass="imagenes" runat="server" ID="ImgPerfil1" />
                                                </a>
                                                <div class="avartar-picker">
                                                    <input type="file" name="file-1[]" id="file-1" class="inputfile" data-multiple-caption="{count} files selected" multiple />
                                                    <label for="file-1">
                                                        <i class="zmdi zmdi-camera"></i>
                                                        <%--<span>Choose Picture</span>--%>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="form-holder active">
                                                    <input id="txtNombre" name="txtNombre" type="text" placeholder="Nombres" class="form-control" runat="server" />
                                                </div>
                                                <div class="form-holder">
                                                    <input id="txtApellido" name="txtApellido" type="text" placeholder="Apellidos" class="form-control" runat="server" />
                                                </div>
                                                <div class="form-row">
                                                    <div class="form-holder">
                                                        <input id="txtDireccionC" name="txtDireccion" type="text" placeholder="Direccion" class="form-control" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-holder">
                                            <input id="txtTelefonoC" name="txtTelefonoC" type="text" placeholder="Telefono" class="form-control" runat="server" />
                                        </div>
                                        <div class="form-holder">
                                            <input id="txtEmailC" name="txtEmailC" type="text" placeholder="Email" class="form-control" runat="server" disabled/>
                                        </div>
                                        <div class="form-holder">
                                            <input id="txtPasswordC" name="txtPasswordC" type="password" placeholder="Contraseña" class="form-control" runat="server" />
                                        </div>
                                    </section>

                                    <!-- SECTION 3 -->
                                    <h4></h4>
                                    <section>
                                        <div class="form-row">
                                            <div class="form-holder">
                                                <asp:DropDownList ID="ddlCiudad" runat="server" class="form-control"></asp:DropDownList>
                                                <%--<input type="text" placeholder="Country" class="form-control">--%>
                                            </div>
                                        </div>
                                        <asp:Button ID="btnGuardar" CssClass="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click1" />
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <style>
            .form-header{
                margin-bottom: -20PX;
            }

          .btnGuardar {
    border: none;
    background-color: #aac1f0;
    color: white;
    font-family: 'Sans Serif Collection';
    font-size: 16px;
    height: 45px;
    width: 140px;
    border-radius: 20px; /* La mitad del valor del ancho para hacerlo redondo */
    position: absolute; /* Establece la posición absoluta */
    top: 153px; /* Ajusta la posición vertical hacia abajo */
    right: 90px; /* Ajusta la posición a la derecha */
    z-index: 999; /* Asegura que se superponga sobre otros elementos */
}

.btnGuardar:hover {
    background-color: #98add6;
}

        </style>
   

        <asp:Button ID="btn" runat="server" OnClick="btn_Click" />

        <script src="js/jquery-3.3.1.min.js"></script>

        <!-- JQUERY STEP -->
        <script src="Js/app.js"></script>
        <script src="Js/jquery.steps.js"></script>
        <script src="Js/main.js"></script>
        <script src="Js/theme-map.js"></script>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    </div>
</asp:Content>
