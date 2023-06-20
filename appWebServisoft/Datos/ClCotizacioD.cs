using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
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
    }
}