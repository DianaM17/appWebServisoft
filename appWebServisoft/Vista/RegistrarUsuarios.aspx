<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="RegistrarUsuarios.aspx.cs" Inherits="appWebServisoft.Vista.RegistrarUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet" />--%>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
    <%--<link href="Css/Estilos_Registro.css" rel="stylesheet" />--%>
    <link href="Css/sweetalert.css" rel="stylesheet" />
    <script src="../Scripts/sweetalert.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                text-decoration: none;
                font-family: 'Roboto', sans-serif;
            }

            body {
                min-height: 100vh;
                /*background-image: url('../Imagenes/Fondo.png');*/
                background-size: cover;
                background-repeat: no-repeat;
                background-position: center center;
                background-attachment: fixed;
            }

            main {
                width: 100%;
                padding: 20px;
                margin: auto;
                margin-top: 100px;
            }

            .contenedor__todo {
                width: 100%;
                max-width: 800px;
                margin: auto;
                position: relative;
            }

            .caja__trasera {
                width: 100%;
                padding: 10px 20px;
                display: flex;
                justify-content: center;
                -webkit-backdrop-filter: blur(10px);
                backdrop-filter: blur(10px);
                background-color: #f1aaaa;
                opacity: .7;
            }


                .caja__trasera div {
                    margin: 100px 40px;
                    color: white;
                    transition: all 500ms;
                }


                    .caja__trasera div p,
                    .caja__trasera button {
                        margin-top: 30px;
                    }

                    .caja__trasera div h3 {
                        font-weight: 400;
                        font-size: 26px;
                    }

                    .caja__trasera div p {
                        font-size: 16px;
                        font-weight: 300;
                    }

                .caja__trasera button {
                    padding: 10px 40px;
                    border: 2px solid #fff;
                    font-size: 14px;
                    margin-left: 20px;
                    background: transparent;
                    font-weight: 600;
                    cursor: pointer;
                    color: white;
                    outline: none;
                    transition: all 300ms;
                }

                    .caja__trasera button:hover {
                        background: #fff;
                        color: #fd466b;
                    }

            /*Formularios*/

            .contenedor__login-register {
                display: flex;
                align-items: center;
                width: 100%;
                max-width: 380px;
                position: relative;
                top: -185px;
                left: 10px;
                /*La transicion va despues del codigo JS*/
                transition: left 500ms cubic-bezier(0.175, 0.885, 0.320, 1.275);
            }

            .contenedor__login-register {
                width: 100%;
                padding: 80px 20px;
                background: white;
                position: absolute;
                border-radius: 20px;
            }

                .contenedor__login-register h2 {
                    font-size: 30px;
                    text-align: center;
                    margin-bottom: 20px;
                    color: #dd4444;
                }

                .contenedor__login-register input {
                    width: 100%;
                    margin-top: 20px;
                    padding: 10px;
                    padding-left: 40px;
                    border: none;
                    background: #F2F2F2;
                    font-size: 16px;
                    outline: none;
                    border-radius: 4px;
                    box-sizing: border-box;
                    transition: 1s;
                }

                    .contenedor__login-register input[type=text]:focus {
                        border-color: dodgerblue;
                        box-shadow: 0 0 8px 0 dodgerBlue;
                    }

            .combo {
                width: 100%;
                margin-top: 20px;
                padding: 10px;
                padding-left: 40px;
                border: none;
                background: #F2F2F2;
                font-size: 16px;
                outline: none;
                border-radius: 4px;
                box-sizing: border-box;
                transition: 1s;
            }

            .nombreIcono i {
                position: absolute;
                left: 25px;
                top: 160px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .apellidoIcono i {
                position: absolute;
                left: 25px;
                top: 218px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .direccionIcono i {
                position: absolute;
                left: 25px;
                top: 287px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .telefonoIcono i {
                position: absolute;
                left: 25px;
                top: 350px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .emailIcono i {
                position: absolute;
                left: 25px;
                top: 417px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .clavelIcono i {
                position: absolute;
                left: 25px;
                top: 480px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .nombrepIcono i {
                position: absolute;
                left: 25px;
                top: 197px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .apellidopIcono i {
                position: absolute;
                left: 25px;
                top: 255px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .direccionpIcono i {
                position: absolute;
                left: 25px;
                top: 322px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .telefonopIcono i {
                position: absolute;
                left: 25px;
                top: 387px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .emailpIcono i {
                position: absolute;
                left: 25px;
                top: 452px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .clavepIcono i {
                position: absolute;
                left: 25px;
                top: 515px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .perfilpIcono i {
                position: absolute;
                left: 25px;
                top: 580px;
                padding: 9px 8px;
                color: #aaa;
                transition: 3s;
            }

            .contenedor__login-register button {
                padding: 15px 40px;
                margin-top: 40px;
                margin-left: 80px;
                border: none;
                font-size: 14px;
                background: #fd466b;
                font-weight: 600;
                cursor: pointer;
                color: white;
                outline: none;
            }




            .formulario__login {
                opacity: 1;
                display: block;
            }

            .formulario__register {
                display: none;
            }



            @media screen and (max-width: 850px) {

                main {
                    margin-top: 50px;
                }

                .caja__trasera {
                    max-width: 350px;
                    height: 300px;
                    flex-direction: column;
                    margin: auto;
                }

                    .caja__trasera div {
                        margin: 0px;
                        position: absolute;
                    }


                /*Formularios*/

                .contenedor__login-register {
                    top: -10px;
                    left: -5px;
                    margin: auto;
                }

                .contenedor__login-register {
                    position: relative;
                }
            }
        </style>
        <div class="contenedor__todo">
            <div class="caja__trasera">
                <div class="caja__trasera-login">
                    <h3>¿Quieres solicitar alguno de nuestros servicios?</h3>
                    <p>Regístrate como cliente, solo estás a un click</p>
                    <button id="btn__iniciar-sesion">CLIENTE</button>
                </div>
                <div class="caja__trasera-register">
                    <h3>¿Deseas registrarte como profesional?</h3>
                    <p>Ingresa los datos y da click en el boton de regístrarse</p>
                    <button id="btn__registrarse">PROFESIONAL</button>
                </div>
            </div>

            <!--Formulario de Login y registro-->
            <div class="contenedor__login-register">
                <!--Login-->
                <div class="formulario__login">
                    <h2>Registrarse como cliente</h2>
                    <div class="nombreIcono">
                        <i class="fa-solid fa-user" style="color: #ec4670;"></i>
                        <input id="txtNombres" name="txtNombres" runat="server" type="text" placeholder="Nombres" required />
                    </div>
                    <div class="apellidoIcono">
                        <i class="bi bi-person-square" style="color: #ec4670;"></i>
                        <input id="txtApellidos" name="txtApellidos" runat="server" type="text" placeholder="Apellidos" required />
                    </div>
                    <div class="direccionIcono">
                        <i class="fa-solid fa-house" style="color: #ec4670;"></i>
                        <input id="txtDireccion" name="txtDireccion" runat="server" type="text" placeholder="Direccion" required />
                    </div>
                    <div class="telefonoIcono">
                        <i class="fa-solid fa-phone-volume" style="color: #ec4670;"></i>
                        <input id="txtTelefono" name="txtTelefono" runat="server" type="text" placeholder="Telefono" required />
                    </div>
                    <div class="emailIcono">
                        <i class="fa-solid fa-envelope" style="color: #ec4670;"></i>
                        <input id="txtEmail" name="txtEmail" runat="server" type="text" placeholder="Correo Electronico" required />
                    </div>
                    <div class="clavelIcono">
                        <i class="fa-solid fa-key" style="color: #ec4670;"></i>
                        <input id="txtContraseña" name="txtContraseña" runat="server" type="password" placeholder="Contraseña" required />
                    </div>
                    <div class="clavelIcono">
                        <i class="fa-solid fa-key" style="color: #ec4670;"></i>
                        <asp:DropDownList ID="ddlCiudad" runat="server" CssClass="combo" required></asp:DropDownList>
                    </div>
                    <button id="btnRegistrarCliente" type="submit" runat="server" onserverclick="btnRegistrarCliente_ServerClick">Regístrarse</button>
                </div>
                <!--Register-->
                <div class="formulario__register">
                    <h2>Registrase como profesional</h2>
                    <div class="nombrepIcono">
                        <i class="fa-solid fa-user-tie" style="color: #ec4670;"></i>
                        <input id="txtNombresP" name="txtNombresP" runat="server" type="text" placeholder="Nombres" required />
                    </div>
                    <div class="apellidopIcono">
                        <i class="bi bi-person-lines-fill" style="color: #ec4670;"></i>
                        <input id="txtApellidosP" name="txtApellidosP" runat="server" type="text" placeholder="Apellidos" required />
                    </div>
                    <div class="direccionpIcono">
                        <i class="fa-solid fa-house-user" style="color: #ec4670;"></i>
                        <input id="txtDireccionP" name="txtDireccionP" runat="server" type="text" placeholder="Direccion" required />
                    </div>
                    <div class="telefonopIcono">
                        <i class="fa-solid fa-phone" style="color: #ec4670;"></i>
                        <input id="txtTelefonoP" name="txtTelefonoP" runat="server" type="text" placeholder="Telefono" required />
                    </div>
                    <div class="emailpIcono">
                        <i class="fa-solid fa-envelope" style="color: #ec4670;"></i>
                        <input id="txtEmailP" name="txtEmailP" runat="server" type="text" placeholder="Correo Electronico" required />
                    </div>
                    <div class="clavepIcono">
                        <i class="fa-solid fa-key" style="color: #ec4670;"></i>
                        <input id="txtClaveP" name="txtClaveP" runat="server" type="password" placeholder="Contraseña" required />
                    </div>
                    <div class="perfilpIcono">
                        <i class="fa-solid fa-address-card" style="color: #ec4670;"></i>
                        <input id="txtPerfilP" name="txtPerfilP" runat="server" type="text" placeholder="Perfil Profesional" required />
                    </div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="clavelIcono">

                                <asp:DropDownList ID="ddlCategoria" CssClass="combo" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" required></asp:DropDownList>
                            </div>
                            <div class="clavelIcono">

                                <asp:DropDownList ID="ddlServicio" CssClass="combo" runat="server" required></asp:DropDownList>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="clavelIcono">
                        <asp:DropDownList ID="ddlCiudadd" CssClass="combo" runat="server" required></asp:DropDownList>
                    </div>
                    <button id="BtnRegistrarProfesional" type="submit" runat="server" onserverclick="BtnRegistrarProfesional_ServerClick">Regístrarse</button>
                </div>
            </div>
        </div>
        <script src="Js/JavaScript_Registrar.js"></script>
    </main>
</asp:Content>
