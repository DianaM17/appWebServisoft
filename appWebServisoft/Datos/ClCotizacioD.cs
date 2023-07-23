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

        public List<ClCotizacionE> mtdListaCotizacionCliente(int idCliente)
        {
            string consulta = "select * from Cotizacion where idCliente ='" + idCliente + "'";
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


        public int mtdRegistrarSelecionCotizacion(ClSeleccionCotizacionE objSelectCot)
        {
            string Registro = "Insert Into SeleccionCotizacion(seleccionProfesional, idProfesional, idCotizacion)" +
                             "Values(" + objSelectCot.seleccionProfesional + "," + objSelectCot.idProfesional + "," + objSelectCot.idCotizacion + ")";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int regis = SQL.mtdIUDConec(Registro);
            return regis;
        }


        public List<ClSeleccionCotizacionE> mtdSeleccionCotizacion(int seleccionProf)
        {
            string consulta = "SELECT * FROM SeleccionCotizacion WHERE seleccionProfesional = '" + seleccionProf + "'";
                ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblSeleccionCotizacion = objSQL.mtdSelectDesc(consulta);

            List<ClSeleccionCotizacionE> listaCotizacion = new List<ClSeleccionCotizacionE>();

            for (int i = 0; i < tblSeleccionCotizacion.Rows.Count; i++)
            {
                ClSeleccionCotizacionE ObjCotizacion = new ClSeleccionCotizacionE();
                ObjCotizacion.idSeleccionCotizacion = int.Parse(tblSeleccionCotizacion.Rows[i]["idSeleccionCotizacion"].ToString());
                ObjCotizacion.seleccionProfesional = int.Parse(tblSeleccionCotizacion.Rows[i]["seleccionProfesional"].ToString());
                listaCotizacion.Add(ObjCotizacion);

            }

            return listaCotizacion;
        }


        public List<ClSeleccionCotizacion1E> mtdListarProfesionalCotizacion(int idCotizacion, int seleccionProfesional)
        {
            string consulta = "SELECT Cotizacion.idCotizacion, Cotizacion.tituloServicio, Cotizacion.descripcion, SeleccionCotizacion.*, Profesional.nombres, Profesional.apellidos FROM Cotizacion INNER JOIN SeleccionCotizacion ON Cotizacion.idCotizacion = SeleccionCotizacion.idCotizacion INNER JOIN Profesional ON SeleccionCotizacion.idProfesional = Profesional.idProfesional WHERE Cotizacion.idCotizacion = '" + idCotizacion + "'AND SeleccionCotizacion.SeleccionProfesional = '"+seleccionProfesional+"'";
            ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblSeleccionCotizacion = objSQL.mtdSelectDesc(consulta);

            List<ClSeleccionCotizacion1E> listaCotizacion = new List<ClSeleccionCotizacion1E>();

            for (int i = 0; i < tblSeleccionCotizacion.Rows.Count; i++)
            {
                ClSeleccionCotizacion1E ObjCotizacion = new ClSeleccionCotizacion1E();
                ObjCotizacion.idCotizacion = int.Parse(tblSeleccionCotizacion.Rows[i]["idCotizacion"].ToString());
                ObjCotizacion.tituloServicio = tblSeleccionCotizacion.Rows[i]["tituloServicio"].ToString();
                ObjCotizacion.descripcion = tblSeleccionCotizacion.Rows[i]["descripcion"].ToString();
                ObjCotizacion.idSeleccionCotizacion = int.Parse(tblSeleccionCotizacion.Rows[i]["idSeleccionCotizacion"].ToString());
                ObjCotizacion.seleccionProfesional = int.Parse(tblSeleccionCotizacion.Rows[i]["seleccionProfesional"].ToString());
                ObjCotizacion.idProfesional = int.Parse(tblSeleccionCotizacion.Rows[i]["idProfesional"].ToString());
                ObjCotizacion.nombres = tblSeleccionCotizacion.Rows[i]["nombres"].ToString();
                ObjCotizacion.apellidos = tblSeleccionCotizacion.Rows[i]["apellidos"].ToString();
                listaCotizacion.Add(ObjCotizacion);

            }

            return listaCotizacion;
        }
    }
}