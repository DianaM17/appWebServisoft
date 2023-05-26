using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

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

        //Lista con Procesos Almacenados|
        public SqlDataReader mtdListar(string ProceAlmacenado)
        {

            ClConexion objConexion = new ClConexion();
            SqlCommand comando = new SqlCommand(ProceAlmacenado, objConexion.mtdConexion());
            comando.CommandType = CommandType.StoredProcedure;
            SqlDataReader leer = comando.ExecuteReader();
            return leer;
        }
        //Insert de Productos con proceso almacenado que retorna un registro
        public SqlCommand mtdAgregar(string Proceso)
        {
            ClConexion objConexion = new ClConexion();
            SqlCommand comando = new SqlCommand(Proceso, objConexion.mtdConexion());
            comando.CommandType = CommandType.StoredProcedure;

            return comando;
        }
    }
}

