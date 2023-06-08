using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.DynamicData;

namespace appWebServisoft.Datos
{
    public class ClProcesarSQL
    {
        //Ejecuta Consulta Select en forma desconectada y retorna DataTable
        public DataTable mtdSelectDesc(string consulta)
        {
            ClConexion obConexion = new ClConexion();
            SqlDataAdapter adap = new SqlDataAdapter(consulta, obConexion.mtdConexion());
            DataTable tblDatos = new DataTable();
            adap.Fill(tblDatos);
            obConexion.mtdConexion().Close();
            return tblDatos;
        }

        //Ejecuta consulta Select de forma Conectada y retorna DataReader 
        public int mtdSelectConec(string consul)
        {
            ClConexion obConexion = new ClConexion();
            //obConexion.mtdConexion().Open();
            SqlCommand comando = new SqlCommand(consul, obConexion.mtdConexion());
            int verificar = (int)comando.ExecuteScalar();
            obConexion.mtdConexion().Close();
            return verificar;
        }

        // Ejecuta Consulta en Forma Conectada
        public int mtdIUDConec(string consulta)
        {
            ClConexion objConexion = new ClConexion();
            SqlCommand comando = new SqlCommand(consulta, objConexion.mtdConexion());
            int registro = comando.ExecuteNonQuery();
            objConexion.mtdConexion().Close();
            return registro;
        }
        
        public int mtdVerificarExistenciaCorreo(string consul)
        {
            ClConexion obConexion = new ClConexion();
            SqlCommand comando = new SqlCommand(consul, obConexion.mtdConexion());
            int verificar = (int)comando.ExecuteScalar();
            obConexion.mtdConexion().Close();
            return verificar;
        } 
    }
}

