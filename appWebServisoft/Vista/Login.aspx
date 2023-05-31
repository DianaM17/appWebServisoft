<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="appWebServisoft.Vista.Loginn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Estilos_Login.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container">
            <div class="row principal middle-xs between-xs first">
                <div class="col-xs-4 col-md-5">
                    <div class="screen">
                        <div class="screen__content">
                            <div class="login" runat="server">
                                <div class="login__field">
                                    <i class="login__icon fas fa-user"></i>
                                    <input id="txtEmail" name="txtEmail" runat="server" type="text" class="login__input" placeholder="User name / Email" />
                                </div>
                                <div class="login__field">
                                    <i class="login__icon fas fa-lock"></i>
                                    <input id="txtClave" name="txtClave" runat="server" type="password" class="login__input" placeholder="Password" />
                                </div>
                                <button class="button login__submit" type="submit" id="btnIngresar" runat="server" onserverclick="btnIngresar_ServerClick">
                                    <span class="button__text">Ingresar</span>
                                    <i class="button__icon fas fa-chevron-right"></i>
                                </button>
                                <br />
                                <a href="RecuperaciónContraseña.aspx" style="text-decoration: none; color: #000000">¿Olvidaste tu contraseña?</a>
                            </div>
                            <div class="social-login">
                                <h3>log in via</h3>
                                <div class="social-icons">
                                    <a href="#" class="social-login__icon fab fa-instagram"></a>
                                    <a href="#" class="social-login__icon fab fa-facebook"></a>
                                    <a href="#" class="social-login__icon fab fa-twitter"></a>
                                </div>
                            </div>
                        </div>
                        <div class="screen__background">
                            <span class="screen__background__shape screen__background__shape4"></span>
                            <span class="screen__background__shape screen__background__shape3"></span>
                            <span class="screen__background__shape screen__background__shape2"></span>
                            <span class="screen__background__shape screen__background__shape1"></span>
                        </div>
                    </div>
                </div>
                <div style="height: 600px" class="col-xs-12 col-md-2 first-xs">
                    <img src="Imagenes/3099609.jpg" style="width: 600px" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>

