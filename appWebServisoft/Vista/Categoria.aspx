<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="appWebServisoft.Vista.Categoria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/Estilos_Categoria.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div class="container">
        <div class="row">
            <asp:Repeater ID="reptCateg" runat="server">
                <ItemTemplate>
                    <div class="card-container col-6 col-md-3 col-lg-2 col-xl-2 col-sm-4">
                        <div class="custom-card">
                            <div class="card-img-box">
                                <asp:Image runat="server" ID="ImgCate" ImageUrl='<%# Eval("imagen") %>' />
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
