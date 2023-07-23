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


            conexion = new SqlConnection("Data Source=ACERNITRO5\\SQLEXPRESS;Initial Catalog=bdProyecto;User ID=GymHouse;Password=1234");

           




            conexion.Open();
            return conexion;
        }
    }
}