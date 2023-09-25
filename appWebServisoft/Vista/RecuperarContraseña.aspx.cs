using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace appWebServisoft.Vista
{
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {
            ClProfesionalL objProf = new ClProfesionalL();
            ClClienteL objCliente = new ClClienteL();
            string email = txtEmail.Value;
            int verificarCorreoProf = objProf.mtdVerificarCorreo(email);
            int verificarCorreoClie = objCliente.mtdVerificarCorreo(email);
            string nuevaContraseña = GenerateRandomPassword(10);
            if (verificarCorreoProf > 0 || verificarCorreoClie > 0)
            {
                objProf.mtdActualizarContrasela(email, nuevaContraseña);

                // Configuración de la conexión SMTP
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.Credentials = new NetworkCredential("servisoft1710@gmail.com", "ldxkmsxjlekwtcem");
                smtpClient.EnableSsl = true;

                // Crear el mensaje de correo electrónico
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress(email);
                mailMessage.To.Add(email);
                mailMessage.Subject = "Recuperación de contraseña";
                mailMessage.Body = "Tu nueva contraseña es: " + nuevaContraseña;
                try
                {
                    smtpClient.Send(mailMessage);

                    string script = @"<script>
    console.log('SweetAlert script is being executed.'); // Agrega esta línea
    Swal.fire({
        icon: 'success', title: 'Éxito', text: 'Se recupero la contraseña exitosamente.', confirmButtonColor: '#3085d6', confirmButtonText: 'Aceptar'
    });
</script>";

                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlertSuccess", script);
                }
                catch (Exception)
                {
                    string script = @"<script> swal({ title: '¡Error!', text: 'Correo con encontrado',type: 'error',
                            confirmButtonText: 'Aceptar'});
                    </script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
                    throw;
                }
                // Enviar el correo electrónico

            }
            else
            {
                string script = @"<script> swal({ title: '¡Error!', text: 'Correo con encontrado',type: 'error',
                            confirmButtonText: 'Aceptar'});
                    </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }
        private string GenerateRandomPassword(int length)
        {
            const string validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder sb = new StringBuilder();
            Random random = new Random();

            while (sb.Length < length)
            {
                int index = random.Next(validChars.Length);
                sb.Append(validChars[index]);
            }
            return sb.ToString();
        }
    }
}