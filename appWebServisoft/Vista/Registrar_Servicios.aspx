<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="Registrar_Servicios.aspx.cs" Inherits="appWebServisoft.Vista.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <title>Registrar Servicio</title>
    <link href="Css/Estilos_registrarServ.css" rel="stylesheet" />
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
                <img src="Imagenes/6945535.jpg" alt="">
                <div class="text">
                    <span class="text-1">Con la categoria registrada
                        <br>
                    podrás vincular el servicio que desees</span>
                <span class="text-2">Regístrate con la categoria y servicio de tu preferencia!.</span>
                </div>
            </div>
        </div>
        <div class="forms">
            <div class="form-content">
                <div class="login-form">
                    <div class="title">Registrar Servicios</div>
                    <div action="#">
                        <div class="input-boxes">
                            <div class="input-box">
                                
                                <asp:Label ID="Label1" runat="server" Text="Label">Elegir Categoria: </asp:Label>
                                <asp:DropDownList ID="ddlCategoria" runat="server"></asp:DropDownList>
                            </div>
                            <div class="input-box">
                                <i class="fa-solid fa-screwdriver-wrench"></i>
                                <asp:TextBox ID="txtServicio" placeholder="Ingresar Servicio" runat="server"></asp:TextBox>
                            </div>
                            <div class="button input-box">
                                <asp:Button ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
