﻿using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Remoting;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class PerfilProfesional : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            string Telefono = lblTeleProf.Text = Session["TeleProfesional"].ToString();
            if (!IsPostBack)
            {
                ClProfesionalL obj = new ClProfesionalL();
                ClProfesionalE Buscar = obj.mtdBuscarProf(idProf);
                if (Buscar != null)
                {
                    lblNombre.Text = Session["usuario"].ToString();
                    ImgPerfil.ImageUrl = Buscar.fotos;
                    lblPerfil.Text = Buscar.perfil;
                    lblEmail.Text = Buscar.email;
                    lblDireccion.Text = Buscar.direccion;
                    lblTelefono.Text = Buscar.telefono;
                    lblServicio.Text = Buscar.servicio;
                    lblCategoria.Text = Buscar.categoria;
                    lblCiudad.Text = Buscar.nombre;
                    lblEstado.Text = Buscar.estado;

                    //ImgPerfil1.ImageUrl = Buscar.fotos;
                    txtNombres.Value = Buscar.nombres;
                    txtApellidos.Value = Buscar.apellidos;
                    txtTelefono.Value = Buscar.telefono;
                    txtEmail.Value = Buscar.email;
                    txtPassword.Value = Buscar.clave;
                    txtDireccion.Value = Buscar.direccion;
                    txtPerfil.Value = Buscar.perfil;

                    //Combo ddlCategoria
                    ClCategoriaL objCategoria = new ClCategoriaL();
                    List<ClCategoriaE> listaCategoria = new List<ClCategoriaE>();
                    listaCategoria = objCategoria.mtdListar();

                    ddlCategoria.DataSource = listaCategoria;
                    ddlCategoria.DataTextField = "categoria";
                    ddlCategoria.DataValueField = "idCategoria";
                    ddlCategoria.DataBind();
                    ddlCategoria.SelectedValue = Buscar.idCategoria.ToString();

                    //Combo ddlCiudad
                    ClCiudadD objCiudad = new ClCiudadD();
                    List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
                    listaCiudad = objCiudad.mtdListarCiudad();
                    ddlCiudad.DataSource = listaCiudad;
                    ddlCiudad.DataTextField = "nombre";
                    ddlCiudad.DataValueField = "idCiudad";
                    ddlCiudad.DataBind();
                    ddlCiudad.SelectedValue = Buscar.idCiudad.ToString();

                    //Combo ddlServicio
                    string idCateg = ddlCategoria.SelectedValue;
                    ClServicioL objServicio = new ClServicioL();
                    List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);

                    // Limpiar los elementos existentes en el ComboBox
                    ddlServicio.Items.Clear();

                    ddlServicio.DataSource = listaServicio;
                    ddlServicio.DataTextField = "servicio";
                    ddlServicio.DataValueField = "idServicio";
                    ddlServicio.DataBind();
                    ddlServicio.SelectedValue = Buscar.idServicio.ToString();
                }
            }
            //Guarda la imagen de perfil
            //if (Request.Files.Count > 0)
            //{
            //    int idProfesionall = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            //    var file = Request.Files[0];
            //    if (file != null && file.ContentLength > 0)
            //    {
            //        string Telefonoo = lblTeleProf.Text = Session["TeleProfesional"].ToString();
            //        string nombreImg = Telefonoo + ".png";
            //        string rutaImg = Server.MapPath("~/Vista/Imagenes/PerfilProfesional/" + nombreImg);
            //        string rutaSql = "~/Vista/Imagenes/PerfilProfesional/" + nombreImg;
            //        file.SaveAs(rutaImg);
            //        ClProfesionalE objProfesional = new ClProfesionalE();
            //        objProfesional.fotos = rutaSql;
            //        ClProfesionalL clProf = new ClProfesionalL();
            //        int actualizar = clProf.mtdActualizarImagen(objProfesional, idProfesionall);
            //        Response.StatusCode = 200;
            //        Response.Write("Imagen guardada correctamente.");

            //    }
            //}
            //else
            //{
            //    Response.StatusCode = 400;
            //    Response.Write("Error al guardar la imagen.");

            //}
            //Response.End();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            ClProfesionalE objProf = new ClProfesionalE();
            string Telefonoo = lblTeleProf.Text = Session["TeleProfesional"].ToString();
            string nombreImg = Telefonoo + ".png";
            string rutaImg = Server.MapPath("~/Vista/Imagenes/PerfilProfesional/" + nombreImg);
            string rutaSql = "~/Vista/Imagenes/PerfilProfesional/" + nombreImg;
            var file = Request.Files[0];
            if (imagenInput.PostedFile != null && imagenInput.PostedFile.ContentLength > 0)
            {
                file.SaveAs(rutaImg);
                objProf.fotos = rutaSql;
                ClProfesionalL clProf = new ClProfesionalL();
                int actualizar = clProf.mtdActualizarImagen(objProf, idProf);
            }
            //var file = Request.Files[0];
            //if (file != null && file.ContentLength > 0)
            //{

            //    file.SaveAs(rutaImg);
            //    objProf.fotos = rutaSql;
            //    ClProfesionalL clProf = new ClProfesionalL();
            //    int actualizar = clProf.mtdActualizarImagen(objProf, idProf);
            //}
            objProf.nombres = txtNombres.Value;
            objProf.apellidos = txtApellidos.Value;
            objProf.telefono = txtTelefono.Value;
            objProf.email = txtEmail.Value;
            objProf.clave = txtPassword.Value;
            objProf.direccion = txtDireccion.Value;
            objProf.perfil = txtPerfil.Value;
            objProf.idCategoria = int.Parse(ddlCategoria.SelectedValue.ToString());
            objProf.idServicio = int.Parse(ddlServicio.SelectedValue.ToString());
            objProf.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());

            ClProfesionalL objProfesional = new ClProfesionalL();
            int regisProf = objProfesional.mtdActualizarDatos(objProf, idProf);

            string script = @"<script> swal({ title: '¡Actualización Exitosa!',
                              text: 'Datos Registrados Exitosamente', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";

            if (regisProf == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Swal.fire({ title: 'Oops...', text: 'No hay datos en las cajas de texto!'," +
                    " icon: 'error', confirmButtonText: 'Aceptar', customClass: { confirmButton: 'swal-button swal-button--error-color' } });", true);
            }
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            ClProfesionalL obj = new ClProfesionalL();
            ClProfesionalE Buscar = obj.mtdBuscarProf(idProf);
            //Combo ddlServicio
            string idCateg = ddlCategoria.SelectedValue;
            ClServicioL objServicio = new ClServicioL();
            List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);

            // Limpiar los elementos existentes en el ComboBox
            ddlServicio.Items.Clear();

            ddlServicio.DataSource = listaServicio;
            ddlServicio.DataTextField = "servicio";
            ddlServicio.DataValueField = "idServicio";
            ddlServicio.DataBind();
            ddlServicio.SelectedValue = Buscar.idServicio.ToString();
        }

        protected void chkEstado_CheckedChanged(object sender, EventArgs e)
        {
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            ClProfesionalE objProf = new ClProfesionalE();

            string activo = "Activo";
            string inactivo = "Inactivo";
            if (chkEstado.Checked)
            {
                objProf.estado = activo;
            }
            else
            {
                objProf.estado = inactivo;
            }
            ClProfesionalL objProfesional = new ClProfesionalL();
            int regisProf = objProfesional.mtdCambiarEstado(objProf, idProf);
            string script = @"<script> swal({ title: '¡Cambio Exitoso!',
                              text: 'Su estado se ha cambiado Exitosamente', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";

            if (regisProf == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }

        protected void btnAgregarImagen_Click(object sender, EventArgs e)
        {
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            ClImagenesTrabajosE objTrab = new ClImagenesTrabajosE();
            ClProfesionalD objProf = new ClProfesionalD();
            if (FluImagen.HasFile)
            {
                string nombre = "123.png";
                string ruta = Server.MapPath("~/Vista/Imagenes/ImagenesTrabajos/" + nombre);
                string rutaSql = ("~/Vista/Imagenes/ImagenesTrabajos/" + nombre);
                FluImagen.SaveAs(ruta);

                objTrab.imagenTrabajo = rutaSql;
                objTrab.idProfesional = idProf;
                int Agregar = objProf.mtdRegistrarTrabajo(objTrab);

                string script = @"<script> swal({ title: '¡Registro Exitoso!',
                              text: 'La imagen se agrego con exito', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";

                if (Agregar == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
                }

            }

        }

        //protected void ImgPerfil_PreRender(object sender, EventArgs e)
        //{
        //    int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
        //    if (ImgPerfil.ImageUrl != "")
        //    {
        //        string nombre = Session["TeleProfesional"].ToString();
        //        string nombreImg = nombre + ".png";
        //        string rutaImg = Server.MapPath("~/Vista/Imagenes/PerfilProfesional/" + nombreImg);
        //        string rutaSql = "~/Vista/Imagenes/PerfilProfesional/" + nombreImg;

        //        ClProfesionalE objPro = new ClProfesionalE();
        //        objPro.fotos = rutaImg;

        //        ClProfesionalL objProfesional = new ClProfesionalL();
        //        int regis = objProfesional.mtdActualizarImagen(objPro, idProf);
        //        GuardarImagenEnCarpetaProyecto(rutaImg);
        //    }
        //}
        //private void GuardarImagenEnCarpetaProyecto(string rutaImg)
        //{
        //    // Obtener el control FileUpload desde el formulario
        //    FileUpload fileUpload = (FileUpload)FindControl("FileUploadControl");

        //    // Guardar la imagen en la ruta personalizada dentro de la carpeta del proyecto
        //    fileUpload.SaveAs(rutaImg);
        //}
    }
}

