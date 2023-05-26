using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClCiudadL
    {
        public List<ClCiudadE> mtdListarCiudad()
        {
            ClCiudadD objCiudad = new ClCiudadD();
            List<ClCiudadE> listaCiudad = objCiudad.mtdListarCiudad();  
            return listaCiudad;
        }
    }
}