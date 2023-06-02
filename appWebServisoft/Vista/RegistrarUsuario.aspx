<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="RegistrarUsuario.aspx.cs" Inherits="appWebServisoft.Vista.RegistrarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://kit.fontawesome.com/e5246dcec8.js" crossorigin="anonymous"></script>
    <link href="Css/sweetalert.css" rel="stylesheet" />
    <script src="../Scripts/sweetalert.min.js"></script>
    <link href="Css/Estilos_Registro.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                    <div class="imagenIcono">
                        <i class="fa-regular fa-image" style="color: #ec4670;"></i>
                        <asp:FileUpload ID="FuImagen" runat="server" />
                    </div>
                    
                    <div class="emailIcono">
                        <i class="fa-solid fa-envelope" style="color: #ec4670;"></i>
                        <input id="txtEmail" name="txtEmail" runat="server" type="text" placeholder="Correo Electronico" required />
                    </div>
                    <div class="claveIcono">
                        <i class="fa-solid fa-key" style="color: #ec4670;"></i>
                        <input id="txtContraseña" name="txtContraseña" runat="server" type="password" placeholder="Contraseña" required />
                    </div>
                    <div class="ciudadIcono">
                        <i class="fa-solid fa-city" style="color: #ec4670;"></i>
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
                    <div class="imagenpIcono">
                        <i class="fa-solid fa-image"></i>
                    </div>
                    <div >
                        <i class="fa-regular fa-imag" style="color: #ec4670;"></i>
                        <asp:FileUpload ID="FlImagen" runat="server" />
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
