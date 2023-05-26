using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClServicioL
    {
        public List<ClServicioE> mtdListarServicio(string idCateg)
        {
            ClServicioD objServicio = new ClServicioD();
            List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);
            return listaServicio;
        }
    }
}