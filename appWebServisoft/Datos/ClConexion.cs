using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClConexion
    {
        SqlConnection conexion = null;
        public SqlConnection mtdConexion()
        {
            conexion = new SqlConnection("");
            conexion.Open();
            return conexion;
        }
    }
}