using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class perfilCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int idCliente = Int32.Parse(lblidCliente.Text = Session["idCliente"].ToString());
                if (!IsPostBack)
                {
                    ClClienteL objCliente = new ClClienteL();
                    ClClienteE Buscar = objCliente.mtdSeleccionarCliente(idCliente);
                    if (Buscar != null)
                    {
                        lblNombre.Text = Session["Usuario"].ToString();
                        txtNombre.Value = Buscar.nombres;
                        txtApellido.Value = Buscar.apellidos;
                        txtDireccionC.Value = Buscar.direccion;
                        txtTelefonoC.Value = Buscar.telefono;
                        txtEmailC.Value = Buscar.email;
                        ////txtPasswordC.Value = Buscar.clave;
                        txtContraseña.Value = Buscar.clave;

                        lblDireccion.Text = Buscar.direccion;
                        lblTelefono.Text = Buscar.telefono;
                        lblEmail.Text = Buscar.email;
                        lblCiudad.Text = Buscar.nombre;


                        //Combo ddlCiudad
                        ClCiudadD objCiudad = new ClCiudadD();
                        List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
                        listaCiudad = objCiudad.mtdListarCiudad();
                        ddlCiudad.DataSource = listaCiudad;
                        ddlCiudad.DataTextField = "nombre";
                        ddlCiudad.DataValueField = "idCiudad";
                        ddlCiudad.DataBind();
                        ddlCiudad.SelectedValue = Buscar.idCiudad.ToString();


                        // Cargar la imagen desde la base de datos y asignarla a ImgPerfill
                        ImgPerfill.ImageUrl = Buscar.foto;
                    }

                    if (Request.Files.Count > 0)
                    {
                        HttpPostedFile file = Request.Files[0];
                        if (file != null && file.ContentLength > 0)
                        {
                           ClClienteE objClien = new ClClienteE();
                            string telefono = Session["TeleCliente"].ToString();
                            string nombreImg = telefono + ".png";
                            string rutaImg = Server.MapPath("~/Vista/Imagenes/PerfilCliente/" + nombreImg);
                            string rutaSql = "~/Vista/Imagenes/PerfilCliente/" + nombreImg;

                            // Guarda la imagen en el servidor
                            file.SaveAs(rutaImg);

                            objClien.foto = rutaSql;
                            int actualizar = objCliente.mtdActualizarImagen(objClien, idCliente);

                            // Devuelve la ruta de la imagen guardada como respuesta
                            Response.Write(rutaSql);
                        }
                    }
                }
            }
            catch (Exception)
            {

                Response.Redirect("~/Vista/Login.aspx");
                throw;
            }



        }

        protected void btnGuardar_Click1(object sender, EventArgs e)
        {
            int idCliente = Int32.Parse(txtNombre.Value = Session["idCliente"].ToString());
            ClClienteE objClient = new ClClienteE();
            objClient.nombres = txtNombre.Value;
            objClient.apellidos = txtApellido.Value;
            objClient.direccion = txtDireccionC.Value;
            objClient.telefono = txtTelefonoC.Value;
            objClient.email = txtEmailC.Value;
            objClient.clave = txtContraseña.Value;
            objClient.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());

            ClClienteL objCliente = new ClClienteL();
            int registro = objCliente.mtdActualizarDatos(objClient, idCliente);
            string script = @"<script> swal({ title: '¡Registro Exitoso!',
                              text: 'Cliente Registrado Exitosamente', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";
            if (registro == 1)
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("Login.aspx");
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Formulario.aspx");
        }

        //protected void btnGuardarImg_Click(object sender, EventArgs e)
        //{
        //    int idCliente = Int32.Parse(lblidCliente.Text = Session["idCliente"].ToString());
        //    ClClienteE objClient = new ClClienteE();
        //    var files = imagenImput.PostedFile;
        //    string nombreImg = files.FileName;
        //    string rutaImg = Server.MapPath("~/Vista/Imagenes/PerfilCliente/" + nombreImg);
        //    string rutaSql = "~/Vista/Imagenes/PerfilCliente/" + nombreImg;
        //    var file = Request.Files[0];
        //    if (imagenImput.PostedFile != null && imagenImput.PostedFile.ContentLength > 0)
        //    {
        //        file.SaveAs(rutaImg);
        //        objClient.foto = rutaSql;
        //        ClClienteL clClien = new ClClienteL();
        //        int actualizar = clClien.mtdActualizarImagen(objClient, idCliente);
        //    }
        //}
    }
}