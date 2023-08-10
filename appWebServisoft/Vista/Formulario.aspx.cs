using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Formulario
{
    public partial class Formulario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Cargar Combo ddlCategoria 
                ClCategoriaL objCategoria = new ClCategoriaL();
                List<ClCategoriaE> listaCategoria = new List<ClCategoriaE>();
                listaCategoria = objCategoria.mtdListar();

                ddlCategoria.DataSource = listaCategoria;
                ddlCategoria.DataTextField = "categoria";
                ddlCategoria.DataValueField = "idCategoria";
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new ListItem("Seleccione: ", "0"));

                //Cargar Combo ddlCiudad
                ClCiudadL objCiudad = new ClCiudadL();
                List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
                listaCiudad = objCiudad.mtdListarCiudad();

                ddlCiudad.DataSource = listaCiudad;
                ddlCiudad.DataTextField = "nombre";
                ddlCiudad.DataValueField = "idCiudad";
                ddlCiudad.DataBind();
                ddlCiudad.Items.Insert(0, new ListItem("Seleccione: ", "0"));
            }
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idCateg = ddlCategoria.SelectedValue;
            ClServicioL objServicio = new ClServicioL();
            List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);

            // Limpiar los elementos existentes en el ComboBox
            ddlServicio.Items.Clear();

            ddlServicio.DataSource = listaServicio;
            ddlServicio.DataTextField = "servicio";
            ddlServicio.DataValueField = "idServicio";
            ddlServicio.DataBind();
            ddlServicio.Items.Insert(0, new ListItem("Seleccione: ", "0"));

            int idCate = ddlCategoria.SelectedIndex;
            ClCotizacionL objCot = new ClCotizacionL();
            ClCotizacionE Buscar = objCot.mtdCotizacion(idCate);
            if (Buscar != null)
            {
                ImgCateg.ImageUrl = Buscar.imagen;
            }
        }

        protected void btnEnviar_ServerClick(object sender, EventArgs e)
        {
            
            //Registrar la cotización
            if (FluImagen.HasFile)
            {
                string idClienteString = Session["idCliente"].ToString();
                int Idcliente = Int32.Parse(idClienteString);

                string nombre = txtTitulo.Value;
                string ruta = Server.MapPath("~/Vista/Imagenes/Cotizaciones/" + nombre);
                string rutaSql = ("~/Vista/Imagenes/Cotizaciones/" + nombre);
                FluImagen.SaveAs(ruta);

                ClCotizacionE objCot = new ClCotizacionE();
                objCot.tituloServicio = txtTitulo.Value;
                objCot.descripcion = txtDescripcion.Value;
                objCot.imagen = rutaSql;
                objCot.direccion = txtDireccion.Value;
                objCot.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());
                objCot.idCategoria = int.Parse(ddlCategoria.SelectedValue.ToString());
                objCot.idServicio = int.Parse(ddlServicio.SelectedValue.ToString());
                objCot.idCliente = Idcliente;
                ClCotizacionL objCoti = new ClCotizacionL();
                int regis = objCoti.mtdRegistroCotizacion(objCot);

                //Enviar la cotizacion
                int categ = int.Parse(ddlCategoria.SelectedValue.ToString());
                int serv = int.Parse(ddlServicio.SelectedValue.ToString());
                int ciudad = int.Parse(ddlCiudad.SelectedValue.ToString());
                ClProfesionalL objProf = new ClProfesionalL();
                List<ClProfesionalE> listaProf = objProf.mtdSelecCorreoCateg(categ, serv, ciudad);
                List<string> destinatarios = listaProf.Select(prof => prof.email).ToList();
                string email = listaProf.FirstOrDefault()?.email;
                MailMessage mensaje = new MailMessage();
                // Establecer el remitente, destinatario y asunto del correo
                mensaje.From = new MailAddress(email);
                mensaje.To.Add(new MailAddress("servisoft1710@gmail.com"));
                mensaje.Subject = "Cotización";
                for (int i = 0; i < destinatarios.Count; i++)
                {
                    mensaje.To.Add(new MailAddress(destinatarios[i]));
                }

                // Crear el cuerpo del correo con los campos adicionales
                string tituloServ = txtTitulo.Value;
                string descripcion = txtDescripcion.Value;
                string direccion = txtDireccion.Value;

                //Optiene el archivo adjunto cargardo atraves del fileupload
                //PostedFile es una propiedad del control FileUpload
                HttpPostedFile archivoAdjunto = FluImagen.PostedFile;
                Stream flujoAdjunto = archivoAdjunto.InputStream;
                Attachment adjunto = new Attachment(flujoAdjunto, archivoAdjunto.FileName);
                mensaje.Attachments.Add(adjunto);

                txtTitulo.Value = string.Empty;
                txtDescripcion.Value = string.Empty;
                txtDireccion.Value = string.Empty;

                mensaje.Body = $"Titulo Servicio: {tituloServ}\nDescripcion: {descripcion}\nDirección: {direccion}";

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
                    txtTitulo.Value = string.Empty;
                    txtDescripcion.Value = string.Empty;
                    txtDireccion.Value = string.Empty;

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

}