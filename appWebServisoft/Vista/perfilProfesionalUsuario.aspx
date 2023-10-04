<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="perfilProfesionalUsuario.aspx.cs" Inherits="appWebServisoft.Vista.perfilProfesionalUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
<body >
    <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div style="display: block">
       
                <section class="seccion-perfil-usuario container">
                    <asp:Label ID="lblIdCotizacion" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblTeleProf" runat="server" Visible="false"></asp:Label>
                    <div class="perfil-usuario-header">
                        <div class="perfil-usuario-portada">
                                     <a href="TrabajosSolicitadosCliente.aspx" class="cta">
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
                              <asp:Label ID="lblIdProfesional" runat="server" Visible="false"></asp:Label>
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
                         <asp:Label ID="lblDescripcion" runat="server" Visible="false"></asp:Label>
                         <asp:Label ID="lblDireccion1" runat="server" Visible="false"></asp:Label>
                         <asp:Label ID="lblCiudad1" runat="server" Visible="false"></asp:Label>
                         <asp:Label ID="lblCategoria" runat="server" Visible="false"></asp:Label>
                      <asp:Label ID="lblServicio1" runat="server" Visible="false"></asp:Label>
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
    <a href="javascript:void(0);" class="boton-redes whatsapp" onclick="mostrar_chat()">
        <img src="Imagenes/Iconos/whatsapp.png" alt="WhatsApp" />
    </a>
</div>
           <div id='whatsapp-chat' class='hide'>
                <div class='header-chat'>
                    <div class='head-home'>
                        <h3>Envio Mensaje</h3>
                        <div class='info-avatar'>
                            <asp:Image CssClass="imagenes imagen-click" runat="server" ID="Image1" /></div>

                    </div>

                    <div class='get-new'>
                         <asp:Label ID="Label1" runat="server"></asp:Label>
                        <div id='get-nama'>Envio Mensaje</div>

                    </div>
                </div>

                <div class='start-chat'>
                    <div class='first-msg'><span>¡Hola! ¿Qieres contactar al Profesional?</span></div>
                    <div class='blanter-msg'>
                        <textarea id='chat-input' placeholder='Escribe un mensaje' maxlength='300' row='1'></textarea>
                        <a href='#' onclick="enviar_mensaje();" id='send-it'>Enviar</a>
                    </div>
                </div>
            <%--    <asp:Label ID="lblnumero" runat="server" style="color:#404040"></asp:Label>--%>
                <a class='close-chat' onclick="cerrar_chat();" href='#'>×</a>
            </div>
     

        <script>
            function enviar_mensaje() {
                var a = document.getElementById("chat-input");
                var numeroLabel = document.getElementById("lblTelefono");
                var numero = numeroLabel.textContent.trim();

                // Agregar el prefijo de país si el número no lo tiene
                var numeroConPrefijo = numero.startsWith("+57") ? numero : "+57" + numero;

                if ("" != a.value) {
                    var c = document.getElementById("chat-input").value;
                    var d = "https://web.whatsapp.com/send";
                    var e = numeroConPrefijo;
                    var f = "&text=" + c;
                    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
                        var d = "whatsapp://send";
                    }
                    var g = d + "?phone=" + e + f;
                    window.open(g, "_blank");
                }
            }

            const whatsapp_chat = document.getElementById("whatsapp-chat");

            function cerrar_chat() {
                whatsapp_chat.classList.add("hide");
                whatsapp_chat.classList.remove("show");
            }

            function mostrar_chat() {
                whatsapp_chat.classList.add("show");
                whatsapp_chat.classList.remove("hide");
            }
            function openChatModal() {
                var modal = document.getElementById("chatModal");
                modal.style.display = "block";
            }

            // Función para cerrar el modal
            function closeChatModal() {
                var modal = document.getElementById("chatModal");
                modal.style.display = "none";
            }

            // Función para enviar mensaje simulado (puedes personalizar esta función según tus necesidades)
            function sendMessage() {
                var messageInput = document.getElementById("messageInput");
                var message = messageInput.value;

                if (message.trim() !== "") {
                    var chatMessages = document.querySelector(".chat-messages");
                    var messageDiv = document.createElement("div");
                    messageDiv.className = "message sent";
                    messageDiv.innerHTML = '<div class="message-content">' + message + '</div>';
                    chatMessages.appendChild(messageDiv);

                    // Limpia el campo de entrada después de enviar el mensaje
                    messageInput.value = "";
                }
            }


        </script>
        <style>/* Estilos para el modal */
h1 {
    text-align: center;
    margin: 50px 0;
}

strong {
    color: red;
}

image{
    position:center;
}


body {
    font-family: "Lato", sans-serif;
    background: #f1f1f1;
    background-image: url('imagenes/envio mensaje.png');
}

a:link,
a:visited {
    color: #444;
    text-decoration: none;
    transition: all 0.4s ease-in-out;
}

h1 {
    font-size: 20px;
    text-align: center;
    display: block;
    background: linear-gradient(to right top, #6f96f3, #164ed2);
    padding: 20px;
    color: #fff;
    border-radius: 50px;
}


/* CSS Whatsapp Chat */
#whatsapp-chat {
    position: fixed;
    background: #fff;
    width: 350px;
    border-radius: 10px;
    box-shadow: 0 1px 15px rgba(32, 33, 36, 0.28);
    bottom: 90px;
    right: 30px;
    overflow: hidden;
    z-index: 99;
    animation-name: showchat;
    animation-duration: 1s;
    transform: scale(1);
}

a.blantershow-chat {
    /*   background: #009688; */
    background: #fff;
    color: #404040;
    position: fixed;
    display: flex;
    font-weight: 400;
    justify-content: space-between;
    z-index: 98;
    bottom: 25px;
    right: 30px;
    font-size: 15px;
    padding: 10px 20px;
    border-radius: 30px;
    box-shadow: 0 1px 15px rgba(32, 33, 36, 0.28);
}

    a.blantershow-chat svg {
        transform: scale(1.2);
        margin: 0 10px 0 0;
    }

.header-chat {
    background: #095e54;
    color: #fff;
    padding: 20px;
}

    .header-chat h3 {
        margin: 0 0 10px;
    }

    .header-chat p {
        font-size: 14px;
        line-height: 1.7;
        margin: 0;
    }

.info-avatar {
    position: relative;
}

    .info-avatar img {
        border-radius: 100%;
        width: 50px;
        float: left;
        margin: 0 10px 0 0;
    }

    .info-avatar:before {
        content: "\f232";
        z-index: 1;
        font-family: "Font Awesome 5 Brands";
        background: #23ab23;
        color: #fff;
        padding: 4px 5px;
        border-radius: 100%;
        position: absolute;
        top: 30px;
        left: 30px;
    }

.info-chat span {
    display: block;
}

#get-label,
span.chat-label {
    font-size: 12px;
    color: #888;
}

#get-nama,
span.chat-nama {
    margin: 5px 0 0;
    font-size: 15px;
    font-weight: 700;
    color: #222;
}

#get-label,
#get-nama {
    color: #fff;
}

span.my-number {
    display: none;
}

.blanter-msg {
    color: #444;
    padding: 20px;
    font-size: 12.5px;
    text-align: center;
    border-top: 1px solid #ddd;
}

textarea#chat-input {
    border: none;
    font-family: "Arial", sans-serif;
    width: 100%;
    height: 20px;
    outline: none;
    resize: none;
}

a#send-it {
    color: #555;
    width: 40px;
    margin: -5px 0 0 5px;
    font-weight: 700;
    padding: 8px;
    background: #eee;
    border-radius: 10px;
}

.first-msg {
    background: #f5f5f5;
    padding: 30px;
    text-align: center;
}

    .first-msg span {
        background: #e2e2e2;
        color: #333;
        font-size: 14.2px;
        line-height: 1.7;
        border-radius: 10px;
        padding: 15px 20px;
        display: inline-block;
    }

.start-chat .blanter-msg {
    display: flex;
}

#get-number {
    display: none;
}

a.close-chat {
    position: absolute;
    top: 5px;
    right: 15px;
    color: #fff;
    font-size: 30px;
}

@keyframes showhide {
    from {
        transform: scale(0.5);
        opacity: 0;
    }
}

@keyframes showchat {
    from {
        transform: scale(0);
        opacity: 0;
    }
}

@media screen and (max-width: 480px) {
    #whatsapp-chat {
        width: auto;
        left: 5%;
        right: 5%;
        font-size: 80%;
    }
}

.hide {
    display: none;
    animation-name: showhide;
    animation-duration: 1.5s;
    transform: scale(1);
    opacity: 1;
}

.show {
    display: block;
    animation-name: showhide;
    animation-duration: 1.5s;
    transform: scale(1);
    opacity: 1;
}

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
