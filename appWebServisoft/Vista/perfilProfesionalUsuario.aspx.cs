using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace appWebServisoft.Vista
{
    public partial class perfilProfesionalUsuario : System.Web.UI.Page
    {
        private int idCiudad2;
        private int idServicio;
        private int idCategoria2;
        private int idProfesional2;

        protected void Page_Load(object sender, EventArgs e)
        {
                string Telefono = lblTeleProf.Text = Session["TeleProfesional"].ToString();
                // Verificar si la variable de sesión contiene el ID del profesional seleccionado
                if (Session["IdProfesionalSeleccionado"] != null)
                {

                    // Recuperar el ID, nombre y apellidos del profesional de los parámetros de la URL
                    int idProfesional = Convert.ToInt32(Request.QueryString["idCotizacion"]);
                    string nombres = Server.UrlDecode(Request.QueryString["nombres"]);
                    string apellidos = Server.UrlDecode(Request.QueryString["apellidos"]);
                    string nombresCompletos = nombres + " " + apellidos;

                    ClProfesionalL obj = new ClProfesionalL();
                    ClProfesionalE Buscar = obj.mtdBuscarProf(idProfesional);
                    if (Buscar != null)
                    {
                       
                        lblNombre.Text = nombresCompletos;
                        ImgPerfil.ImageUrl = Buscar.fotos;
                        lblProfesion.Text = Buscar.categoria;
                        lblEmail.Text = Buscar.email;
                        lblDireccion.Text = Buscar.direccion;
                        lblTelefono.Text = Buscar.telefono;
                        lblServicio.Text = Buscar.servicio;
                        lblCiudad.Text = Buscar.nombre;
                        lblEstado.Text = Buscar.estado;
                        Label1.Text = nombresCompletos;
                        Image1.ImageUrl = Buscar.fotos;
                        idProfesional2 = Buscar.idProfesional; // Declara la variable idProfesional2 de tipo entero

                   

                    }
                }
                else
                {

                }   // Obtener y asignar los valores a las variables idCiudad2, idServicio e idCategoria2


            lblIdProfesional.Text = idProfesional2.ToString();

            if (int.TryParse(Request.QueryString["idCiudad"], out idCiudad2) &&
                 int.TryParse(Request.QueryString["idServicio"], out idServicio) &&
                 int.TryParse(Request.QueryString["idCategoria"], out idCategoria2)&&
                 int.TryParse(Request.QueryString["idProfesional"], out idProfesional2))
            { }


            if (Request.QueryString["idCotizacionId"] != null)
            {
                string idCotizacionStr = Request.QueryString["idCotizacionId"];
                lblIdCotizacion.Text = idCotizacionStr;

                if (int.TryParse(idCotizacionStr, out int idCotizacion))
                {
                    ClCotizacionL objCotizacion = new ClCotizacionL();
                    List<ClListaCotizacionE> listaCotizaciones = objCotizacion.mtdListaCotizacionUsuario(idCotizacion);

                    // Verificar si la lista contiene elementos
                    if (listaCotizaciones.Count > 0)
                    {
                        // Tomar la primera cotización de la lista (puedes adaptar esto según tus necesidades)
                        ClListaCotizacionE cotizacion = listaCotizaciones[0];

                        lblIdProfesional.Text = idProfesional2.ToString();
                        // Asigna los datos obtenidos a las etiquetas
                        lblDescripcion.Text = cotizacion.descripcion;
                        lblDireccion1.Text = cotizacion.direccion;
                        lblCiudad1.Text = cotizacion.ciudad;
                        lblCategoria.Text = cotizacion.categoria;
                        lblServicio1.Text = cotizacion.servicio;
                        idCiudad2 = cotizacion.idCiudad;
                        idServicio = cotizacion.idServicio;
                        idCategoria2 = cotizacion.idCategoria;
                    }
                    else
                    {
                        // Maneja el caso en el que no se encontraron cotizaciones
                        lblDescripcion.Text = "No se encontraron cotizaciones para el ID especificado.";
                    }
                }
                else
                {
                    // Maneja la conversión fallida del ID (por ejemplo, muestra un mensaje de error)
                    lblDescripcion.Text = "ID de Cotización no válido";
                }
            }

            int idProfesional1 = Convert.ToInt32(Request.QueryString["idCotizacion"]);
            //Galeria de imagenes trabajos realizados
            ClProfesionalL objProfesionalD = new ClProfesionalL();
            List<ClImagenesServicioE> list = objProfesionalD.mtdListarTrabajos(idProfesional1);

            RptImagenes.DataSource = list;
            RptImagenes.DataBind();

        }



            public void SendWhatsAppMessage(string numero, string mensaje)
        {
            var accountSid = "AC2ef4418d9eeb51d27d0f045196569022"; // Reemplaza con tu Account SID de Twilio
            var authToken = "8e131745303e4f7ff45a79483914b77c";   // Reemplaza con tu Auth Token de Twilio

            TwilioClient.Init(accountSid, authToken);

            // Reemplaza "whatsapp:" con el prefijo adecuado para tu país (ejemplo: "whatsapp:+1" para Estados Unidos)
            var fromNumber = "+14178922380"; // El número de Twilio que tiene habilitada la función de WhatsApp
            var toWhatsAppNumber = "whatsapp:" + numero;

            var messageOptions = new CreateMessageOptions(new Twilio.Types.PhoneNumber(toWhatsAppNumber))
            {
                From = new Twilio.Types.PhoneNumber(fromNumber),
                Body = mensaje
            };

            var messageResource = MessageResource.Create(messageOptions);
            Console.WriteLine(messageResource.Sid);
        }


        protected void btnSolicitarServicio_Click(object sender, EventArgs e)
        {
            string descripcion = Server.UrlEncode(lblDescripcion.Text);
            string direccion = Server.UrlEncode(lblDireccion1.Text);
            string ciudad = Server.UrlEncode(lblCiudad1.Text);
            string categoria = Server.UrlEncode(lblCategoria.Text);
            string servicio = Server.UrlEncode(lblServicio1.Text);
            string nombreProfesional = Server.UrlEncode(lblNombre.Text);

            int idciu =idCiudad2; // Suponiendo que idCiudad2 es de tipo int
            int idSer = idServicio; // Suponiendo que idServicio es de tipo int
            int idCat = idCategoria2; // Suponiendo que idCategoria2 es de tipo int
            int idProf = idProfesional2;

            Response.Redirect($"SolicitudServicio.aspx?descripcion={Server.UrlEncode(descripcion)}&direccion={Server.UrlEncode(direccion)}&ciudad={Server.UrlEncode(ciudad)}&categoria={Server.UrlEncode(categoria)}&servicio={Server.UrlEncode(servicio)}&nombreProfesional={Server.UrlEncode(nombreProfesional)}&idCiudad={idciu}&idServicio={idSer}&idCategoria={idCat}&idProfesional={idProf}");
        }


        protected void btnVolver_Click(object sender, EventArgs e)
        {

        }

        protected void btnVolver_Click1(object sender, EventArgs e)
        {

        }
    }
}