 <%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="appWebServisoft.Vista.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Estilos_Principal..css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link href="Css/sweetalert.css" rel="stylesheet" />
    <script src="../Scripts/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <div class="card col-3">
                    <div class="face front">
                        <img src="Imagenes/3918929.jpg" alt="">
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
                <div class="card col-3">
                    <div class="face front">
                        <img src="Imagenes/2978479.jpg" alt="">
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
                <div class="card col-3">
                    <div class="face front">
                        <img src="Imagenes/6325230.jpg" alt="">
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
    <section class="principal">

        <%-- Inicio Perfiles Profesionales --%>
        <div class="principal" style="display: flex">
            <div class="wrapper">
                <i id="left" class="fa-solid fa-angle-left"></i>
                <ul class="carousel">
                    <asp:Repeater ID="ReptPerfil" runat="server">
                        <ItemTemplate>
                            <li class="card">
                                <div class="img">
                                    <img class="imagenes" src="Imagenes/PerfilProfesional/<%# Eval("fotos") %>" alt="Card image cap" style="max-width: 100%; max-height: 100%; object-fit: cover;" />
                                </div>
                                <asp:Label runat="server" ID="lblNombre" Text='<%# Eval("nombres") %>'></asp:Label>
                                <asp:Label runat="server" ID="lblApellido" Text='<%# Eval("apellidos") %>'></asp:Label>
                                <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("categoria") %>'></asp:Label>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                    <%--<li class="card">
                        <div class="img">
                            <img src="Imagenes/img-2.jpg" alt="img" draggable="false">
                        </div>
                        <h2>Joenas Brauers</h2>
                        <span>Web Developer</span>
                    </li>
                    <li class="card">
                        <div class="img">
                            <img src="Imagenes/img-3.jpg" alt="img" draggable="false">
                        </div>
                        <h2>Lariach French</h2>
                        <span>Online Teacher</span>
                    </li>
                    <li class="card">
                        <div class="img">
                            <img src="Imagenes/img-4.jpg" alt="img" draggable="false">
                        </div>
                        <h2>James Khosravi</h2>
                        <span>Freelancer</span>
                    </li>
                    <li class="card">
                        <div class="img">
                            <img src="Imagenes/img-5.jpg" alt="img" draggable="false">
                        </div>
                        <h2>Kristina Zasiadko</h2>
                        <span>Bank Manager</span>
                    </li>
                    <li class="card">
                        <div class="img">
                            <img src="Imagenes/img-6.jpg" alt="img" draggable="false">
                        </div>
                        <h2>Donald Horton</h2>
                        <span>App Designer</span>
                    </li>--%>
                </ul>
                <i id="right" class="fa-solid fa-angle-right"></i>
            </div>
        </div>
        <script src="Js/JavaScript_Perfiles.js"></script>
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
                    <p>Es una página que cuenta con diversos profesionales quienes estan especializados en diferentes campos y siepmre están prestos a brindar su ayuda.</p>
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
    <br />
    <br />
    <%-- Fin testimonios --%>
    <section>
        <link href="Css/Estilos_Principal.css" rel="stylesheet" />
        <%--Inicia Formulario de contacto--%>
        <div class="container">
            <span class="big-circle"></span>
            <img src="Imagenes/images/shape.png" class="square" alt="" />
            <div class="form">
                <div class="contact-info">
                    <h3 class="title">Puedes Contáctarte con nosotros!!</h3>
                    <p class="text">
                        Si necesitás contactarnos para hacer alguna consulta o sumplemente para dejar tu comentario,
                        puedes tener la libertad de hacerlo. Repondemos en horario laboral.
                    </p>

                    <div class="info">
                        <div class="information">
                            <img src="Imagenes/images/location.png" class="icon" alt="" />
                            <p>Sogamoso - Boyacá</p>
                        </div>
                        <div class="information">
                            <img src=".." class="icon" alt="" />
                            <p>servisoft1710@gmail.com</p>
                        </div>
                        <div class="information">
                            <img src="Imagenes/images/phone.png" class="icon" alt="" />
                            <p>310-241-2563</p>
                        </div>
                    </div>

                    <div class="social-media">
                        <p>Conectate con nosotros :</p>
                        <div class="social-icons">
                            <a href="#">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a href="#">
                                <i class="fab fa-linkedin-in"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="contact-form">
                    <span class="circle one"></span>
                    <span class="circle two"></span>

                    <form action="index.html" autocomplete="off">
                        <h3 class="title">Contáctanos</h3>
                        <div class="input-container">
                            <input id="txtNombre" type="text" name="txtNombre" class="input" runat="server" />
                            <label for="">Usuario</label>
                            <span>Username</span>
                        </div>
                        <div class="input-container">
                            <input id="txtEmail" type="email" name="txtEmail" class="input" runat="server" />
                            <label for="">Correo</label>
                            <span>Email</span>
                        </div>
                        <div class="input-container">
                            <input id="txtTelefono" type="tel" name="txtTelefono" class="input" runat="server" />
                            <label for="">Telefono</label>
                            <span>Phone</span>
                        </div>
                        <div class="input-container textarea">
                            <textarea id="txtMessage" name="txtMessage" class="input" runat="server"></textarea>
                            <label for="">Mensaje</label>
                            <span>Message</span>
                        </div>
                        <asp:Button ID="btnEnviar" runat="server" Text="Contactar" CssClass="btn" OnClick="btnEnviar_Click" />
                        <%-- <input id="btnEnviarr" type="submit" value="Send" class="btn" />--%>
                    </form>
                </div>
            </div>
        </div>
        <script src="Js/JavaScript_Contacto.js"></script>
    </section>
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
</asp:Content>
