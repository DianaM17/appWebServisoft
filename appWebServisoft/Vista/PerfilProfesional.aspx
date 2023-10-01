<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterProfesional.Master" AutoEventWireup="true" CodeBehind="perfilProfesional.aspx.cs" Inherits="appWebServisoft.Vista.perfilProfesional1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil Profesional</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"/>
    <link href="Css/app.css" rel="stylesheet" />
    <link href="Css/Estilos_PerfilProfesional.css" rel="stylesheet" />
    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.css">

    <!-- STYLE CSS -->
    <link href="Css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="display: block">
        <section class="seccion-perfil-usuario container">
            <asp:Label ID="lblTeleProf" runat="server" Visible="false"></asp:Label>
            <div class="perfil-usuario-header">
                <div class="perfil-usuario-portada">
                    <div class="perfil-usuario-avatar">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Image CssClass="imagenes" runat="server" ID="ImgPerfil" Height="150px" Width="1560px" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%--<asp:FileUpload ID="cambiarImg" runat="server" onchange="imagen(this)" />--%>
                        <input type="file" id="ImagenInputT" runat="server" accept="image/**" style="display: none;">
                        <button type="button" class="boton-avatar" onclick="seleccionarImagen()">
                            <i class="far fa-image"></i>
                        </button>
                        <asp:Button ID="btnGuardarImg" runat="server" Text="Button" OnClick="btnGuardarImg_Click" Style="display: none;" />
                        <script>
                            function seleccionarImagen() {
                                var input = document.getElementById('<%= ImagenInputT.ClientID%>');
                                input.click();
                            }

                            // Manejar el cambio de imagen se leccionada
                            var input = document.getElementById('<%= ImagenInputT.ClientID%>');
                            input.addEventListener('change', function () {
                                var imagen = input.files[0];
                                var btnGuardarImg = document.getElementById('<%= btnGuardarImg.ClientID%>');

                                if (imagen) {
                                    var reader = new FileReader();

                                    reader.onload = function (e) {
                                        var imagenSeleccionada = e.target.result;

                                        // Asignar la URL de la imagen seleccionada al control ImgPerfil
                                        var imgPerfil = document.getElementById('<%= ImgPerfil.ClientID %>');
                                        imgPerfil.src = imagenSeleccionada;
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
                    <style>
                        /* The switch - the box around the slider */
                        .switch {
                            font-size: 17px;
                            position: relative;
                            display: inline-block;
                            width: 3.5em;
                            height: 2em;
                        }

                            /* Hide default HTML checkbox */
                            .switch input {
                                opacity: 0;
                                width: 0;
                                height: 0;
                            }

                        /* The slider */
                        .slider {
                            position: absolute;
                            cursor: pointer;
                            top: 0;
                            left: 0;
                            right: 0;
                            bottom: 0;
                            background-color: #fff;
                            border: 1px solid #adb5bd;
                            transition: .4s;
                            border-radius: 30px;
                        }

                            .slider:before {
                                position: absolute;
                                content: "";
                                height: 1.4em;
                                width: 1.4em;
                                border-radius: 20px;
                                left: 0.27em;
                                bottom: 0.25em;
                                background-color: #adb5bd;
                                transition: .4s;
                            }

                        input:checked + .slider {
                            background-color: #007bff;
                            border: 1px solid #007bff;
                        }

                        input:focus + .slider {
                            box-shadow: 0 0 1px #007bff;
                        }

                        input:checked + .slider:before {
                            transform: translateX(1.4em);
                            background-color: #fff;
                        }
                    </style>
                    <label class="switch">
                        <%-- <asp:CheckBox ID="chkEstado" runat="server" CssClass="input" AutoPostBack="True" OnCheckedChanged="chkEstado_CheckedChanged" />--%>
                        <input type="checkbox" id="chkEstado" onchange="chkEstadoChanged()" />
                        <span class="slider"></span>
                    </label>
                </div>
            </div>
            <script>
                function chkEstadoChanged() {
                    var chkEstado = document.getElementById("chkEstado");
                    var isChecked = chkEstado.checked;

                    // Realiza una solicitud AJAX al servidor
                    $.ajax({
                        type: "POST",
                        url: "perfilProfesional.aspx/CambiarEstado",
                        data: JSON.stringify({ isChecked: isChecked, idProfesional: '<%= Session["idProfesional"] %>' }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            // Maneja la respuesta del servidor
                            console.log("Estado enviado al servidor con éxito.");
                        },
                        error: function () {
                            // Maneja errores en la solicitud AJAX
                            console.log("Error al enviar el estado al servidor.");
                        }
                    });
                }
            </script>
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
                        <li><i class="icono fas fa-briefcase"></i>Trabaja en:
                                <asp:Label ID="lblServicio" runat="server"></asp:Label></li>

                    </ul>
                    <ul class="lista-datos">
                        <li><i class="icono fas fa-building"></i>Categoria:
                                <asp:Label ID="lblCategoria" runat="server"></asp:Label></li>
                        <li><i class="icono fas fa-map-marker-alt"></i>Ciudad:
                                <asp:Label ID="lblCiudad" runat="server"></asp:Label></li>
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <li><i class="icono fas fa-user-check"></i>Estado:
                                <asp:Label ID="lblEstado" runat="server"></asp:Label></li>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <li><i class="icono fas fa-share-alt"></i>Redes sociales.</li>
                    </ul>
                </div>
                
            </div>
        </section>
        <section class="container">
            <br />
            <br />
            <%--inicio galeria--%>

            <div class="row">
                <asp:Repeater ID="RptImagenes" runat="server">
                    <ItemTemplate>
                        <div class="col-12 col-sm-4 col-md-3 ">
                            <ul class="ul">
                                <li class="li">
                                    <a href="#" class="a custom-link" title="Imagen 1">
                                        <asp:Image CssClass="img" runat="server" ID="ImgCate" ImageUrl='<%# Eval("imagen") %>' Height="150px" Width="1560px" />
                                        <%--<img src="assets/1.jpg" alt="Imagen 1" class="img" loading="lazy">--%>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="lightbox">
                <button class="cerrar">Cerrar</button>
                <img src="Carrusel/assets/1.jpg" alt="Imagen 1" class="grande" loading="lazy">
            </div>

            <script>
                function initializeGallery() {
                    const enlaces = document.querySelectorAll('.custom-link');
                    const lightbox = document.querySelector('.lightbox');
                    const grande = document.querySelector('.grande');
                    const cerrar = document.querySelector('.cerrar');

                    enlaces.forEach((cadaEnlace) => {
                        cadaEnlace.addEventListener('click', (e) => {
                            e.preventDefault();
                            let ruta = cadaEnlace.querySelector('.img').src;
                            console.log(ruta);

                            lightbox.classList.add('activo');
                            grande.setAttribute('src', ruta);
                        });
                    });

                    cerrar.addEventListener('click', (e) => {
                        e.preventDefault(); // Evita que la página se recargue al cerrar la lightbox
                        lightbox.classList.remove('activo');
                        // Vuelve a inicializar la galería cada vez que se cierra la lightbox
                        initializeGallery();
                    });
                }

                document.addEventListener('DOMContentLoaded', () => {
                    initializeGallery();
                });
            </script>

        </section>
        <!--====  End of html  ====-->

        <%-- Botón Agrgar Imagen --%>
        <a class="cssbuttons-io-button" data-bs-toggle="modal" data-bs-target="#myModal">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                <path fill="none" d="M0 0h24v24H0z"></path><path fill="currentColor" d="M11 11V5h2v6h6v2h-6v6h-2v-6H5v-2z"></path></svg>
            <span>Add</span>
        </a>

        <!-- The Modal -->
        <div class="modal" id="myModal">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="containerS">
                        <div>
                            <label for="arquivo">Agregar Imagen:</label>
                            <asp:FileUpload ID="FluImagenTrab" runat="server" class="inpdddut" />
                            <%--<input accept=".jpg, .jpeg, .png, .gif, .pdf"  name="arquivo" id="arquivo" type="file">--%>
                            <input value="Agregar" type="submit" class="inpdddut" id="btnAgregarImagen" name="btnAgregarImagen" runat="server" onserverclick="btnAgregarImagen_ServerClick">
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                                    <asp:Label ID="lblIdProfesional" runat="server" Text="Label" Visible="false"></asp:Label>
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
                                                <input id="txtNombres" name="txtNombres" type="text" placeholder="Nombres" class="form-control" runat="server" />
                                            </div>
                                            <div class="form-holder">
                                                <input id="txtApellidos" name="txtApellidos" type="text" placeholder="Apellidos" class="form-control" runat="server" />
                                            </div>
                                            <div class="form-holder">
                                                <input id="txtTelefono" name="txtTelefono" type="text" placeholder="Telefono" class="form-control" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-holder">
                                        <input id="txtEmail" name="txtEmail" type="text" placeholder="Email" class="form-control" runat="server" />
                                    </div>
                                    <div class="form-holder">
                                        <input id="txtPassword" name="txtPassword" type="text" placeholder="Contraseña" class="form-control" runat="server" />
                                    </div>
                                </section>
                                <!-- SECTION 3 -->
                                <h4></h4>
                                <section>
                                    <div class="form-row">
                                        <div class="form-holder">
                                            <input id="txtDireccion" name="txtDireccion" type="text" placeholder="Direccion" class="form-control" runat="server" />
                                        </div>
                                        <div class="form-holder">
                                            <input id="txtPerfil" name="txtPerfil" type="text" placeholder="Perfil profesional" class="form-control" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <div class="form-holder">
                                                    <asp:DropDownList ID="ddlCategoria" runat="server" class="form-control" style="width: 200px" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
                                                    <%--<input type="text" placeholder="City" class="form-control">--%>
                                                </div>
                                                <div class="form-holder">
                                                    <asp:DropDownList ID="ddlServicio" runat="server" class="form-control" style="width: 200px"></asp:DropDownList>
                                                    <%--<input type="text" placeholder="Country" class="form-control">--%>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <div class="form-holder">
                                            <asp:DropDownList ID="ddlCiudad" runat="server" class="form-control" style="width: 200px"></asp:DropDownList>
                                            <%--<input type="text" placeholder="Country" class="form-control">--%>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnGuardar" CssClass="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
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
    top: 290px; /* Ajusta la posición vertical hacia abajo */
    right: 90px; /* Ajusta la posición a la derecha */
    z-index: 999; /* Asegura que se superponga sobre otros elementos */
}

.btnGuardar:hover {
    background-color: #98add6;
}
        </style>

    <script src="js/jquery-3.3.1.min.js"></script>

    <!-- JQUERY STEP -->
    <script src="Js/app.js"></script>
    <script src="Js/jquery.steps.js"></script>
    <script src="Js/main.js"></script>
    <script src="Js/theme-map.js"></script>
</asp:Content>
        
