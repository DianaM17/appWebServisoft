using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Entidades
{
    public class ClSolicitudServicioE
    {
        public int idsolicitudServicio { get; set; }
        public string fecha { get; set; }
        public string hora { get; set; }
        public string descripcion { get; set; }
        public string estado { get; set; }
        public string ubicacion { get; set; }
        public int idCiudad { get; set; }
        public int idServicio { get; set; }
        public int idCategoria { get; set; }
        public int idProfesional { get; set; }
        public int idCliente { get; set; }
    }
}