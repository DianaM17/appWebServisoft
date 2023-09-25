using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class CalendarioCitass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idProf = int.Parse(Session["idProfesional"].ToString());
            ClServicioL objServicio = new ClServicioL();
            List<ClSolicitudServicioE> lista = objServicio.mtdServicioAceptado(idProf);

            gvServicio.DataSource = lista;
            gvServicio.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            int idProf = int.Parse(Session["idProfesional"].ToString());
            string fecha = txtFecha.Text;
            ClServicioL objServicio = new ClServicioL();
            List<ClSolicitudServicioE> lista = objServicio.mtdServicioAceptado(idProf, fecha);

            gvServicio.DataSource = lista;
            gvServicio.DataBind();

            DateTime currentDate = DateTime.Now;

            for (int i = 0; i < gvServicio.Rows.Count; i++)
            {
                GridViewRow row = gvServicio.Rows[i];
                ClSolicitudServicioE service = (ClSolicitudServicioE)row.DataItem;

                if (service != null && !string.IsNullOrEmpty(service.fecha))
                {
                    if (DateTime.TryParse(service.fecha, out DateTime fechaServicio))
                    {
                        if (fechaServicio < currentDate)
                        {
                            row.BackColor = Color.Red;
                        }
                        else if (fechaServicio >= currentDate && fechaServicio < currentDate.AddDays(7))
                        {
                            row.BackColor = Color.Yellow;
                        }
                        else
                        {
                            row.BackColor = Color.Green;
                        }
                    }
                    else
                    {
                        // Manejar el caso de fecha no válida
                    }
                }
                else
                {
                    // Manejar el caso de service o service.fecha nulo
                }
            }
        }
    }
}