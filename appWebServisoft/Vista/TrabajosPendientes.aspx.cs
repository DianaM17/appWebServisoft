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
    public partial class Trabajos_a_realizar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                //ClServicioL objEstadoServ = new ClServicioL();
                //List<ClEstadoServicioE> ListaEstadoServ = new List<ClEstadoServicioE>();
                //ListaEstadoServ = objEstadoServ.mtdListarEstadoS();

                //ddlEstadoModal.DataSource = ListaEstadoServ;
                //ddlEstadoModal.DataTextField = "estado";
                //ddlEstadoModal.DataValueField = "idEstadoServicio";
                //ddlEstadoModal.DataBind();
                //ddlEstadoModal.Items.Insert(0, new ListItem("Seleccione el estado: ", "0"));

                int idProf = int.Parse(Session["idProfesional"].ToString());
                ClServicioL objServicio = new ClServicioL();
                List<ClSolicitudServicioE> lista = objServicio.mtdListarTrabajos(idProf);
                gvTrabajos.DataSource = lista;

                gvTrabajos.DataBind();
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
         
        }

    }
}