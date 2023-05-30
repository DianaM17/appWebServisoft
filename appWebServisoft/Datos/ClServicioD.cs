using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClServicioD
    {
        public List<ClServicioE> mtdListarServicio(string idCateg)
        {
            string consulta = "Select * from Servicio where idCategoria = '" + idCateg + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblServicios = SQL.mtdSelectDesc(consulta);

            List<ClServicioE> listaServicio = new List<ClServicioE>();
            ClServicioE objServ = null;
            for (int i = 0; i < tblServicios.Rows.Count; i++)
            {
                objServ = new ClServicioE();
                objServ.idServicio = int.Parse(tblServicios.Rows[i]["idServicio"].ToString());
                objServ.servicio = tblServicios.Rows[i]["servicio"].ToString();
                objServ.idCategoria = int.Parse(tblServicios.Rows[i]["idCategoria"].ToString());
                listaServicio.Add(objServ);
            }
            return listaServicio;
        }

        public int mtdVerificarServ(string servicio)
        {
            string consulta = "Select Count(*) from Servicio where Servicio='" + servicio + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int consul = SQL.mtdSelectConec(consulta);
            return consul;
        }
        
        public int mtdRegistrarServicio(ClServicioE objDatos)
        {
            string registro = "Insert into Servicio(servicio, idCategoria) values ('"+objDatos.servicio+"',"+objDatos.idCategoria+")";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int regis = SQL.mtdIUDConec(registro);
            return regis;
        }
    }
}