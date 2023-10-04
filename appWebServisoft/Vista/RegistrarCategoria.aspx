<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="RegistrarCategoria.aspx.cs" Inherits="appWebServisoft.Vista.RegistrarCategoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <title>Registrar Categoria</title>
    <link href="Css/Estilos_RegistrarCategoria.css" rel="stylesheet" />
    <!-- Fontawesome CDN Link -->
    <script src="https://kit.fontawesome.com/e5246dcec8.js" crossorigin="anonymous"></script>
    <script src="../Scripts/sweetalert.min.js"></script>
    <link href="Css/sweetalert.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <input type="checkbox" id="flip">
        <div class="cover">
            <div class="front">
                <img src="Imagenes/20944146.jpg" alt="">
                <div class="text">
                    <span class="text-1">Registra tu categoria
                        <br>
                        & haz parte de nuestra familia</span>
                    <span class="text-2">No dudes en hacerlo!</span>
                </div>
            </div>
        </div>
        <div class="forms">
            <div class="form-content">
                <div class="login-form">
                    <div class="title">Registrar Categoria</div>
                    <div action="#">
                        <div class="input-boxes">
                            <div class="input-box">
                                <i class="fa-solid fa-user-nurse"></i>
                                <asp:TextBox ID="txtCategoria" placeholder="Ingresa la categoria" runat="server"></asp:TextBox>
                            </div>
                            <div class="input-box">
                                <i class="fa-regular fa-image"></i>
                                <asp:FileUpload ID="FuImagen" runat="server" />
                            </div>
                            <div class="button input-box">
                                <asp:Button ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
