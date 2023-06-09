﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="interfazCliente.aspx.cs" Inherits="appWebServisoft.Vista.interfazCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/interfazCliente.css" rel="stylesheet" />
   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <%--  Cards Profesionales--%>
    <br />
    <br />
      <div class="label-container">
    <asp:Label ID="Label2" CssClass="texto" runat="server" Text="Profesionales"></asp:Label>
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
                            <p class="card-text"><%# Eval("nombres")%>   <%# Eval("apellidos") %>  </p>
                            <p class="card-text"><%# Eval("categorias") %> </p>
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
        <div class="label-container">
        <asp:Label ID="Label1" CssClass="texto1" runat="server" Text="Trabajos Realizados"></asp:Label>
    </div>
    <br />
    <br />

<div class="container">
    <div class="vertical-carousel owl-carousel owl-theme">
        <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                <div class="vertical-card mx-2 mb-2 custom-vertical-card" style="width: 100%; height: 400px;">
                    <div class="vertical-card-body">
                        <div style="width: 100%; height: 400px; overflow: hidden; display: flex; justify-content: center; margin-left:auto; margin-right:auto; margin-top: 30px">
                            <img class="vertical-card-img-top align-items-center" src="Imagenes/imagenesTrabajosRealizados/<%# Eval("imagen") %>" alt="Card image cap" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

<style>
    .texto1 {
        margin-top: 10px;
        background-color: #8a4a4a;
        display: flex;
        height: 50px;
        align-items: center;
        justify-content: center;
        transform: skewX(-20deg);
        color: white;
        font-size: 24px;
        font-weight: bold;
    }

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
    <br />
    <br />
        <div class="label-container">
        <asp:Label ID="Label3" CssClass="texto" runat="server" Text="Comentarios"></asp:Label>
    </div>
    <br />

   <article class="Carousel">
        <!-- Carrusel -->
        <div id="demo" class="carousel slide mx-auto" data-bs-ride="carousel" style="max-width: 100%;">
            <!-- Indicadores -->
            <ol class="carousel-indicators">
                <asp:Repeater ID="RepeaterIndicadores" runat="server">
                    <ItemTemplate>
                        <li data-bs-target="#demo" data-bs-slide-to="<%# Container.ItemIndex %>" <%# (Container.ItemIndex == 0) ? " class='active'" : "" %>></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ol>

            <!-- Contenido -->
            <div class="carousel-inner">
                <asp:Repeater ID="RepeaterContenido" runat="server" OnItemDataBound="RepeaterContenido_ItemDataBound">
                    <ItemTemplate>
                        <div class='<%# "carousel-item " + GetCarouselItemClass(Container.ItemIndex) %>'>
                            <div class="d-flex justify-content-center">
                                <div class="comentario">
                                    <div class="text" style="margin-top: 50px;">
                                          <div class="nombreContainer">
                                        <h5 class="nombre"><%# Eval("nombres") %> <%# Eval("apellidos") %></h5>
                                   
                                    </div>
                                        <p class="comentarioTexto">
                                            <span class="comillas">"</span>
                                            <%# Eval("comentarios") %>
                                            <span class="comillas">"</span>
                                        </p>
                                    </div>
                                  
                                    <div class="Tipo">
                                        <h5 class="Tipo"><%# Eval("puntos") %></h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Flechas de desplazamiento -->
            <a class="carousel-control-prev" href="#demo" role="button" data-bs-slide="prev" data-bs-target="#demo">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#demo" role="button" data-bs-slide="next" data-bs-target="#demo">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </a>
        </div>
    </article>

   

  
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
                <h2>Compañia</h2>
                <a href="#">Acerca de</a>
                <a href="#">Categoria</a>
                <a href="#">Cliente</a>
                <a href="#">Profesional</a>
            </div>
            <div class="box__footer">
                <h2>Redes Sociales</h2>
                <a href="#"><i class="fab fa-facebook-square"></i>Facebook</a>
                <a href="#"><i class="fab fa-twitter-square"></i>Twitter</a>
                <a href="#"><i class="fab fa-linkedin"></i>Linkedin</a>
                <a href="#"><i class="fab fa-instagram-square"></i>Instagram</a>
            </div>
        </div>
        <div class="box__copyright">
            <hr>
            <p style="font-size: 15px">
                SERVISOFT ® 2022
                 <a href="#" style="text-decoration: none;">
                     <strong class="text-info">Consulta nuestras politicas de privacidad</strong>
                 </a>
            </p>
        </div>
    </footer>
    <script src="Js/JavaScript_Principal.js"></script>
</asp:Content>
