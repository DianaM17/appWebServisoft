<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfilProfesionalUsuario.aspx.cs" Inherits="appWebServisoft.Vista.perfilProfesionalUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css" />
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />
    <link href="Css/perfilProfesionalUsuario.css" rel="stylesheet" />

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Agrega el enlace de Slick Carousel -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div style="display: block">
                <section class="seccion-perfil-usuario container">
                    <asp:Label ID="lblTeleProf" runat="server" Visible="false"></asp:Label>
                    <div class="perfil-usuario-header">
                        <div class="perfil-usuario-portada">
                            <div class="perfil-usuario-avatar">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:Image CssClass="imagenes imagen-click" runat="server" ID="ImgPerfil" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>


                    <div class="perfil-usuario-body">
                        <div class="perfil-usuario-bio">
                            <asp:Label ID="lblNombre" runat="server" CssClass="titulo"></asp:Label>
                            <div class="informacion2">
                                   <i class="icono"></i>Profesion:
        <asp:Label ID="lblProfesion" runat="server"></asp:Label>
                            </div>
                            <div class="informacion1">
                                <div class="informacion-item">
                                    <i class="icono"></i>Cargo:
        <asp:Label ID="lblServicio" runat="server"></asp:Label>
                                </div>
                            </div>

                        </div>
                        <div class="perfil-usuario-footer">
                            <ul class="lista-datos">
                                <li><i class="icono fas fa-map-signs"></i>Dirección:
                        <asp:Label ID="lblDireccion" runat="server"></asp:Label></li>
                                <li><i class="icono fas fa-phone-alt"></i>Telefono:
                        <asp:Label ID="lblTelefono" runat="server"></asp:Label></li>
                                <li><i class="icono fas fa-envelope"></i>Email:
                        <asp:Label ID="lblEmail" runat="server"></asp:Label></li>
                            </ul>
                            <ul class="lista-datos">
                                <li><i class="icono fas fa-map-marker-alt"></i>Ciudad:
                        <asp:Label ID="lblCiudad" runat="server"></asp:Label></li>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <li><i class="icono fas fa-user-check"></i>Estado:
                                <asp:Label ID="lblEstado" runat="server"></asp:Label></li>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </ul>
                        </div>

                    </div>
            </section>
        </div>


            
       <style>
    .perfil-usuario-bio {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

  

    .informacion1 {
        display: flex;
    }

    .informacion-item {
        margin-left: 15px; /* Puedes ajustar este valor según tu diseño */
    }
</style>



            <section class="container">
                <br />
                <br />
                <div class="containerTitulo">
                    <h5 class="titulo1">Trabajos Realizados</h5>
                    <div class="lineaDeColores"></div>
                </div>
                <br />
                <br />
                <div class="carousel-container">
                    <!-- Agrega un contenedor para el carrusel -->
                    <%--inicio galeria--%>
                    <asp:Repeater ID="RptImagenes" runat="server">
                        <ItemTemplate>
                            <div class="galeria">
                                <asp:Image runat="server" ID="ImgCate" ImageUrl='<%# Eval("imagen") %>' />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <!-- Cierre del contenedor del carrusel -->
            </section>

        </div>
        <!-- Agrega los estilos de slick-carousel -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css" />

        <!-- Agrega jQuery y la biblioteca slick-carousel -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>

        <script>
            $(document).ready(function () {
                $('.carousel-container').slick({
                    dots: true, // Muestra los puntos de navegación (indicadores)
                    arrows: true, // Muestra las flechas de navegación
                    autoplay: true, // Inicia el carrusel automáticamente
                    autoplaySpeed: 8000, // Establece el tiempo de cambio entre imágenes (en milisegundos)
                    infinite: true, // Hace que el carrusel sea infinito (vuelve al inicio después de la última imagen)
                    slidesToShow: 3, // Número de imágenes visibles al mismo tiempo
                    slidesToScroll: 1, // Número de imágenes que se desplazan al cambiar de una a otra
                    responsive: [
                        {
                            breakpoint: 768, // Cambiar la configuración cuando el ancho de la pantalla sea menor o igual a 768px
                            settings: {
                                slidesToShow: 2, // Número de imágenes visibles en pantallas más pequeñas
                            }
                        },
                        {
                            breakpoint: 576, // Cambiar la configuración cuando el ancho de la pantalla sea menor o igual a 576px
                            settings: {
                                slidesToShow: 1, // Número de imágenes visibles en pantallas aún más pequeñas
                            }
                        }
                    ]
                });
            });
        </script>

        <style>


/* Estilos para los botones "Previous" y "Next" */
.slick-prev,
.slick-next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 50px;
    height: 50px;
    background-color: #007bff;
    color: transparent; /* Hacemos el texto transparente para que no sea visible */
    font-size: 16px;
    border: none;
    border-radius: 40%;
    padding: 10px;
    cursor: pointer;
    z-index: 1;
    text-align: center;
}

/* Estilo para las flechas en los botones */
.slick-prev::before,
.slick-next::before {
    content: ""; /* Dejamos el contenido vacío para que no haya texto visible */
}

/* Estilo para el símbolo mayor en el botón "Next" al hacer hover */
.slick-next:hover::before {
    content: "\203A"; /* Código Unicode para el símbolo mayor (>) */
    color:aliceblue;
          font-size: 20px; /* Tamaño del icono */
    display: flex;
    justify-content: center;
    
}

/* Estilo para el símbolo menor en el botón "Previous" al hacer hover */
.slick-prev:hover::before {
    content: "\2039"; /* Código Unicode para el símbolo menor (<) */
    color:aliceblue;
      font-size: 20px; /* Tamaño del icono */
    display: flex;
    justify-content: center;
}


.slick-prev {
    left: 0;
}

.slick-next {
    right: 0;
}

.slick-prev:hover,
.slick-next:hover {
    background-color: #0056b3;
}


                /* Estilo para los números del carrusel (puntos de navegación) */
.slick-dots {
    display: flex; /* Alinea los puntos de navegación horizontalmente */
    justify-content: center; /* Centra los puntos horizontalmente */
    list-style: none;
    padding: 0;
    margin: 0;
}

.slick-dots li {
    margin: 0 5px; /* Ajusta el espacio entre los números */
}

.slick-dots li button {
    width: 20px; /* Ajusta el ancho de cada número */
    height: 20px; /* Ajusta la altura de cada número */
    border-radius: 50%;
    background-color: #ccc; /* Color de los números inactivos */
    border: none;
    cursor: pointer;
}

.slick-dots li.slick-active button {
    background-color: #007bff; /* Color del número activo */
}

        </style>
     <div class="redes-sociales">
  <a href="https://api.whatsapp.com/send?phone=3228008984" class="boton-redes whatsapp" onclick="openWhatsAppPopup(event)">
    <img src="Imagenes/Iconos/whatsapp.png" alt="WhatsApp" />
  </a>
</div>

<div id="whatsapp-chat-container"></div>

<script type="text/javascript">
    function openWhatsAppPopup(event) {
        event.preventDefault();

        const phoneNumber = "+573228008984";
        const message = "Hola, ¿cómo puedo ayudarte?";

        // Reemplaza "es" por el código de país del usuario, si lo conoces, para mostrar el mensaje en su idioma.
        const countryCode = "es";

        const url = `https://api.whatsapp.com/send?phone=${phoneNumber}&text=${encodeURIComponent(message)}&lang=${countryCode}`;
        const options = "width=640,height=480";

        window.open(url, "_blank", options);
    }

    window.onload = function () {
        window.whatsappChatWidget = new WhatsAppChatWidget({
            phoneNumber: "+573228008984", // Reemplaza con el número de teléfono de WhatsApp
            text: "Hola, ¿cómo puedo ayudarte?", // Mensaje predeterminado
        });
        whatsappChatWidget.render('whatsapp-widget');
    };
</script>
<script type="text/javascript" src="enlace_al_script_del_widget.js"></script>



<%--<script>
    function openWhatsAppPopup(event) {
        event.preventDefault();

        const phoneNumber = "+523228008984";
        const message = "Hola, estoy contactándote desde la página web.";

        // Reemplaza "es" por el código de país del usuario, si lo conoces, para mostrar el mensaje en su idioma.
        const countryCode = "es";

        const url = `https://api.whatsapp.com/send?phone=${phoneNumber}&text=${encodeURIComponent(message)}&lang=${countryCode}`;
        const options = "width=640,height=480";

        window.open(url, "_blank", options);
    }
</script>--%>
        <style>
     
          /* Estilos del enlace de WhatsApp */
.redes-sociales {
    position: fixed;
    bottom: 20px; /* Ajusta la distancia desde la parte inferior según tus necesidades */
    right: 20px; /* Ajusta la distancia desde la derecha según tus necesidades */
    z-index: 999; /* Asegura que el enlace esté por encima de otros elementos */
    display: flex; /* Utilizamos flexbox para alinear el texto al lado derecho */
    align-items: center; /* Centramos verticalmente el texto */
}

.boton-redes.whatsapp {
    display: block;
    width: 60px; /* Ajusta el ancho según tus necesidades */
    height: 60px; /* Ajusta la altura según tus necesidades */
}

.boton-redes.whatsapp img {
    width: 100%;
    height: 100%;
    border-radius: 50%; /* Convierte la imagen en un círculo */
}

.redes-sociales::before {
    content: "Contactar"; /* Texto que aparecerá */
    background-color: rgba(0, 0, 0, 0.8); /* Fondo del texto */
    color: white; /* Color del texto */
    padding: 10px 15px; /* Espaciado interno del texto */
    border-radius: 5px; /* Borde redondeado */
    font-size: 14px; /* Tamaño del texto */
    white-space: nowrap; /* Evita que el texto se parta en varias líneas */
    z-index: 1; /* Asegura que el texto esté por encima del ícono */
    opacity: 0; /* Inicialmente el texto está oculto */
    transition: opacity 0.3s ease; /* Transición de opacidad */
    margin-left: 10px; /* Espacio entre el texto y el ícono */
}

.redes-sociales:hover::before {
    opacity: 1; /* Mostramos el texto al hacer hover */
}

        </style>

        <div class="btnSolicitarServicio">
            <asp:Button ID="btnSolicitarServicio" runat="server" Text="Solicitar Servicio" OnClick="btnSolicitarServicio_Click" />
        </div>


    <style>
            .btnSolicitarServicio {
                padding: 50px;
                text-align: center;
            }

            #btnSolicitarServicio {
                width: 200px;
                height: 50px;
                border-radius: 20px;
                background-color: #bc28b2;
                border: none;
            }

            #btnSolicitarServicio:Hover{
                background-color: #6f2a69;
            }
        </style>

       
    </form>
</body>
</html>
