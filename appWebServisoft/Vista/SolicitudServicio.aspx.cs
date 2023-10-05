using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class SolicitudServicio : System.Web.UI.Page
    {
        private int idCiudad2;
        private int idServicio;
        private int idCategoria2;

        protected void Page_Load(object sender, EventArgs e)
        {
            int idCliente = Int32.Parse(lblIdCliente.Text = Session["idCliente"].ToString());

            if (!IsPostBack)
            {
                //Cargar Combo ddlCiudad Cliente
                ClCiudadL objCiudad = new ClCiudadL();
                List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
                listaCiudad = objCiudad.mtdListarCiudad();

          
                ClServicioL objEstadoServ = new ClServicioL();
                List<ClEstadoServicioE> ListaEstadoServ = new List<ClEstadoServicioE>();
                ListaEstadoServ = objEstadoServ.mtdListarEstadoS();

                string descripcionEncoded = Request.QueryString["descripcion"];
                string direccionEncoded = Request.QueryString["direccion"];
                string ciudadEncoded = Request.QueryString["ciudad"];
                string categoriaEncoded = Request.QueryString["categoria"];
                string servicioEncoded = Request.QueryString["servicio"];
                string nombreProfesionalEncoded = Request.QueryString["nombreProfesional"];

                string descripcionDecoded = Server.UrlDecode(descripcionEncoded);
                string direccionDecoded = Server.UrlDecode(direccionEncoded);
                string ciudadDecoded = Server.UrlDecode(ciudadEncoded);
                string categoriaDecoded = Server.UrlDecode(categoriaEncoded);
                string servicioDecoded = Server.UrlDecode(servicioEncoded);
                string nombreProfesionalDecoded = Server.UrlDecode(nombreProfesionalEncoded);


                int idCategoria2, idServicio, idCiudad2, idProfesional;
                int.TryParse(Request.QueryString["idCategoria"], out idCategoria2);
                int.TryParse(Request.QueryString["idServicio"], out idServicio);
                int.TryParse(Request.QueryString["idCiudad"], out idCiudad2);
                int.TryParse(Request.QueryString["idProfesional"], out idProfesional);

                // Llena las etiquetas en SolicitudServicio.aspx con los datos
                txtDescripcion.Text = descripcionDecoded;
                lblDireccion1.Text = direccionDecoded;
                lblCiudad1.Text = ciudadDecoded;
                lblCategoria.Text = categoriaDecoded;
                lblServicio1.Text = servicioDecoded;
                lblNombreProfesional.Text = nombreProfesionalDecoded;


                // Asigna los valores a las etiquetas de ID (asegúrate de que las etiquetas tengan runat="server")
                lblIdCiudad.Text = idCiudad2.ToString();
                lblIdServicio.Text = idServicio.ToString();
                lblIdCategoria.Text = idCategoria2.ToString();
                lblIdProfesional.Text = idProfesional.ToString();

                // Verificar si el valor del input está presente en la solicitud

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DateTime fechaActual = DateTime.Now;
            string horaIngresada = txtHora.Value;
            string fecha = eventdate.Value;

            // Convierte los valores de las etiquetas a enteros
            int idServicio = Convert.ToInt32(lblIdServicio.Text);
            int idCategoria = Convert.ToInt32(lblIdCategoria.Text);
            int idCiudad = Convert.ToInt32(lblIdCiudad.Text);
            int idProfesional = Convert.ToInt32(lblIdProfesional.Text);
            int idCliente = Int32.Parse(lblIdCliente.Text = Session["idCliente"].ToString());

            ClServicioL objServicioL = new ClServicioL();
            //int regis = objServicioL.mtdHoraDisponible(fecha, horaIngresada);

            //if (regis >= 1)
            //{
            //    string scriptError = @"<script> swal({ title: 'Error', text: 'La hora seleccionada no se encuentra disponible.', type: 'error', confirmButtonText: 'Aceptar' });</script>";
            //    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlertError", scriptError);
            //}

            if (DateTime.TryParse(eventdate.Value, out DateTime fechaIngresada))
            {
                if (fechaIngresada < fechaActual)
                {
                    string scriptError = @"<script> swal({ title: 'Error', text: 'No se puede registrar una fecha anterior a la actual.', type: 'error', confirmButtonText: 'Aceptar' });</script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlertError", scriptError);
                }
                else
                {
                     idCliente = Int32.Parse(Session["idCliente"].ToString());
                    ClSolicitudServicioE objDatos = new ClSolicitudServicioE();

                    objDatos.fecha = eventdate.Value;
                    objDatos.hora = txtHora.Value;
                    objDatos.descripcion = txtDescripcion.Text;
                    objDatos.ubicacion = lblDireccion1.Text;
                    objDatos.idCiudad = idCiudad;
                    objDatos.idServicio = idServicio;
                    objDatos.idProfesional = idProfesional;
                    objDatos.idCliente = (int)Session["idCliente"];
                    objDatos.idEstadoServicio = 4;

                    int registro = objServicioL.mtdSolicitudServicio(objDatos);

                    if (registro == 1)
                    {
                        // Restablecer los campos después del registro exitoso
                        txtHora.Value = string.Empty;
                        txtDescripcion.Text = string.Empty;
               

                        string scriptSuccess = @"<script> swal({ title: '¡Registro Exitoso!', text: 'El servicio ha sido solicitado con éxito.', type: 'success', confirmButtonText: 'Aceptar' });</script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlertSuccess", scriptSuccess);
                    }
                }
            }
            else
            {
                string scriptError = @"<script> swal({ title: 'Error', text: 'Formato de fecha no válido.', type: 'error', confirmButtonText: 'Aceptar' });</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlertError", scriptError);
            }
        }

 
    }
}