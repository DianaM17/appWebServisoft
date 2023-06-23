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
    public partial class SolicitudServicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_ServerClick(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClSolicitudServicioE objDatos = new ClSolicitudServicioE();

            objDatos.fecha = txtFecha.Text;
            objDatos.hora = txtHora.Text;
            objDatos.descripcion = txtDescripcion.Text;
            objDatos.estado = txtEstado.Text;
            objDatos.ubicacion = txtDireccion.Text;
            objDatos.idCiudad = 2;
            objDatos.idServicio = 3;
            objDatos.idProfesional = 3;
            objDatos.idCliente = 4;

            ClServicioL objServicioL = new ClServicioL();
            int registro = objServicioL.mtdSolicitudServicio(objDatos);

            if (registro == 1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('¡Usuario Registrado!', 'Su usuario ha Sido Registrado Con Exito', 'success')", true);

            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "swal('¡Usuario Registrado!', 'Su usuario ha Sido Registrado Con Exito', 'success')", true);
            }
        }
    }
}