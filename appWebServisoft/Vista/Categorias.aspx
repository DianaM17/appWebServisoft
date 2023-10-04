<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/Site2.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="appWebServisoft.Vista.Categorias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Estilos_Categoria.css" rel="stylesheet" />
    <link href="Css/Estilos_Categ.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
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
                    <div class="card-container col-6 col-sm-4 col-md-3 col-lg-s col-xl-2" onclick="seleccionarCategoria('<%# Eval("idCategoria") %>')">
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
    </div>
    <br />
    <h4 style="text-align:center; padding:10px 0; margin:0; font-size:30px" >Servicios</h4>
    <div id="tarjetasServicios" class="row">
        <!-- Aquí se agregarán las tarjetas -->
    </div>

    <script>
        function seleccionarCategoria(idCategoria) {
            //Realiza una llamada por ajax al servidor
            $.ajax({
                type: "POST",
                url: "Categorias.aspx/ObtenerServicioPorCategoria",
                data: JSON.stringify({ idCategoria: idCategoria }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log("Respuesta del servidor:", response);

                    // Manejar la respuesta del servidor y enlazarla al Repeater de Servicios
                    var servicios = response.d; // Suponiendo que los datos se devuelvan en un formato JSON
                    enlazarRepeaterServicios(servicios);
                    scrollToTarjetasServicios();
                },
                error: function (error) {
                    console.log("Error al obtener servicios: " + error);
                }
            });
        }

        function enlazarRepeaterServicios(servicios) {
            console.log("Servicios enlazados:", servicios);
            var tarjetasServicios = $("#tarjetasServicios"); // Obtener el elemento donde se agregarán las tarjetas

            // Limpiar cualquier contenido anterior
            tarjetasServicios.empty();

            for (var i = 0; i < servicios.length; i++) {
                var servicio = servicios[i];

                // Crear la estructura de la tarjeta
                var tarjetaHTML = '<div class="card-container col-6 col-sm-4 col-md-3 col-lg-s col-xl-2">';
                tarjetaHTML += '<div class="custom-cards">';
                tarjetaHTML += '<img src="' + servicio.imagen + '" class="card-img-box" alt="Imagen del servicio">'; // Agregar la imagen
                tarjetaHTML += '</div>';
                tarjetaHTML += '<div class="card-content">';
                tarjetaHTML += '<h6 class="card-title">' + servicio.servicio + '</h6>';
                /*tarjetaHTML += '<p class="card-text">Descripción u otros datos del servicio.</p>';*/
                tarjetaHTML += '</div>';
                tarjetaHTML += '</div>';

                // Agregar la tarjeta al elemento tarjetasServicios
                tarjetasServicios.append(tarjetaHTML);
            }
        }
        function scrollToTarjetasServicios() {
            var tarjetasServicios = document.getElementById("tarjetasServicios");
            tarjetasServicios.scrollIntoView({ behavior: "smooth" }); // Desplazamiento suave
        }
    </script>
</asp:Content>
