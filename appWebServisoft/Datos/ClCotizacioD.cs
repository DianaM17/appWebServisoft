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

        public ClCotizacionE mtdMostrarImg(string idCategoria)
        {
            string consult = "Select imagen from Imagenes where idCategoria = "+idCategoria+"";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblCot = SQL.mtdSelectDesc(consult);

            ClCotizacionE objCot = null;
            if (tblCot.Rows.Count >0)
            {
                objCot = new ClCotizacionE();
                objCot.imagen = tblCot.Rows[0]["imagen"].ToString();
            }
            return objCot;
        }
    }
}