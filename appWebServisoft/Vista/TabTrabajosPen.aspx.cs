using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class TabTrabajosPen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ClServicioL objEstadoServ = new ClServicioL();
                List<ClEstadoServicioE> ListaEstadoServ = new List<ClEstadoServicioE>();
                ListaEstadoServ = objEstadoServ.mtdListarEstadoS();

                ddlEstadoModal.DataSource = ListaEstadoServ;
                ddlEstadoModal.DataTextField = "estado";
                ddlEstadoModal.DataValueField = "idEstadoServicio";
                ddlEstadoModal.DataBind();
                ddlEstadoModal.Items.Insert(0, new ListItem("Seleccione el estado: ", "0"));

                int idProf = int.Parse(Session["idProfesional"].ToString());
                ClServicioL objServicio = new ClServicioL();
                List<ClSolicitudServicioE> lista = objServicio.mtdListarTrabajos(idProf);
                string Json = JsonConvert.SerializeObject(lista, Newtonsoft.Json.Formatting.Indented);
                ClientScript.RegisterStartupScript(GetType(), "JsonScript", $"var jsonData = {Json};", true);

            }
        }

        [WebMethod]
        public static List<ClSolicitudServicioE> mtdCargarDatos(int idProf)
        {
            ClServicioL objRegistro = new ClServicioL();
            List<ClSolicitudServicioE> Registro = objRegistro.mtdListarTrabajos(idProf);
            if (Registro.Count > 0)
            {
                return Registro;
            }
            return null;
        }

        [WebMethod]
        public static List<ClSolicitudServicioE> mtdListar(int idProf)
        {
            ClServicioL objRegistro = new ClServicioL();
            List<ClSolicitudServicioE> Registro = objRegistro.mtdListarTrabajos(idProf);

            return Registro;
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }
    }
}