using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net.Mail;
using System.IO;

namespace appWebServisoft.Vista
{
    public partial class interfazCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClProfesionalL objProfesional = new ClProfesionalL();
            List<ClProfesionalE> verifica = objProfesional.mtdListarProfesional();
            Repeater1.DataSource = verifica;
            Repeater1.DataBind();


            ClServicioL objServicio = new ClServicioL();
            List<ClImagenesServicioE> imagenes = objServicio.mtdlistarImagenServicio();
            Repeater2.DataSource = imagenes;
            Repeater2.DataBind();


            //if (!IsPostBack)
            //{
            //    //Cargar Combo ddlCategoria 
            //    ClCategoriaL objCategoria = new ClCategoriaL();
            //    List<ClCategoriaE> listaCategoria = new List<ClCategoriaE>();
            //    listaCategoria = objCategoria.mtdListar();

            //    ddlCategoria.DataSource = listaCategoria;
            //    ddlCategoria.DataTextField = "categoria";
            //    ddlCategoria.DataValueField = "idCategoria";
            //    ddlCategoria.DataBind();
            //    ddlCategoria.Items.Insert(0, new ListItem("Seleccione: ", "0"));

            //    //Cargar Combo ddlCiudad 
            //    ClCiudadL objCiudad = new ClCiudadL();
            //    List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
            //    listaCiudad = objCiudad.mtdListarCiudad();

            //    ddlCiudad.DataSource = listaCiudad;
            //    ddlCiudad.DataTextField = "nombre";
            //    ddlCiudad.DataValueField = "idCiudad";
            //    ddlCiudad.DataBind();
            //    ddlCiudad.Items.Insert(0, new ListItem("Seleccione: ", "0"));

            ClComentarioL objComentario = new ClComentarioL();
            List<ClComentarioE> comentario = objComentario.mtdListarComentario();
            RepeaterContenido.DataSource = comentario;
            RepeaterContenido.DataBind();

            //    // Ejecutar la función de cambio de índice cada 5 segundos
            //    ScriptManager.RegisterStartupScript(this, GetType(), "ChangeIndex", "setInterval(ChangeCarouselIndex, 5000);", true);
            //}

            ClCategoriaL objCate = new ClCategoriaL();
            List<ClCategoriaE> list = objCate.mtdListar();

            reptCateg.DataSource = list;
            reptCateg.DataBind();
        }
        //protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string idCateg = ddlCategoria.SelectedValue;
        //    ClServicioL objServicio = new ClServicioL();
        //    List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);

        //    // Limpiar los elementos existentes en el ComboBox
        //    ddlServicio.Items.Clear();

        //    ddlServicio.DataSource = listaServicio;
        //    ddlServicio.DataTextField = "servicio";
        //    ddlServicio.DataValueField = "idServicio";
        //    ddlServicio.DataBind();
        //    ddlServicio.Items.Insert(0, new ListItem("Seleccione: ", "0"));
        //}

        protected void RepeaterContenido_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlGenericControl carouselItem = e.Item.FindControl("carouselItem") as HtmlGenericControl;
                if (carouselItem != null)
                {
                    if (e.Item.ItemIndex == 0)
                    {
                        carouselItem.Attributes["class"] += " active";
                    }
                }
            }
        }
        protected string GetCarouselItemClass(int itemIndex)
        {
            return itemIndex == 0 ? "carousel-item active" : "carousel-item";

        }

        //protected void btnEnviar_ServerClick(object sender, EventArgs e)
        //{
        //    //Registrar la cotización
        //    if (FluImagen.HasFile)
        //    {
        //        string idClienteString = Session["idCliente"].ToString();
        //        int Idcliente = Int32.Parse(idClienteString);

        //        string nombre = txtTitulo.Value;
        //        string ruta = Server.MapPath("~/Vista/Imagenes/Cotizaciones/" + nombre);
        //        string rutaSql = ("~/Vista/Imagenes/Cotizaciones/" + nombre);
        //        FluImagen.SaveAs(ruta);

        //        ClCotizacionE objCot = new ClCotizacionE();
        //        objCot.tituloServicio = txtTitulo.Value;
        //        objCot.descripcion = txtDescripcion.Value;
        //        objCot.imagen = rutaSql;
        //        objCot.direccion = txtDireccion.Value;
        //        objCot.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());
        //        objCot.idCategoria = int.Parse(ddlCategoria.SelectedValue.ToString());
        //        objCot.idServicio = int.Parse(ddlServicio.SelectedValue.ToString());
        //        objCot.idCliente = Idcliente;
        //        ClCotizacionL objCoti = new ClCotizacionL();
        //        int regis = objCoti.mtdRegistroCotizacion(objCot);

        //        //Enviar la cotizacion
        //        int categ = int.Parse(ddlCategoria.SelectedValue.ToString());
        //        int serv = int.Parse(ddlServicio.SelectedValue.ToString());
        //        int ciudad = int.Parse(ddlCiudad.SelectedValue.ToString());

        //        ClProfesionalL objProf = new ClProfesionalL();
        //        List<ClProfesionalE> listaProf = objProf.mtdSelecCorreoCateg(categ, serv, ciudad);
        //        List<string> destinatarios = listaProf.Select(prof => prof.email).ToList();
        //        string email = listaProf.FirstOrDefault()?.email;
        //        MailMessage mensaje = new MailMessage();
        //        // Establecer el remitente, destinatario y asunto del correo
        //        mensaje.From = new MailAddress(email);
        //        mensaje.To.Add(new MailAddress("servisoft1710@gmail.com"));
        //        mensaje.Subject = "Cotización";
        //        for (int i = 0; i < destinatarios.Count; i++)
        //        {
        //            mensaje.To.Add(new MailAddress(destinatarios[i]));
        //        }

        //        // Crear el cuerpo del correo con los campos adicionales
        //        string tituloServ = txtTitulo.Value;
        //        string descripcion = txtDescripcion.Value;
        //        string direccion = txtDireccion.Value;

        //        //Optiene el archivo adjunto cargardo atraves del fileupload
        //        //PostedFile es una propiedad del control FileUpload
        //        HttpPostedFile archivoAdjunto = FluImagen.PostedFile;
        //        Stream flujoAdjunto = archivoAdjunto.InputStream;
        //        Attachment adjunto = new Attachment(flujoAdjunto, archivoAdjunto.FileName);
        //        mensaje.Attachments.Add(adjunto);

        //        txtTitulo.Value = string.Empty;
        //        txtDescripcion.Value = string.Empty;
        //        txtDireccion.Value = string.Empty;

        //        mensaje.Body = $"Titulo Servicio: {tituloServ}\nDescripcion: {descripcion}\nDirección: {direccion}";

        //        // Crear el objeto SmtpClient y configurarlo
        //        SmtpClient clienteSmtp = new SmtpClient();

        //        // Configurar las credenciales del servidor SMTP, servidor y puerto
        //        clienteSmtp.UseDefaultCredentials = false;
        //        clienteSmtp.Credentials = new System.Net.NetworkCredential("servisoft1710@gmail.com", "ldxkmsxjlekwtcem");
        //        clienteSmtp.Host = "smtp.gmail.com";
        //        clienteSmtp.Port = 587;
        //        clienteSmtp.EnableSsl = true;

        //        try
        //        {
        //            // Enviar el correo electrónico
        //            clienteSmtp.Send(mensaje);

        //            // Limpiar los campos de texto después del envío exitoso
        //            txtTitulo.Value = string.Empty;
        //            txtDescripcion.Value = string.Empty;
        //            txtDireccion.Value = string.Empty;

        //            // Agregar una notificación SweetAlert si el envío es exitoso
        //            string script = @"<script> swal({ title: '¡Envio Exitoso!',
        //                      text: 'El correo electronico se ha enviado correctamente', type: 'success',
        //                    confirmButtonText: 'Aceptar'
        //        });
        //            </script>";
        //            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script, false);
        //        }
        //        catch (Exception ex)
        //        {
        //            // Agregar una notificación SweetAlert si ocurre un error
        //            string script = $@"<script>
        //                swal('Error al enviar el correo', '{ex.Message}', 'error');
        //              </script>";
        //            Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorEnvioCorreo", script);
        //        }
        //    }
        //}
    }
}