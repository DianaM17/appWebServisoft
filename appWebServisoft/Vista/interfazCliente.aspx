<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="interfazCliente.aspx.cs" Inherits="appWebServisoft.Vista.interfazCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/interfazCliente.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <section>
        <div>
            <div class="splitview skewed">
                <div class="panel bottom">
                    <div class="content">
                        <div class="description">
                            <h1>Registrate para obtener el servicio que desees.</h1>
                            <p>Con tan solo un click podràs registrarte, encontrar infinidad de servicios y ofertas que seràn de gran importancia en el momento que lo necesites.</p>
                        </div>
                        <img src="Imagenes/international Workers day (Poster) (2) (1).png" alt="Original" />
                    </div>
                </div>
                <div class="panel top">
                    <div class="content">
                        <div class="description">
                            <h1>Forma parte de nuestro grupo de profesionales.</h1>
                            <p>Haz parte de nuestra familia y ten la oportunidad de publicar los servicios que le puedas brindar a la comunidad. No dejes pasar esta maravillosa oportunidad.</p>
                        </div>
                        <img src="Imagenes/profesional.png" alt="Duotone" />
                    </div>
                </div>
                <div class="handle"></div>
            </div>
        </div>
    
    </section>

  
  <%--  Cards Profesionales--%>
    <br />
    <br />
        <div class="label-container">
        <asp:Label ID="Label2" CssClass="texto" runat="server" Text="Profesionales"></asp:Label>
    </div>
    <br />

<div class="owl-carousel owl-theme text-center">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="card mx-2 mb-2 custom-card" style="width: 240px; height: 150px;">
                <div class="card-body">
                    <img class="card-img-top align-items-center" src="/Vista/Imagenes/imagenesProfesional/<%# Eval("fotos") %>" alt="Card image cap" />
                    <h5 class="card-title"><%# Eval("nombres") %> </h5>
                    <p class="card-text"><%# Eval("apellidos") %> </p>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>



  
        <footer>
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
