<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="appWebServisoft.Vista.Categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Estilos_Categoria.css" rel="stylesheet" />
    <link href="Css/Estilos_Categ.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main>
        <!-- Hero Start -->
        <style>
            .container {
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }

            .column {
                flex: 1;
                padding: 20px;
                box-sizing: border-box;
            }
        </style>
        <section class="hero">
            <div class="row container">
                <div class="column">
                    <h2>Registra Los Servicios & 
                        <br />
                        Categorias Que No Se Encuentren</h2>
                    <p>En este apartado, podrás observar los servicios y categorias que se encuentran disponibles. Sin embargo, si eres profesiones y tu profesion no se encuentra disponible, puedes registrarla con tan solo un clic.</p>
                    <br />
                    <div class="buttons">
                        <a class="btn" href="Registrar_Servicios.aspx">Registrar Servicios</a>
                        <a class="btn" href="RegistrarCategoria.aspx">Registrar Categorias</a>

                    </div>
                </div>
                <div class="column">
                    <img src="Imagenes/hero.png" alt="heroImg" class="hero_img" />
                </div>
            </div>

            <img src="Imagenes/bg-bottom-hero.png" alt="" class="curveImg" />
        </section>
        <!-- Hero End-->
    </main>

    <div class="container">
        <div class="row">
            <asp:Repeater ID="reptCateg" runat="server">
                <ItemTemplate>
                    <div class="card-container col-6 col-sm-4 col-md-3 col-lg-s	col-xl-2" onclick="redirectToPage('')">
                        <div class="custom-card">
                            <div class="card-img-box">
                                <asp:Image CssClass="imagenes" runat="server" ID="ImgCate" ImageUrl='<%# Eval("imagen") %>' />
                            </div>
                        </div>
                        <div class="card-content">
                            <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("categoria") %>'></asp:Label>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rpServicios" runat="server">
                    <ItemTemplate>
                        <div class="card-container col-6 col-sm-4 col-md-3 col-lg-s	col-xl-2" onclick="redirectToPage('')">
                            <div class="custom-card">
                                <div class="card-img-box">
                                    <asp:Image CssClass="imagenes" runat="server" ID="ImgCate" ImageUrl='<%# Eval("imagen") %>' />
                                </div>
                            </div>
                            <div class="card-content">
                                <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("servicio") %>'></asp:Label>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>




                <%--    <div class="card-container col-6 col-sm-4 col-md-3 col-lg-s	col-xl-2">
                <div class="custom-card">
                    <div class="card-img-box">
                        <img src="Imagenes/NuevaCategoria.jpg" />
                    </div>
                </div>--%>
                <%--  <div class="card-content">
                    <a href="RegistrarCategoria.aspx" style="text-decoration: none; color: #000000">Registrar
                        <br />
                        Categoria</a>
                </div>--%>
            </div>
        </div>
</asp:Content>
