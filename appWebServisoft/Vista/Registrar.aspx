<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="appWebServisoft.Vista.Registrar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Css/Estilos_Registro.css" rel="stylesheet" />
</head>
<body>
    <main>
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
                <form class="formulario__login">
                    <h2>Registrarse como cliente</h2>
                    <div class="nombreIcono">
                        <i class="fa-solid fa-user" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Nombres" required>
                    </div>
                    <div class="apellidoIcono">
                        <i class="bi bi-person-square" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Apellidos" required>
                    </div>
                    <div class="direccionIcono">
                        <i class="fa-solid fa-house" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Direccion" required>
                    </div>
                    <div class="telefonoIcono">
                        <i class="fa-solid fa-phone-volume" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Telefono" required>
                    </div>
                    <div class="emailIcono">
                        <i class="fa-solid fa-envelope" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Correo Electronico" required>
                    </div>
                    <div class="clavelIcono">
                        <i class="fa-solid fa-key" style="color: #ec4670;"></i>
                        <input type="password" placeholder="Contraseña" required>
                    </div>

                    <button>Regístrarse</button>
                </form>

                <!--Register-->
                <form class="formulario__register">
                    <h2>Registrase como profesional</h2>
                    <div class="nombrepIcono">
                        <i class="fa-solid fa-user-tie" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Nombres" required>
                    </div>
                    <div class="apellidopIcono">
                        <i class="bi bi-person-lines-fill" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Apellidos" required>
                    </div>
                    <div class="direccionpIcono">
                        <i class="fa-solid fa-house-user" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Direccion" required>
                    </div>
                    <div class="telefonopIcono">
                        <i class="fa-solid fa-phone" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Telefono" required>
                    </div>
                    <div class="emailpIcono">
                        <i class="fa-solid fa-envelope" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Correo Electronico" required>
                    </div>
                    <div class="clavepIcono">
                        <i class="fa-solid fa-key" style="color: #ec4670;"></i>
                        <input type="password" placeholder="Contraseña" required>
                    </div>
                    <div class="perfilpIcono">
                        <i class="fa-solid fa-address-card" style="color: #ec4670;"></i>
                        <input type="text" placeholder="Perfil Profesional" required>
                    </div>

                    <button>Regístrarse</button>
                </form>
            </div>
        </div>

    </main>
    <script src="Js/JavaScript_Registrar.js"></script>
</body>
</html>
