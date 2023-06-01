using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Entidades
{
    public class ClServicioE : ClCategoriaE
    {
        public int idServicio { get; set; }
        public string servicio { get; set; }
        //public int idCategoria { get; set; }
    }
}