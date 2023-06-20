using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Entidades
{
    public class ClCotizacionE
    {
        public int idCotizacion { get; set; }
        public string tituloServicio { get; set; }
        public string descripcion { get; set; }
        public string imagen { get; set; }
        public string direccion { get; set; }
        public int idCiudad { get; set; }
        public int idCategoria { get; set; }
        public int idServicio { get; set; }
        public int idCliente { get; set; }

    }
}