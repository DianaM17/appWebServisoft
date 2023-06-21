<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="interfazCliente.aspx.cs" Inherits="appWebServisoft.Vista.interfazCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/interfazCliente.css" rel="stylesheet" />
    <link href="Css/Estilos_Categoria.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Form container -->
    <section id="form-width" class="section1 d-flex justify-content-center" style="margin-top: 20px;">
        <div class="row ">
            <!-- form input -->
            <div class="col-lg-6 col-md-12 col-sm-12" style="padding-left: 25px;">
                <h4 class="text-center text-uppercase anton" style="font-size: 22px;">Bienvenidos</h4>
                <hr>
                <p class="text-center text-uppercase anton" style="font-size: 16px;">¿Qué servicio necesitas?</p>
                <p class="text-center text-uppercase anton" style="font-size: 14px;">Ingresa cada uno de los datos solicitados para poder solicitar la cotización a cada uno de los profesionales que se encuentren disponibles</p>
                <hr>

                <!-- inputs -->
                <div class="inputs-form form-group">
                    <asp:Label ID="lblIdCliente" runat="server" Visible="false"></asp:Label>
                     <asp:Label ID="lblIdCiudad" runat="server" Visible="false"></asp:Label>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <label for="categoria" class="ubuntu" style="font-size: 14px;">Categoría:</label>
                            <asp:DropDownList ID="ddlCategoria" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" Style="font-size: 12px;"></asp:DropDownList>

                            <label for="servicio" class="ubuntu" style="font-size: 14px;">Servicio:</label>
                            <asp:DropDownList ID="ddlServicio" runat="server" Style="font-size: 14px;"></asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    <label for="titulo" class="ubuntu" style="font-size: 14px;">Título del servicio:</label>
                    <input type="text" name="username" id="txtTitulo" runat="server" class="form-control mb-2" style="font-size: 14px;" required>

                    <label for="descripcion" class="ubuntu" style="font-size: 14px;">Descripción del servicio:</label>
                    <input type="text" name="descripcion_form" id="txtDescripcion" runat="server" class="form-control mb-2" style="font-size: 14px;" required>

                    <label for="imagenes" class="ubuntu" style="font-size: 14px;">Imágenes:</label>
                    <asp:FileUpload ID="FluImagen" runat="server" Style="font-size: 14px;" />
                    <br />
                    <label for="descripcion" class="ubuntu" style="font-size: 14px;">Dirección:</label>
                    <input type="text" name="direccion_form" id="txtDireccion" runat="server" class="form-control mb-2" style="font-size: 14px;" required>
                    <button type="submit" class="btn mt-1 ubuntu send-form" id="btnEnviar" runat="server" onserverclick="btnEnviar_ServerClick" style="font-size: 14px;">Enviar</button>
                </div>
            </div>

            <!-- form img -->
            <div class="col-lg-6 col-md-12 col-sm-12">
                <figure class="w-100 img-form" style="margin-top: 100px">
                    <img src="Imagenes/image-1.svg" style="height: 400px;">
                </figure>
            </div>
        </div>
    </section>



    <%--Categorias--%>
    <section>
        <br />
        <div class="hero">
            <h1>Categorias</h1>
        </div>
        <br />
        <div class="container">
            <div class="row">
                <div class="d-flex flex-wrap justify-content-center align-items-center" style="max-height: 500px; overflow-y: auto;">
                    <asp:Repeater ID="reptCateg" runat="server">
                        <ItemTemplate>
                            <div class="card-container col-6 col-sm-4 col-md-3 col-lg-2 " onclick="redirectToPage('Formulario.aspx')">
                                <div class="custom-card">
                                    <div class="card-img-box">
                                        <asp:Image CssClass="imagenes" runat="server" ID="ImgCate" ImageUrl='<%# Eval("imagen") %>'/>
                                    </div>
                                </div>
                                <div class="card-content">
                                    <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("categoria") %>'></asp:Label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </section>
    <script>
        function redirectToPage(url) {
            window.location.href = 'Formulario.aspx';
        }
    </script>

    <%--  Cards Profesionales--%>
    <br />
    <br />
    <div class="hero">
        <h1>Profesionales</h1>
    </div>
    <br />

    <div class="container">
        <div class="owl-carousel owl-theme text-center">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <div class="card mx-2 mb-2 custom-card" style="width: 220px; height: 275px; background-color: #1ab999; border-radius: 10%;">
                        <div class="card-body" style="background-color: #FFFFFF; width: 215px; height: 270px; border-radius: 10%; background-image: linear-gradient(to bottom, #51dcbc 50%, #ffffff 50%);">
                            <div style="width: 120px; height: 120px; border-radius: 50%; overflow: hidden; display: flex; border: 4px solid white; justify-content: center; margin-left: auto; margin-right: auto; margin-top: 30px">
                                <img class="card-img-top" src="Imagenes/PerfilProfesional/<%# Eval("fotos") %>" alt="Card image cap" style="max-width: 100%; max-height: 100%; object-fit: cover;" />
                                
                                </div>
                            <p class="card-text" style="font-size:17px"><%# Eval("nombres")%>   <%# Eval("apellidos") %>  </p>
                            <p class="card-text" style="font-size:18px"><%# Eval("categorias") %> </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <style>
   
</style>



    <%--Carrucel Trabajos realizados--%>
    <br />
    <div class="hero">
        <h1>Trabajos Realizados</h1>
    </div>
    <br />
    <br />

    <div class="container">
        <div class="vertical-carousel owl-carousel owl-theme">
            <asp:Repeater ID="Repeater2" runat="server">
                <ItemTemplate>
                    <div class="vertical-card mx-2 mb-2 custom-vertical-card" style="width: 100%; height: 400px;">
                        <div class="vertical-card-body">
                            <div style="width: 100%; height: 400px; overflow: hidden; display: flex; justify-content: center; margin-left: auto; margin-right: auto; margin-top: 30px">
                                <img class="vertical-card-img-top align-items-center" src="Imagenes/imagenesTrabajosRealizados/<%# Eval("imagen") %>" alt="Card image cap" />
                            </div>

                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <style>
        .vertical-carousel {
            display: flex;
            flex-direction: column;
        }

            .vertical-carousel .vertical-card {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 150px;
            }

            .vertical-carousel .custom-vertical-card {
                width: 240px;
                margin: 0 auto;
                margin-bottom: 10px; /* Agregado margen inferior de 10px */
            }

        .vertical-card-body {
            /* Estilos personalizados para el cuerpo de la tarjeta vertical */
        }

        .vertical-card-img-top {
            /* Estilos personalizados para la imagen de la tarjeta vertical */
        }
    </style>

    <script> 
        $(document).ready(function () {
            $('.vertical-carousel').owlCarousel({
                items: 1,
                loop: true,
                nav: true,
                navText: ['&#8249;', '&#8250;'],
                dots: false,
                autoplay: true,
                autoplayTimeout: 3000,
                autoplayHoverPause: true,
                animateOut: 'fadeOut',
                animateIn: 'fadeIn',
                responsiveClass: true,
                responsive: {
                    0: {
                        items: 1
                    },
                    768: {
                        items: 2
                    },
                    1000: {
                        items: 2
                    }
                }
            });
        });


    </script>

    <%--  Carrucel comentarios--%>

    <div class="hero">
        <h1>Comentarios</h1>
        <div class="review-box">
            <div id="slide">q
                <asp:Repeater ID="RepeaterContenido" runat="server">
                    <ItemTemplate>
                        <div class="cardComentario">
                            <div class="profile">
                                <img src="Imagenes/PerfilCliente/<%# Eval("foto") %>" />
                                <div>
                                    <h3 class="card-text"><%# Eval("nombres") %> <%# Eval("apellidos") %></h3>
                                    <p class="card-text"><%# Eval("puntos") %></p>
                                </div>
                            </div>
                            <p class="card-text"><%# Eval("comentarios") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="sidebar">
                <img src="Imagenes/Iconos/arriba.png" id="ArribaFlecha" />
                <img src="Imagenes/Iconos/abajo.png" id="AbajoFlecha" />
            </div>
        </div>
    </div>

    <script>
        var slide = document.getElementById("slide");
        var ArribaFlecha = document.getElementById("ArribaFlecha");
        var AbajoFlecha = document.getElementById("AbajoFlecha");

        let x = 0;
        function moverArriba() {
            if (x > -900) {
                x = x - 300;
                slide.style.top = x + "px";
            }
        }

        function moverAbajo() {
            if (x < 0) {
                x = x + 300;
                slide.style.top = x + "px";
            }
        }

        var intervalo = setInterval(moverArriba, 20000);

        ArribaFlecha.onclick = moverArriba;
        AbajoFlecha.onclick = moverAbajo;


    </script>


    <style>
        .hero {
            width: 100%;
            height: 100hv;
            background: #f6fbff;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h1 {
            font-size: 30px;
            position: relative;
            margin-bottom: 50px;
        }

            h1::after {
                content: '';
                width: 150px;
                height: 3px;
                background: linear-gradient(to right, #f44336, #9f4db5);
                position: absolute;
                bottom: -20px;
                left: 50%;
                transform: translateX(-50%);
            }

        .review-box {
            width: 90%;
            max-width: 700px;
            height: 300px;
            border-radius: 10px;
            box-shadow: -10px 10px 40px rgb(0,0, 0,0.25);
            position: relative;
            overflow: hidden;
        }

        .cardComentario {
            height: 300px;
            padding: 40px;
            color: #777;
            line-height: 22px;
            box-sizing: border-box;
            background: #fff;
            position: relative;
            z-index: 1;
        }

        .cardComentario::before{
            content: '';
            width: 110px;
            height: 110px;
            border-bottom-right-radius: 100%;
            background: #f44336;
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;

        }

        .profile {
            display: flex;
            align-items: center;
            margin-bottom: 40px;
        }

            .profile img {
                width: 80px;
                border-radius: 50%;
                margin-right: 20px;
            }

            .profile h3 {
                font-size: 26px;
                color: #f44336;
                margin-bottom: 8px;
            }

        #slide {
            width: 100%;
            padding-right: 60px;
            box-sizing: border-box;
            position: absolute;
            top: 0;
            left: 0;
            transition: 0.5s;
        }

        .sidebar {
            width: 60px;
            height: 100%;
            padding: 15px 0;
            box-sizing: border-box;
            background: #f44336;
            position: absolute;
            right: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
        }

            .sidebar img {
                width: 25px;
                padding: 5px;
                background: #fff;
                border-radius: 50%;
                cursor: pointer;
    </style>





   <footer style="margin-top: 100px">
    <div class="container__footer">
        <div class="box__footer">
            <div class="logo">
                <img src="Imagenes/logo_preview_rev_3.png" alt="">
            </div>
            <div class="terms">
                <p>Contamos con un grupo de profesionales quienes son los encargados de resolver cualquier problema que se le pueda presentar</p>
            </div>
        </div>
        <div class="box__footer">
            <h2>Compañía</h2>
            <a href="#">Acerca de</a>
            <a href="#">Categoría</a>
            <a href="#">Cliente</a>
            <a href="#">Profesional</a>
        </div>
        <div class="box__footer">
            <h2>Redes Sociales</h2>
            <a href="#"><i class="fab fa-facebook-square"></i>Facebook</a>
            <a href="#"><i class="fab fa-twitter-square"></i>Twitter</a>
            <a href="#"><i class="fab fa-linkedin"></i>LinkedIn</a>
            <a href="#"><i class="fab fa-instagram-square"></i>Instagram</a>
        </div>
    </div>
    <div class="box__copyright">
        <hr>
        <p style="font-size: 15px">
           SERVISOFT ® 2022
             <a href="#" style="text-decoration: none;">
                 <strong class="text-info">Consulta nuestras políticas de privacidad</strong>
             </a>
        </p>
    </div>
</footer>

<script src="Js/JavaScript_Principal.js"></script>

</asp:Content>
