<%@ Page Title="" Language="C#" MasterPageFile="~/Vista/MasterCliente.Master" AutoEventWireup="true" CodeBehind="busquedaCliente.aspx.cs" Inherits="appWebServisoft.Vista.busquedaCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Estilos_Categoria.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    
      <div class="container">
        <div class="row">
            <asp:Repeater ID="reptCateg" runat="server">
                <ItemTemplate>
                    <div class="card-container col-6 col-sm-4 col-md-3 col-lg-s	col-xl-2">
                        <div class="custom-card">
                            <div class="card-img-box">
                                <asp:Image CssClass="imagenes" runat="server" ID="ImgCate" ImageUrl='<%# Eval("imagen") %>' />
                            </div>
                            <div class="card-content"> 
                                <asp:Label runat="server" ID="lblCategoria" Text='<%# Eval("categoria") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
