<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerfilProfesional.aspx.cs" Inherits="appWebServisoft.Vista.PerfilProfesional" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apock web design</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <link href="Css/app.css" rel="stylesheet" />
    <link href="Css/Estilos_PerfilProfesional.css" rel="stylesheet" />
    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.css">

    <!-- STYLE CSS -->
    <link href="Css/style.css" rel="stylesheet" />
</head>

<body>
    <form runat="server">
        <div style="display: block">
            <section class="seccion-perfil-usuario container">
                <asp:Label ID="lblTeleProf" runat="server" Visible="false"></asp:Label>
                <div class="perfil-usuario-header">
                    <div class="perfil-usuario-portada">
                        <div class="perfil-usuario-avatar">
                            <asp:Image CssClass="imagenes" runat="server" ID="ImgPerfil" />
                            <%--<asp:FileUpload ID="cambiarImg" runat="server" onchange="imagen(this)" />--%>
                            <input type="file" id="imagenInput" runat="server" accept="image/**" style="display: none;">
                            <button type="button" class="boton-avatar" onclick="seleccionarImagen()">
                                <i class="far fa-image"></i>
                            </button>
                            <script>
                                function seleccionarImagen() {
                                    var input = document.getElementById('imagenInput');
                                    input.click();
                                }

                                // Manejar el cambio de imagen seleccionada
                                var input = document.getElementById('imagenInput');
                                input.addEventListener('change', function () {
                                    var imagen = input.files[0];

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
                                });
                                //function procesarArchivo() {
                                //    // Obtener el elemento de entrada de archivos
                                //    var input = document.getElementById('imagenInput');

                                //    // Verificar si se seleccionó un archivo
                                //    if (input.files.length > 0) {
                                //        var archivo = fileInput.files[0];

                                //        console.log('Se seleccionó el archivo: ' + archivo.name);

                                //        // Aquí puedes llamar a una función adicional para procesar el archivo, si es necesario
                                //        // procesarArchivoAdicional(archivo);
                                //    }
                                //}

                               <%-- function imagen(imput) {
                                    console.log('cargo');
                                    if (imput.files && imput.files[0]) {
                                        console.log('tiene');
                                        var img = new FileReader();
                                        img.onload = function (e) {
                                            console.log('Entro');
                                            document.getElementById("<%=ImgPerfil.ClientID%>").src = e.target.result;

                                        }
                                        img.readAsDataURL = imput.files[0];
                                    }
                                }


                                function SeleccionarImagen() {
                                    document.getElementById("<%=cambiarImg.ClientID%>").click();
                                    return false;
                                }--%>

                            </script>
                        </div>
                        <button type="button" class="btn btn-primary boton-portada" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <i class="bi bi-pencil-square"></i>Editar Perfil
                        </button>
                        <label class="switch">
                            <asp:CheckBox ID="chkEstado" runat="server" AutoPostBack="True" OnCheckedChanged="chkEstado_CheckedChanged" />
                            <%--<input type="checkbox">--%>
                            <span class="slider"></span>
                        </label>
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
                            <li><i class="icono fas fa-briefcase"></i>Trabaja en:
                                <asp:Label ID="lblServicio" runat="server"></asp:Label></li>

                        </ul>
                        <ul class="lista-datos">
                            <li><i class="icono fas fa-building"></i>Categoria:
                                <asp:Label ID="lblCategoria" runat="server"></asp:Label></li>
                            <li><i class="icono fas fa-map-marker-alt"></i>Ciudad:
                                <asp:Label ID="lblCiudad" runat="server"></asp:Label></li>
                            <li><i class="icono fas fa-user-check"></i>Estado:
                                <asp:Label ID="lblEstado" runat="server"></asp:Label></li>
                            <li><i class="icono fas fa-share-alt"></i>Redes sociales.</li>
                        </ul>
                    </div>
                    <div class="redes-sociales">
                        <a href="#" class="boton-redes facebook fab fa-facebook-f"><i class="icon-facebook"></i></a>
                        <a href="#" class="boton-redes twitter fab fa-twitter"><i class="icon-twitter"></i></a>
                        <a href="#" class="boton-redes instagram fab fa-instagram"><i class="icon-instagram"></i></a>
                    </div>
                </div>
            </section>
            <section class="container">
                <br />
                <br />
                <%--inicio galeria--%>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <ul class="ul">
                            <li class="li">
                                <a href="#" class="a" title="Imagen 1">

                                    <asp:Image CssClass="img" runat="server" ID="ImgTrabajos" />
                                    <%--<img src="assets/1.jpg" alt="Imagen 1" class="img" loading="lazy">--%>
                                </a>
                            </li>
                            <%--                    <li class="li">
                        <a href="#" class="a" title="Imagen 2">
                            <img src="assets/2.jpg" alt="Imagen 2" class="img" loading="lazy">
                        </a>
                    </li>
                    <li class="li">
                        <a href="#" class="a" title="Imagen 3">
                            <img src="assets/3.jpg" alt="Imagen 3" class="img" loading="lazy">
                        </a>
                    </li>--%>
                        </ul>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="lightbox">
                    <button class="cerrar">Cerrar</button>
                    <img src="Carrusel/assets/1.jpg" alt="Imagen 1" class="grande" loading="lazy">
                </div>
            </section>
            <!--====  End of html  ====-->

            <input type="file" id="imgTrabajo" accept="image/**" style="display: none;" />
            <button class="button" data-bs-toggle="modal" data-bs-target="#myModal">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" viewBox="0 0 20 20" height="20" fill="none" class="svg-icon">
                    <g stroke-width="1.5" stroke-linecap="round" stroke="#de8a2a">
                        <circle r="7.5" cy="10" cx="10"></circle>
                        <path d="m9.99998 7.5v5"></path>
                        <path d="m7.5 9.99998h5"></path>
                    </g></svg>
                <span class="lable">Add</span>
            </button>

            <!--====  End of tarjeta  ====-->

            <%--Ventana modal Agregar Imagenes de trabajos--%>

            <!-- The Modal -->
            <div class="modal" id="myModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
                        <div class="containerS">
                            <div>
                                <label for="arquivo">Choose a file:</label>
                                <asp:FileUpload ID="FluImagen" runat="server" class="inpdddut" />
                                <asp:Button ID="btnAgregarImagen" runat="server" Text="Agregar" OnClick="btnAgregarImagen_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>

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
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <div class="form-holder">
                                                        <asp:DropDownList ID="ddlCategoria" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>
                                                        <%--<input type="text" placeholder="City" class="form-control">--%>
                                                    </div>
                                                    <div class="form-holder">
                                                        <asp:DropDownList ID="ddlServicio" runat="server" class="form-control"></asp:DropDownList>
                                                        <%--<input type="text" placeholder="Country" class="form-control">--%>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                            <div class="form-holder">
                                                <asp:DropDownList ID="ddlCiudad" runat="server" class="form-control"></asp:DropDownList>
                                                <%--<input type="text" placeholder="Country" class="form-control">--%>
                                            </div>
                                        </div>
                                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" />
                                    </section>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>

        <!-- JQUERY STEP -->
        <script src="Js/app.js"></script>
        <script src="Js/jquery.steps.js"></script>
        <script src="Js/main.js"></script>
        <script src="Js/theme-map.js"></script>
    </form>
</body>
</html>
