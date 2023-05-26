using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClCiudadD
    {
        public List<ClCiudadE> mtdListarCiudad()
        {
            string Consulta = "Select idCiudad, nombre from Ciudad";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblCiudad = SQL.mtdSelectDesc(Consulta);

            List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
            ClCiudadE objDatos = null;
            for (int i = 0; i < tblCiudad.Rows.Count; i++)
            {
                objDatos = new ClCiudadE();
                objDatos.idCiudad = int.Parse(tblCiudad.Rows[i]["idCiudad"].ToString());
                objDatos.nombre = tblCiudad.Rows[i]["nombre"].ToString();
                listaCiudad.Add(objDatos);
            }
            return listaCiudad;
        }
    }
}