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

    <!-- MATERIAL DESIGN ICONIC FONT -->
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.css">

    <!-- STYLE CSS -->
    <link href="Css/style.css" rel="stylesheet" />

</head>

<body>
    <form runat="server">
        <style type="text/css">
            html {
                -webkit-text-size-adjust: 100%;
                -ms-text-size-adjust: 100%;
                text-size-adjust: 100%;
                line-height: 1.4;
            }


            * {
                margin: 0;
                padding: 0;
                -webkit-box-sizing: border-box;
                -moz-box-sizing: border-box;
                box-sizing: border-box;
            }

            body {
                color: #404040;
                font-family: "Arial", Segoe UI, Tahoma, sans-serifl, Helvetica Neue, Helvetica;
            }

            .seccion-perfil-usuario .perfil-usuario-body,
            .seccion-perfil-usuario {
                display: flex;
                flex-wrap: wrap;
                flex-direction: column;
                align-items: center;
            }

                .seccion-perfil-usuario .perfil-usuario-header {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    background: linear-gradient(#B873FF, transparent);
                    margin-bottom: 1.25rem;
                }

                .seccion-perfil-usuario .perfil-usuario-portada {
                    display: block;
                    position: relative;
                    width: 90%;
                    height: 17rem;
                    background-image: linear-gradient(45deg, #BC3CFF, #317FFF);
                    border-radius: 0 0 20px 20px;
                    /*
    background-image: url('http://localhost/multimedia/png/user-portada-3.png');
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    */
                }

                    .seccion-perfil-usuario .perfil-usuario-portada .boton-portada {
                        position: absolute;
                        top: 1rem;
                        right: 1rem;
                        border: 0;
                        border-radius: 8px;
                        padding: 12px 25px;
                        background-color: rgba(0, 0, 0, .5);
                        color: #fff;
                        cursor: pointer;
                    }

                        .seccion-perfil-usuario .perfil-usuario-portada .boton-portada i {
                            margin-right: 1rem;
                        }

                .seccion-perfil-usuario .perfil-usuario-avatar {
                    display: flex;
                    width: 180px;
                    height: 180px;
                    align-items: center;
                    justify-content: center;
                    border: 7px solid #FFFFFF;
                    background-color: #DFE5F2;
                    border-radius: 50%;
                    box-shadow: 0 0 12px rgba(0, 0, 0, .2);
                    position: absolute;
                    bottom: -40px;
                    left: calc(50% - 90px);
                    z-index: 1;
                }

                    .seccion-perfil-usuario .perfil-usuario-avatar img {
                        width: 100%;
                        position: relative;
                        border-radius: 50%;
                    }

                    .seccion-perfil-usuario .perfil-usuario-avatar .boton-avatar {
                        position: absolute;
                        left: -2px;
                        top: -2px;
                        border: 0;
                        background-color: #fff;
                        box-shadow: 0 0 12px rgba(0, 0, 0, .2);
                        width: 45px;
                        height: 45px;
                        border-radius: 50%;
                        cursor: pointer;
                    }

                .seccion-perfil-usuario .perfil-usuario-body {
                    width: 70%;
                    position: relative;
                    max-width: 750px;
                }

                    .seccion-perfil-usuario .perfil-usuario-body .titulo {
                        display: block;
                        width: 100%;
                        font-size: 1.75em;
                        margin-bottom: 0.5rem;
                    }

                    .seccion-perfil-usuario .perfil-usuario-body .texto {
                        color: #848484;
                        font-size: 0.95em;
                    }

                .seccion-perfil-usuario .perfil-usuario-footer,
                .seccion-perfil-usuario .perfil-usuario-bio {
                    display: flex;
                    flex-wrap: wrap;
                    padding: 1.5rem 2rem;
                    box-shadow: 0 0 12px rgba(0, 0, 0, .2);
                    background-color: #fff;
                    border-radius: 15px;
                    width: 100%;
                }

                .seccion-perfil-usuario .perfil-usuario-bio {
                    margin-bottom: 1.25rem;
                    text-align: center;
                }

                .seccion-perfil-usuario .lista-datos {
                    width: 50%;
                    list-style: none;
                }

                    .seccion-perfil-usuario .lista-datos li {
                        padding: 5px 0;
                    }

                        .seccion-perfil-usuario .lista-datos li > .icono {
                            margin-right: 1rem;
                            font-size: 1.2rem;
                            vertical-align: middle;
                        }

                .seccion-perfil-usuario .redes-sociales {
                    position: absolute;
                    right: calc(0px - 50px - 1rem);
                    top: 0;
                    display: flex;
                    flex-direction: column;
                }

                    .seccion-perfil-usuario .redes-sociales .boton-redes {
                        border: 0;
                        background-color: #fff;
                        text-decoration: none;
                        display: inline-flex;
                        align-items: center;
                        justify-content: center;
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                        color: #fff;
                        box-shadow: 0 0 12px rgba(0, 0, 0, .2);
                        font-size: 1.3rem;
                    }

                        .seccion-perfil-usuario .redes-sociales .boton-redes + .boton-redes {
                            margin-top: .5rem;
                        }

                .seccion-perfil-usuario .boton-redes.facebook {
                    background-color: #5955FF;
                }

                .seccion-perfil-usuario .boton-redes.twitter {
                    background-color: #35E1BF;
                }

                .seccion-perfil-usuario .boton-redes.instagram {
                    background: linear-gradient(45deg, #FF2DFD, #40A7FF);
                }

            /* adactacion a dispositivos */
            @media (max-width: 750px) {
                .seccion-perfil-usuario .lista-datos {
                    width: 100%;
                }

                .seccion-perfil-usuario .perfil-usuario-portada,
                .seccion-perfil-usuario .perfil-usuario-body {
                    width: 95%;
                }

                .seccion-perfil-usuario .redes-sociales {
                    position: relative;
                    flex-direction: row;
                    width: 100%;
                    left: 0;
                    text-align: center;
                    margin-top: 1rem;
                    margin-bottom: 1rem;
                    align-items: center;
                    justify-content: center
                }

                    .seccion-perfil-usuario .redes-sociales .boton-redes + .boton-redes {
                        margin-left: 1rem;
                        margin-top: 0;
                    }
            }
        </style>

        <div style="display: block">
            <section class="seccion-perfil-usuario container">
                <div class="perfil-usuario-header">
                    <div class="perfil-usuario-portada">
                        <div class="perfil-usuario-avatar">
                            <img src="http://localhost/multimedia/relleno/img-c9.png" alt="img-avatar">
                            <button type="button" class="boton-avatar">
                                <i class="far fa-image"></i>
                            </button>
                        </div>
                        <button type="button" class="btn btn-primary boton-portada" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <i class="bi bi-pencil-square"></i>Editar Perfil
                        </button>
                    </div>
                </div>
                <div class="perfil-usuario-body">
                    <div class="perfil-usuario-bio">
                        <h3 class="titulo">Maria Alejandra De la Cruz</h3>
                        <p class="texto">
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                    </div>
                    <div class="perfil-usuario-footer">
                        <ul class="lista-datos">
                            <li><i class="icono fas fa-map-signs"></i>Direccion de usuario:</li>
                            <li><i class="icono fas fa-phone-alt"></i>Telefono:</li>
                            <li><i class="icono fas fa-briefcase"></i>Trabaja en.</li>
                            <li><i class="icono fas fa-building"></i>Cargo</li>
                        </ul>
                        <ul class="lista-datos">
                            <li><i class="icono fas fa-map-marker-alt"></i>Ubicacion.</li>
                            <li><i class="icono fas fa-calendar-alt"></i>Fecha nacimiento.</li>
                            <li><i class="icono fas fa-user-check"></i>Registro.</li>
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
                <ul class="ul">
                    <li class="li">
                        <a href="#" class="a" title="Imagen 1">
                            <img src="assets/1.jpg" alt="Imagen 1" class="img" loading="lazy">
                        </a>
                    </li>
                    <li class="li">
                        <a href="#" class="a" title="Imagen 2">
                            <img src="assets/2.jpg" alt="Imagen 2" class="img" loading="lazy">
                        </a>
                    </li>
                    <li class="li">
                        <a href="#" class="a" title="Imagen 3">
                            <img src="assets/3.jpg" alt="Imagen 3" class="img" loading="lazy">
                        </a>
                    </li>
                </ul>

                <div class="lightbox">
                    <button class="cerrar">Cerrar</button>
                    <img src="Carrusel/assets/1.jpg" alt="Imagen 1" class="grande" loading="lazy">
                </div>
            </section>
            <!--====  End of html  ====-->
            <style>
                .mensaje a {
                    color: inherit;
                    margin-right: .5rem;
                    display: inline-block;
                }

                    .mensaje a:hover {
                        color: #309B76;
                        transform: scale(1.4)
                    }
            </style>

            <!--====  End of tarjeta  ====-->


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
                                        <asp:Label ID="lblIdProfesional" runat="server" Text="Label"></asp:Label>
                                        <div class="form-header">
                                            <div class="avartar">
                                                <a href="#">
                                                    <img src="images/avartar.png" alt="">
                                                </a>
                                                <div class="avartar-picker">
                                                    <input type="file" name="file-1[]" id="file-1" class="inputfile" data-multiple-caption="{count} files selected" multiple />
                                                    <label for="file-1">
                                                        <i class="zmdi zmdi-camera"></i>
                                                        <span>Choose Picture</span>
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
                                            <div class="form-holder">
                                                <asp:DropDownList ID="ddlCategoria" runat="server" class="form-control"></asp:DropDownList>
                                                <%--<input type="text" placeholder="City" class="form-control">--%>
                                            </div>
                                            <div class="form-holder">
                                                <asp:DropDownList ID="ddlServicio" runat="server" class="form-control"></asp:DropDownList>
                                                <%--<input type="text" placeholder="Country" class="form-control">--%>
                                            </div>
                                        </div>
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
