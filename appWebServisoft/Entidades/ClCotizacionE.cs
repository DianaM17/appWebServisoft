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
        public int idSelecionProf { get; set; }
        public int idCiudad { get; set; }
        public int idCategoria { get; set; }
        public int idServicio { get; set; }
        public int idCliente { get; set; }

    }

    public class ClSeleccionCotizacionE
    {
        public int idSeleccionCotizacion { get; set; }
        public int seleccionProfesional { get; set; }
        public int idProfesional { get; set; }
        public int idCotizacion { get; set; }

    }

    public class ClSeleccionCotizacion1E
    {
        public int idCotizacion { get; set; }

        public string tituloServicio { get; set; }
        public string descripcion { get; set; }
        public int idSeleccionCotizacion { get; set; }
        public int seleccionProfesional { get; set; }
        public int idProfesional { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }

    }
}