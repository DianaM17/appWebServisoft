using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Entidades
{
    public class ClComentarioE
    {
        public int idCalificacion { get; set; }
        public string nivel { get; set; }
        public string puntos { get; set; }
        public string comentarios { get; set; }
        public string foto { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public int idsolicitudServicio { get; set; }
        public int idCliente { get; set; }


    }
}