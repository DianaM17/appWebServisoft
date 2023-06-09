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
using Microsoft.Win32;

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
            txtNombre.Value = string.Empty;
            txtTelefono.Value = string.Empty;
            txtMessage.Value = string.Empty;
            txtTelefono.Value = string.Empty;
            txtEmail.Value = string.Empty;

            mensaje.Body = $"Nombre: {nombre}\nCelular: {celular}\nComentario: {comentario}";

            // Crear el objeto SmtpClient y configurarlo
            SmtpClient clienteSmtp = new SmtpClient();

            // Configurar las credenciales del servidor SMTP, servidor y puerto
            clienteSmtp.UseDefaultCredentials = false;
            clienteSmtp.Credentials = new System.Net.NetworkCredential("servisoft1710@gmail.com", "ldxkmsxjlekwtcem");
            clienteSmtp.Host = "smtp.gmail.com";
            clienteSmtp.Port = 587;
            clienteSmtp.EnableSsl = true;

            try
            {
                // Enviar el correo electrónico
                clienteSmtp.Send(mensaje);

                // Limpiar los campos de texto después del envío exitoso
                txtNombre.Value = string.Empty;
                txtTelefono.Value = string.Empty;
                txtMessage.Value = string.Empty;
                txtEmail.Value = string.Empty;

                // Agregar una notificación SweetAlert si el envío es exitoso
                string script = @"<script> swal({ title: '¡Envio Exitoso!',
                              text: 'El correo electronico se ha enviado correctamente', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, false);
            }
            catch (Exception ex)
            {
                // Agregar una notificación SweetAlert si ocurre un error
                string script = $@"<script>
                        swal('Error al enviar el correo', '{ex.Message}', 'error');
                      </script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorEnvioCorreo", script);
            }
        }

    }
}

