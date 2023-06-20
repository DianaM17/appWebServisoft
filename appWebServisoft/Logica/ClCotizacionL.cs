using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClCotizacionL
    {
        public int mtdRegistroCotizacion(ClCotizacionE objCot)
        {
            ClCotizacioD objCoti = new ClCotizacioD();
            int regis = objCoti.mtdRegistrarCotizacion(objCot);
            return regis;
        }
    }
}