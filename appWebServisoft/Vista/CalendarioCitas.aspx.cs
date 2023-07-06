using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;

namespace appWebServisoft.Vista
{
    public partial class CalendarioCitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idProf = int.Parse(Session["idProfesional"].ToString());
                ClServicioL objServi = new ClServicioL();
                List<ClSolicitudServicioE> listaServ = objServi.mtdServicioAceptado(idProf);

                // Ajustar el formato de la fecha
                for (int i = 0; i < listaServ.Count; i++)
                {
                    ClSolicitudServicioE servicio = listaServ[i];
                    DateTime fechaServicio = DateTime.Parse(servicio.fecha);
                    servicio.fecha = fechaServicio.ToString("yyyy-MM-dd"); // Ajustar el formato de la fecha
                }

                // Serializar la lista de eventos a formato JSON
                string eventosJson = JsonConvert.SerializeObject(listaServ, new IsoDateTimeConverter { DateTimeFormat = "yyyy-MM-ddTHH:mm:ss" });

                // Retornar los datos en formato JSON
                Response.Clear();
                Response.ContentType = "application/json; charset=utf-8";
                Response.Write(eventosJson);
                Response.End();
            }
        }
    }
}