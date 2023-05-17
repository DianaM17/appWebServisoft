<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="appWebServisoft.Vista.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <link href="Css/Estilos_Principal.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
        <script src="Js/JavaScript_Principal.js"></script>
    </section>
    <%-- Inicio Cards --%>
    <section>
        <div class="container">
            <div class="row justify-content-evenly">
                <div class="card col-4">
                    <div class="face front">
                        <img src="Imagenes/AVISO2-1.png" alt="">
                        <h3>BUSCAS SERVICIOS</h3>
                    </div>
                    <div class="face back">
                        <h3>BUSCAS SERVICIOS</h3>
                        <p>
                            En la plataforma contarás con diverson servicios, los cuales serán brindadros por 
                cada uno de los profesionales que se encuentren registrados. La busqueda podrá ser 
                realizada de forma rápida y sencilla.
                        </p>
                    </div>
                </div>
                <div class="card">
                    <div class="face front">
                        <img src="Imagenes/aviso1-1.png" alt="">
                        <h3>TRABAJOS REALIZADOS</h3>
                    </div>
                    <div class="face back">
                        <h3>TRABAJOS REALIZADOS</h3>
                        <p>
                            Como profesional, podrás publicar cada uno de los trabajos realizados. Dando a conocer a los usuarios 
                        de la plataforma las habilidades con las que cuentas y los servicios que les puedes ofrecer.
                        </p>
                    </div>
                </div>
                <div class="card">
                    <div class="face front">
                        <img src="Imagenes/aviso3.png" alt="">
                        <h3>REALIZAR REGISTROS</h3>
                    </div>
                    <div class="face back">
                        <h3>REALIZAR REGISTROS</h3>
                        <p>
                            Como cliente, debes realizar el registro corresondiente para que puedas comunicarte con un profesional 
                   y así resolver dudas o inquietudes que tengas al respecto.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%-- Inicio Testimonios --%>
    <section class="testimonios">
        <div class="testimonios_header">
            <h1>COMENTARIOS</h1>
        </div>
        <div class="testimonios_contenedor">
            <div class="testimonios_caja">
                <div class="caja-top">
                    <div class="perfil">
                        <div class="perfil-img">
                            <img src="Imagenes/foto1.jpg" />
                        </div>
                        <div class="nombre-usuario">
                            <strong>Andrea Torres</strong>
                            <span>@Torres_Andre</span>
                        </div>
                    </div>
                    <div class="reseña">
                        <i class="bi bi-star-fill"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                </div>
                <div class="comentarios-cliente">
                    <p>Es una página estupenda, ya que soluciono el inconveniente que tenia. El servicio brindado por el profesional fue excelente, la recomedaria en varias ocasiones. </p>
                </div>
            </div>
            <div class="testimonios_caja">
                <div class="caja-top">
                    <div class="perfil">
                        <div class="perfil-img">
                            <img src="Imagenes/foto2.jpg" />
                        </div>
                        <div class="nombre-usuario">
                            <strong>Fernando Manrrique</strong>
                            <span>@manFernando12</span>
                        </div>
                    </div>
                    <div class="reseña">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
                <div class="comentarios-cliente">
                    <p>Agradezco a SERVISOFT por brindarme la posibilidad de contratar un servicio a través de esta plataforma, algo muy práctico y factible hoy en día.</p>
                </div>
            </div>
            <div class="testimonios_caja">
                <div class="caja-top">
                    <div class="perfil">
                        <div class="perfil-img">
                            <img src="Imagenes/foto3.jpg" />
                        </div>
                        <div class="nombre-usuario">
                            <strong>Marcela Barrera</strong>
                            <span>@barrmarce34</span>
                        </div>
                    </div>
                    <div class="reseña">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                </div>
                <div class="comentarios-cliente">
                    <p>Es una ágina que cuenta con diversos profesionales quienes estan especializados en diferentes campos y siepmre están prestos a brindar su ayuda.</p>
                </div>
            </div>
            <div class="testimonios_caja">
                <div class="caja-top">
                    <div class="perfil">
                        <div class="perfil-img">
                            <img src="Imagenes/foto4.jpg" />
                        </div>
                        <div class="nombre-usuario">
                            <strong>Manuel Goméz</strong>
                            <span>@gomezmanu56</span>
                        </div>
                    </div>
                    <div class="reseña">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fa-regular fa-star"></i>
                    </div>
                </div>
                <div class="comentarios-cliente">
                    <p>Solicite un servicio de pintura para mi casa y todo salio a la perfección, el trabajo fue entregado en el momento indicado y fue basado en lo que se quería.</p>
                </div>
            </div>
            <div class="testimonios_caja">
                <div class="caja-top">
                    <div class="perfil">
                        <div class="perfil-img">
                            <img src="Imagenes/foto5.jpg" />
                        </div>
                        <div class="nombre-usuario">
                            <strong>Martha Nuñez</strong>
                            <span>@NuñezMartha34</span>
                        </div>
                    </div>
                    <div class="reseña">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half"></i>
                    </div>
                </div>
                <div class="comentarios-cliente">
                    <p>Solicite un servicio de limpieza ara el hogar y llegó en el momento indicado. Quedé satisfecha con el trabajo realizdo.</p>
                </div>
            </div>
        </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <footer class="footer-99382">
        <div class="container">
            <div class="row">
                <div class="col-md-6 pr-md-5">
                    <a href="#" class="footer-site-logo d-block mb-4">SERVISOFT</a>
                    <p>Contamos con un grupo de profesionales quienes son los encargados de resolver cualquier problema que se le pueda presentar</p>
                </div>
                <div class="col-md-3">
                    <h3>About</h3>
                    <ul class="list-unstyled nav-links">
                        <li><a href="#">Clients</a></li>
                        <li><a href="#">Team</a></li>
                        <li><a href="#">Career</a></li>
                        <li><a href="#">Testimonials</a></li>
                        <li><a href="#">Journal</a></li>
                    </ul>
                </div>
                <div class="col-md-3">
                    <h3>Follow Us</h3>
                    <ul class="social list-unstyled">
                        <li><a href="#" class="pl-0"><span class="icon-instagram"></span></a></li>
                        <li><a href="#"><span class="icon-twitter"></span></a></li>
                        <li><a href="#"><span class="icon-facebook"></span></a></li>
                        <li><a href="#"><span class="icon-pinterest"></span></a></li>
                        <li><a href="#"><span class="icon-dribbble"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="row ">
                <div class="col-12 text-center">
                    <div class="copyright mt-5 pt-5">
                        <p><small>&copy; 2019&mdash;2020 All Rights Reserved.</small></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <%-- Fin testimonios --%>
</asp:Content>
