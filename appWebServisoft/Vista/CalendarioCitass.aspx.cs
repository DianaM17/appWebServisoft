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
    public partial class CalendarioCitass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            int idProf = int.Parse(Session["idProfesional"].ToString());
            string fecha = txtFecha.Text;
            ClServicioL objServicio = new ClServicioL();
            List<ClSolicitudServicioE> lista = objServicio.mtdServicioAceptado(idProf, fecha);

            gvServicio.DataSource = lista;
            gvServicio.DataBind();
        }
    }
}