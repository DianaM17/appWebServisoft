﻿using System;
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

            conexion.Open();
            return conexion;
        }
    }
}