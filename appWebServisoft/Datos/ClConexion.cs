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


            conexion = new SqlConnection("Data Source=ACERNITRO5\\SQLEXPRESS;Initial Catalog=bdProyecto;Integrated Security=True");

            //conexion = new SqlConnection("Data Source=SOGAPRRBCFSD544\\SQLEXPRESS;Initial Catalog=bdProyecto;Persist Security Info=True;User ID=Servisoft;Password=12345");
            conexion = new SqlConnection("Data Source=LAPTOP-NGR8K750;Initial Catalog=bdProyecto;Integrated Security=True");


            conexion.Open();
            return conexion;
        }
    }
}