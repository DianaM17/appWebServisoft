using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Globalization;

namespace appWebServisoft.Vista
{
    public partial class CalendarioCitas : System.Web.UI.Page
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