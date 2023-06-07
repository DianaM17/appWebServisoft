using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClProfesionalL objProf = new ClProfesionalL();
            List<ClProfesionalE> list = objProf.mtdListarProfesional();

            ReptPerfil.DataSource = list;
            ReptPerfil.DataBind();
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Value;
            MailMessage mensaje = new MailMessage();

            // Establecer el remitente, destinatario y asunto del correo
            mensaje.From = new MailAddress(email);
            mensaje.To.Add(new MailAddress("servisoft1710@gmail.com"));
            mensaje.Subject = "Prueba de correo electrónico";

            // Crear el cuerpo del correo con los campos adicionales
            string nombre = txtNombre.Value;
            string celular = txtTelefono.Value;
            string comentario = txtMessage.Value;

            mensaje.Body = $"Nombre: {nombre}\nCelular: {celular}\nComentario: {comentario}";

            // Crear el objeto SmtpClient y configurarlo
            SmtpClient clienteSmtp = new SmtpClient();

            // Configurar las credenciales del servidor SMTP, servidor y puerto
            clienteSmtp.UseDefaultCredentials = false;
            clienteSmtp.Credentials = new System.Net.NetworkCredential("servisoft1710@gmail.com", "ldxkmsxjlekwtcem");
            clienteSmtp.Host = "smtp.gmail.com";
            clienteSmtp.Port = 587;
            clienteSmtp.EnableSsl = true;

            // Enviar el correo electrónico
            clienteSmtp.Send(mensaje);
        }

    }
}

   