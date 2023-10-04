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

                //ddlCiudad.DataSource = listaCiudad;
                //ddlCiudad.DataTextField = "nombre";
                //ddlCiudad.DataValueField = "idCiudad";
                //ddlCiudad.DataBind();
                //ddlCiudad.Items.Insert(0, new ListItem("Seleccione Ciudad: ", "0"));

                ////Cargar Combo ddlCategoria 
                //ClCategoriaL objCategoria = new ClCategoriaL();
                //List<ClCategoriaE> listaCategoria = new List<ClCategoriaE>();
                //listaCategoria = objCategoria.mtdListar();


                //ddlCategoria.DataSource = listaCategoria;
                //ddlCategoria.DataTextField = "categoria";
                //ddlCategoria.DataValueField = "idCategoria";
                //ddlCategoria.DataBind();
                //ddlCategoria.Items.Insert(0, new ListItem("Seleccione: ", "0"));

                //Cargar Combo ddlEstadoServ


                ddlCategoria.DataSource = listaCategoria;
                ddlCategoria.DataTextField = "categoria";
                ddlCategoria.DataValueField = "idCategoria";
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new ListItem("Seleccione: ", "0"));
                ddlServicio.Items.Insert(0, new ListItem("Seleccionar Categoria: ", "0"));
                ddlServicio.DataBind();
                ddlProfesional.Items.Insert(0, new ListItem("Seleccionar Servicio: ", "0"));
                ddlProfesional.DataBind();
                //Cargar Combo ddlEstadoServ

                ClServicioL objEstadoServ = new ClServicioL();
                List<ClEstadoServicioE> ListaEstadoServ = new List<ClEstadoServicioE>();
                //ListaEstadoServ = objEstadoServ.mtdListarEstadoS();

                //ddlEstadoSev.DataSource = ListaEstadoServ;
                //ddlEstadoSev.DataTextField = "estado";
                //ddlEstadoSev.DataValueField = "idEstadoServicio";
                //ddlEstadoSev.DataBind();
                //ddlEstadoSev.Items.Insert(0, new ListItem("En Proceso", "4"));
                //ddlEstadoSev.Enabled = false;


                //ClServicioL objEstadoServ = new ClServicioL();
                //List<ClEstadoServicioE> ListaEstadoServ = new List<ClEstadoServicioE>();
                ////ListaEstadoServ = objEstadoServ.mtdListarEstadoS();

                //ddlEstadoSev.DataSource = ListaEstadoServ;
                //ddlEstadoSev.DataTextField = "estado";
                //ddlEstadoSev.DataValueField = "idEstadoServicio";
                //ddlEstadoSev.DataBind();
                //ddlEstadoSev.Items.Insert(0, new ListItem("En Proceso", "4"));
                //ddlEstadoSev.Enabled = false;

                ClServicioL objEstadoServ = new ClServicioL();
                List<ClEstadoServicioE> ListaEstadoServ = new List<ClEstadoServicioE>();
                ListaEstadoServ = objEstadoServ.mtdListarEstadoS();

                ddlEstadoSev.DataSource = ListaEstadoServ;
                ddlEstadoSev.DataTextField = "estado";
                ddlEstadoSev.DataValueField = "idEstadoServicio";
                ddlEstadoSev.DataBind();
                ddlEstadoSev.Items.Insert(0, new ListItem("En Proceso", "4"));
                ddlEstadoSev.Enabled = false;


                // Accede a los datos pasados en la URL
                // Accede a los datos pasados en la URL y decodifica las cadenas
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

   

        //protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string idCateg = ddlCategoria.SelectedValue;
        //    ClServicioL objServicio = new ClServicioL();
        //    List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);

        //    // Limpiar los elementos existentes en el ComboBox
        //    ddlServicio.Items.Clear();

            ddlServicio.DataSource = listaServicio;
            ddlServicio.DataTextField = "servicio";
            ddlServicio.DataValueField = "idServicio";
            ddlServicio.DataBind();
            ddlServicio.Items.Insert(0, new ListItem("Seleccione Servicio: ", "0"));


        //    ddlServicio.DataSource = listaServicio;
        //    ddlServicio.DataTextField = "servicio";
        //    ddlServicio.DataValueField = "idServicio";
        //    ddlServicio.DataBind();
        //    ddlServicio.Items.Insert(0, new ListItem("Seleccione: ", "0"));


        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idCliente = Int32.Parse(lblIdCliente.Text = Session["idCliente"].ToString());
            ClSolicitudServicioE objDatos = new ClSolicitudServicioE();



            // Convierte los valores de las etiquetas a enteros
            int idServicio = Convert.ToInt32(lblIdServicio.Text);
            int idCategoria = Convert.ToInt32(lblIdCategoria.Text);
            int idCiudad = Convert.ToInt32(lblIdCiudad.Text);
            int idProfesional = Convert.ToInt32(lblIdProfesional.Text);

            //objDatos.fecha = fechaSeleccionada;

            objDatos.hora = txtHora.Value;
            objDatos.descripcion = txtDescripcion.Text;
            objDatos.ubicacion = lblDireccion1.Text;
            objDatos.idCiudad = idCiudad;
            objDatos.idServicio = idServicio;
            objDatos.idProfesional = idProfesional;

            objDatos.fecha = eventdate.Value;
            objDatos.hora = txtHora.Value;
            objDatos.descripcion = txtDescripcion.Text;
            //objDatos.estado = txtEstado.Text;
            objDatos.ubicacion = txtDireccion.Text;
            objDatos.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());
            objDatos.idServicio = int.Parse(ddlServicio.SelectedValue.ToString());
            objDatos.idCategoria = int.Parse(ddlCategoria.SelectedValue.ToString());
            objDatos.idProfesional = int.Parse(ddlProfesional.SelectedValue.ToString());
            //objDatos.idEstadoServicio = int.Parse(ddlEstadoSev.SelectedValue.ToString());

            objDatos.idCliente = (int)Session["idCliente"];
            objDatos.idEstadoServicio = 4;
            
           
            
           



            //DateTime fechaSeleccionada = DateTime.ParseExact(txtFecha.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture);

            DateTime fechaActual = DateTime.Now;

            //if (fechaSeleccionada < fechaActual)
            //{
            //    string script = @"<script> swal({ title: '¡Error!', text: 'No se puede solicitar un servicio en fechas anteriores a la actual.', type: 'error', confirmButtonText: 'Aceptar' }); </script>";
            //    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            //    return;
            //}

            ClServicioL objServicioL = new ClServicioL();
            int registro = objServicioL.mtdSolicitudServicio(objDatos);

            if (registro == 1)
            {
                //txtFecha.Text = string.Empty;
                txtHora.Value = string.Empty;
                txtDescripcion.Text = string.Empty;
                txtDireccion.Text = string.Empty;
                ddlCategoria.SelectedIndex = 0;
                ddlServicio.SelectedIndex = 0;
                ddlCiudad.SelectedIndex = 0;
                ddlProfesional.SelectedIndex = 0;
                //ddlEstadoSev.SelectedIndex = 0;

                string script = @"<script> swal({ title: '¡Registro Exitoso!', text: 'El servicio ha sido solicitado con exito.',type: 'success',
                            confirmButtonText: 'Aceptar'});
                        </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);

            }

            //}


            //protected void ddlServicio_SelectedIndexChanged(object sender, EventArgs e)
            //{
            //    string serv = ddlServicio.SelectedValue;
            //    string categ = ddlCategoria.SelectedValue;
            //    string ciudad = ddlCiudad.SelectedValue;
            //    ClProfesionalL objProfesional = new ClProfesionalL();
            //    List<ClProfesionalE> listaProf = new List<ClProfesionalE>();
            //    listaProf = objProfesional.mtdSelecCorreoCateg(categ, serv, ciudad);

        protected void ddlServicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            int serv = int.Parse(ddlServicio.SelectedValue);
            int categ = int.Parse(ddlCategoria.SelectedValue);
            int ciudad = int.Parse(ddlCiudad.SelectedValue);
            ClProfesionalL objProfesional = new ClProfesionalL();
            List<ClProfesionalE> listaProf = new List<ClProfesionalE>();
            listaProf = objProfesional.mtdSelecCorreoCateg(categ, serv, ciudad);


            //    ddlProfesional.Items.Clear();


            //    ddlProfesional.DataSource = listaProf;
            //    ddlProfesional.DataTextField = "nombreCompleto";
            //    ddlProfesional.DataValueField = "idProfesional";
            //    ddlProfesional.DataBind();
            //    ddlProfesional.Items.Insert(0, new ListItem("Seleccione Profesional: ", "0"));




            //}

            ddlProfesional.DataSource = listaProf;
            ddlProfesional.DataTextField = "nombreCompleto";
            ddlProfesional.DataValueField = "idProfesional";
            ddlProfesional.DataBind();
            ddlProfesional.Items.Insert(0, new ListItem("Seleccione Profesional: ", "0"));

        }
    }
}