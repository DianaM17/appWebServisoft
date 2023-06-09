﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="Formulario.Formulario" %>

<!DOCTYPE html>

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
</head>
<body>

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
                            <h3 class="ubuntu">Servisoft</h3>
                        </a>
                    </div>

                    <h4 class="text-center text-uppercase anton">Bienvenidos</h4>
                    <hr>
                    <p class="text-center text-uppercase anton">¿Que servcio necesitas?</p>
                    <p class="text-center text-uppercase anton">Ingresa cada uno de los datos solicitados para poder solicitar la cotización a cada uno de los profesionales que se encuentren disponibles</p>
                    <hr>

                    <!-- inputs -->
                    <div class="inputs-form form-group">
                        <label for="categoria" class="ubuntu">Categoria:</label>
                        <asp:DropDownList ID="ddlCategoria" runat="server"></asp:DropDownList>

                        <label for="servicio" class="ubuntu">Servicio:</label>
                        <asp:DropDownList ID="ddlServicio" runat="server"></asp:DropDownList>
                        <br />
                        <label for="titulo" class="ubuntu">Título del servicio:</label>
                        <input type="text" name="username" id="tituloServicio" class="form-control mb-4" required>

                        <label for="descripcion" class="ubuntu">Descripción del servicio:</label>
                        <input type="text" name="descripcion_form" id="descripcion_form" class="form-control mb-4" required>

                        <label for="imagenes" class="ubuntu">Imagenes:</label>
                        <asp:FileUpload ID="Imagen" runat="server" />
                        <br />
                        <label for="descripcion" class="ubuntu">Dirección:</label>
                        <input type="text" name="direccion_form" id="direccion_form" class="form-control mb-4" required>

                        <div class="form-group mt-2">
                            <input type="checkbox" name="accept_terms" value="" required>
                            <label for="accept_terms">Acepto términos y condiciones.</label>
                        </div>

                        <button type="submit" class="btn mt-1 ubuntu" id="send-form">Enviar</button>

                    </div>

                </div>

                <!-- form img -->
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <figure class="w-100 img-form">
                        <img src="Imagenes/image-1.svg">
                    </figure>

                </div>

            </div>
        </form>

    </section>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>