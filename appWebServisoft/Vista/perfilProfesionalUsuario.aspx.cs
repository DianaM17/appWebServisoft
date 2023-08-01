using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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


                        
                    }
                }
                else
                {
                    // Si la variable de sesión no contiene el ID del profesional, puedes manejar el caso de error o redireccionar a otra página, si es necesario.
                }
            }
            int idProfesional1 = Convert.ToInt32(Request.QueryString["id"]);
            //Galeria de imagenes trabajos realizados
            ClProfesionalL objProfesionalD = new ClProfesionalL();
            List<ClImagenesServicioE> list = objProfesionalD.mtdListarTrabajos(idProfesional1);

            RptImagenes.DataSource = list;
            RptImagenes.DataBind();

        }

        protected void btnSolicitarServicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("SolicitudServicio.aspx");
        }
    }
}


    