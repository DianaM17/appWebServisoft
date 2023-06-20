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
                    txtPasswordC.Value = Buscar.clave;

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
                }
            }

        }

        protected void btnGuardar_Click1(object sender, EventArgs e)
        {
            int idCliente = Int32.Parse(txtNombre.Value = Session["idCliente"].ToString());
            ClClienteE objClient = new ClClienteE();
            string telefono = lblTelCliente.Text = Session["Cliente"].ToString();
            string nombreImg = telefono + ".png";
            string rutaImg = Server.MapPath("~/Vista/Imagenes/PerfilCliente/" + nombreImg);
            string rutaSql = "~/Vista/Imagenes/PerfilCliente/" + nombreImg;
            var file = Request.Files[0];
            if (imagenImput.PostedFile != null && imagenImput.PostedFile.ContentLength > 0)
            {
                file.SaveAs(rutaImg);
                objClient.foto = rutaSql;
                ClClienteL clProf = new ClClienteL();
                int actualizar = clProf.mtdActualizarDatos(objClient, idCliente);
            }

            objClient.nombres = txtNombre.Value;
            objClient.apellidos = txtApellido.Value;
            objClient.direccion = txtDireccionC.Value;
            objClient.telefono = txtTelefonoC.Value;
            objClient.email = txtEmailC.Value;
            objClient.clave = txtPasswordC.Value;
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
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }

        protected void btnCambiarColor_Click(object sender, EventArgs e)
        {
            // Genera un número aleatorio entre 0 y 16777215 (0xFFFFFF en hexadecimal)
            Random random = new Random();
            int colorCode = random.Next(0x1000000);

            // Convierte el número en un código de color hexadecimal
            string hexColor = "#" + colorCode.ToString("X6");

            // Llama a una función JavaScript para cambiar el color de fondo de la página
            ClientScript.RegisterStartupScript(this.GetType(), "ChangeColor", "changeBackgroundColor('" + hexColor + "');", true);

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Formulario.aspx");
        }
    }
}