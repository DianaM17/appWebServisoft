﻿using System;
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
        public string ubicacion { get; set; }
        public string estadoServ { get; set; }
        public int idCiudad { get; set; }
        public string ciudad { get; set; }
        public string nombre { get; set; }
        public int idServicio { get; set; }
        public string servicio { get; set; }
        public string categoria { get; set; }
        public int idCategoria { get; set; }
        public int idProfesional { get; set; }
        public int idEstadoServicio { get; set; }
        public string estadoServicio { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string NombreCompleto { get; set; }
        public string telefonoCliente { get; set; } 
        public int idCliente { get; set; }
    }
}