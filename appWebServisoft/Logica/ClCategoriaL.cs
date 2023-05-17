using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClCategoriaL
    {
        public List<ClCategoriaE> mtdListar()
        {
            ClCategoriaD objProD = new ClCategoriaD();
            List<ClCategoriaE> list = objProD.mtdListarCate();
            return list;
        }
    }
}