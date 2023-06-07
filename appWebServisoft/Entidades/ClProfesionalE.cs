using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Entidades
{
    public class ClProfesionalE : ClServicioE
    {
        public int idProfesional { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string telefono { get; set; }
        public string email { get; set; }
        public string clave { get; set; }
        public string direccion { get; set; }
        public string perfil { get; set; }
        public string fotos { get; set; }
        public string estado { get; set; }


        public string categorias { get; set; }
        //public int idCategoria { get; set; }
        //public int idServicio { get; set; }
        public int idCiudad { get; set; }

    }
}