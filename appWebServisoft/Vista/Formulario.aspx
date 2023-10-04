<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="Formulario.Formulario" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="Css/style_formularioServ.css">
    <link rel="stylesheet" href="Css/normalize.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>

    <script src="../Scripts/sweetalert.min.js"></script>
    <link href="Css/sweetalert.css" rel="stylesheet" />

</head>
<body>
    <a href="#" onclick="window.history.back(); return false;" class="cta">
        <span>Volver</span>
        <svg width="13px" height="10px" viewBox="0 0 13 10" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M1,5 L5,1 L5,3 L11,3 L11,7 L5,7 L5,9 L1,5" stroke="black" stroke-width="1.5" fill="black"></path>
        </svg>


    </a>
    <style>
        a {
            text-decoration: none;
            color: inherit;
            top: 30px;
            right: -30px;
        }

        .cta {
            position: relative;
            margin: auto;
            padding: 19px 22px;
            transition: all 0.2s ease;
        }

            .cta:before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                border-radius: 28px;
                background: rgba(255, 171, 157, 0.5);
                width: 56px;
                height: 56px;
                transition: all 0.3s ease;

            }

            .cta span {
                position: relative;
                font-size: 16px;
                line-height: 18px;
                font-weight: 900;
                letter-spacing: 0.25em;
                text-transform: uppercase;
                vertical-align: middle;
            }

            .cta svg {
                position: relative;
                top: 0;
                margin-left: 10px;
                fill: none;
                stroke-linecap: round;
                stroke-linejoin: round;
                stroke: #111;
                stroke-width: 2;
                transform: translateX(-5px);
                transition: all 0.3s ease;
            }


            }

            .cta span {
                position: relative;
                font-size: 16px;
                line-height: 18px;
                font-weight: 900;
                letter-spacing: 0.25em;
                text-transform: uppercase;
                vertical-align: middle;
            }

            .cta svg {
                position: relative;
                top: 0;
                margin-left: 10px;
                fill: none;
                stroke-linecap: round;
                stroke-linejoin: round;
                stroke: #111;
                stroke-width: 2;
                transform: translateX(-5px);
                transition: all 0.3s ease;
            }


            .cta:hover:before {
                width: 100%;
                background: #ffab9d;
            }

            .cta:hover svg {
                transform: translateX(0);
            }

            .cta:active {
                transform: scale(0.96);
            }
    </style>
    <!-- Form container -->
    <section id="form-width">

        <form id="form1" runat="server">
            <div class="row">
                <!-- form input -->
                <div class="col-lg-6 col-md-12 col-sm-12" style="padding-left: 25px;">
                    <!-- logo -->
                    <div class="logotipe d-flex justify-content-center">
                        <a href="#" class="d-flex align-items-center">
                            <img src="Imagenes/logo_preview_rev_3.png" class="img-fluid">
                            <h3>Servisoft</h3>
                        </a>
                    </div>
                    <asp:Label ID="lblIdCliente" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblIdCiudad" runat="server" Visible="false"></asp:Label>
                    <h4 class="text-center text-uppercase">Bienvenidos</h4>
                    <hr>
                    <p class="text-center text-uppercase">¿Que servcio necesitas?</p>
                    <p class="text-center text-uppercase">Ingresa cada uno de los datos solicitados para poder solicitar la cotización a cada uno de los profesionales que se encuentren disponibles</p>
                    <hr>

                    <!-- inputs -->
                    <div class="inputs-form form-group">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <label for="categoria" class="ubuntu">Categoria:</label>
                                <asp:DropDownList ID="ddlCategoria" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged"></asp:DropDownList>

                                <label for="servicio" class="ubuntu">Servicio:</label>
                                <asp:DropDownList ID="ddlServicio" runat="server"></asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                        <label for="titulo" class="ubuntu">Título del servicio:</label>
                        <input type="text" name="username" id="txtTitulo" runat="server" class="form-control mb-4" required />

                        <label for="descripcion" class="ubuntu">Descripción del servicio:</label>
                        <input type="text" textmode="MultiLine" rows="5" columns="40" name="descripcion_form" id="txtDescripcion" runat="server" class="form-control mb-4" required />

                        <label for="imagenes" class="ubuntu">Imagenes:</label>
                        <asp:FileUpload ID="FluImagen" runat="server" />
                        <br />
                        <label for="servicio" class="ubuntu">Ciudad:</label>
                        <asp:DropDownList ID="ddlCiudad" runat="server"></asp:DropDownList>
                        <br />
                        <label for="descripcion" class="ubuntu">Dirección:</label>
                        <input type="text" name="direccion_form" id="txtDireccion" runat="server" class="form-control mb-4" required>

                        <button id="btnEnviar" style="background-color:#dc3545; color:white" runat="server" type="submit" class="btn mt-1 ubuntu send-form" onserverclick="btnEnviar_ServerClick">Enviar</button>

                    </div>

                </div>

                <!-- form img -->
                <div class="col-lg-6 col-md-12 col-sm-12 d-flex justify-content-center align-items-center">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <figure class="w-100 img-form">
                                <asp:Image ID="ImgCateg" runat="server" Height="500px" Width="490px" />
                            </figure>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
        </form>

    </section>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>
