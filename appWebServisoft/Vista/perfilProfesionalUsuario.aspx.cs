using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Twilio;
using Twilio.Rest.Api.V2010.Account;

namespace appWebServisoft.Vista
{
    public partial class perfilProfesionalUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string Telefono = lblTeleProf.Text = Session["TeleProfesional"].ToString();
                // Verificar si la variable de sesión contiene el ID del profesional seleccionado
                if (Session["IdProfesionalSeleccionado"] != null)
                {

                    // Recuperar el ID, nombre y apellidos del profesional de los parámetros de la URL
                    int idProfesional = Convert.ToInt32(Request.QueryString["id"]);
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


                    }
                }
                else
                {
              
                }
            }
            int idProfesional1 = Convert.ToInt32(Request.QueryString["id"]);
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
            Response.Redirect("SolicitudServicio.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {

        }

        protected void btnVolver_Click1(object sender, EventArgs e)
        {

        }
    }
}