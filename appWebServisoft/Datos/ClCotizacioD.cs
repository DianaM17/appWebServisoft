using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClCotizacioD
    { 
        public int mtdRegistrarCotizacion(ClCotizacionE objCot)
        {
            string Registro = "Insert Into Cotizacion(tituloServicio,descripcion,imagen,direccion,idCiudad,idCategoria,idServicio,idCliente)" + 
                "Values('" + objCot.tituloServicio + "','" + objCot.descripcion + "','"+objCot.imagen+"'," +
                "'"+objCot.direccion+"',"+objCot.idCiudad+","+objCot.idCategoria+","+objCot.idServicio+","+objCot.idCliente+")";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int regis = SQL.mtdIUDConec(Registro);
            return regis;
        }

        public ClCotizacionE mtdMostrarImg(int idCategoria)
        {
            string consult = "Select * from Imagenes where idCategoria = "+idCategoria+"";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblCot = SQL.mtdSelectDesc(consult);

            ClCotizacionE objCot = null;
            if (tblCot.Rows.Count >0)
            {
                objCot = new ClCotizacionE();
                objCot.imagen = tblCot.Rows[0]["imagen"].ToString();
                objCot.idCategoria = int.Parse(tblCot.Rows[0]["idCategoria"].ToString());
            }
            return objCot;
        }



        public List<ClCotizacionE> mtdListaCotizacion(int idCategoria)
        {
            string consulta = "select * from Cotizacion where idCategoria ='"+idCategoria+"'";
            ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblCotizacion = objSQL.mtdSelectDesc(consulta);

            List<ClCotizacionE> listaCotizacion = new List<ClCotizacionE>();

            for (int i = 0; i < tblCotizacion.Rows.Count; i++)
            {
                ClCotizacionE ObjCotizacion = new ClCotizacionE();
                ObjCotizacion.idCotizacion = int.Parse(tblCotizacion.Rows[i]["idCotizacion"].ToString());
                ObjCotizacion.tituloServicio = tblCotizacion.Rows[i]["tituloServicio"].ToString();
                ObjCotizacion.descripcion = tblCotizacion.Rows[i]["descripcion"].ToString();
                ObjCotizacion.imagen = tblCotizacion.Rows[i]["imagen"].ToString();
                ObjCotizacion.direccion = tblCotizacion.Rows[i]["direccion"].ToString();
                ObjCotizacion.idCategoria = int.Parse(tblCotizacion.Rows[i]["idCategoria"].ToString());
                listaCotizacion.Add(ObjCotizacion);

            }

            return listaCotizacion;
        }
    }
}