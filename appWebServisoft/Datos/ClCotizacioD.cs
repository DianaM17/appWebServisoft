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
            string consult = "Select * from Imagenes where idCategoria = '" + idCategoria + "'";
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


        public List<ClSeleccionCotizacionE> mtdSeleccionCotizacion(int seleccionProf, int idProfesional)
        {
            string consulta = "SELECT * FROM SeleccionCotizacion WHERE seleccionProfesional = '" + seleccionProf + "' AND idProfesional = '" + idProfesional + "'";
                ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblSeleccionCotizacion = objSQL.mtdSelectDesc(consulta);

            List<ClSeleccionCotizacionE> listaCotizacion = new List<ClSeleccionCotizacionE>();

            for (int i = 0; i < tblSeleccionCotizacion.Rows.Count; i++)
            {
                ClSeleccionCotizacionE ObjCotizacion = new ClSeleccionCotizacionE();
                ObjCotizacion.idSeleccionCotizacion = int.Parse(tblSeleccionCotizacion.Rows[i]["idSeleccionCotizacion"].ToString());
                ObjCotizacion.seleccionProfesional = int.Parse(tblSeleccionCotizacion.Rows[i]["seleccionProfesional"].ToString());
                ObjCotizacion.idProfesional = int.Parse(tblSeleccionCotizacion.Rows[i]["idProfesional"].ToString());
                ObjCotizacion.idCotizacion = int.Parse(tblSeleccionCotizacion.Rows[i]["idCotizacion"].ToString());
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


        //Metodo para cancelar seleccion cotizacion
        public int mtdEliminarseleleccionCotizacion(int idseleccionCotizacion)
        {
            string Registro = "DELETE FROM seleccionCotizacion WHERE idseleccionCotizacion ='" + idseleccionCotizacion + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int regis = SQL.mtdIUDConec(Registro);
            return regis;
        }


        public List<ClListaCotizacionE> mtdListaCotizacionUsuario(int idCotizacion)
        {
            string consulta = "SELECT Cotizacion.idCotizacion, Ciudad.nombre AS Ciudad, Servicio.servicio AS Servicio, Categoria.categoria AS Categoria, Cotizacion.tituloServicio AS Titulo, Cotizacion.descripcion AS DescripcionCotizacion, Cotizacion.idCiudad, Cotizacion.idCategoria, Cotizacion.idServicio, Cotizacion.direccion FROM Cotizacion INNER JOIN Ciudad ON Cotizacion.idCiudad = Ciudad.idCiudad INNER JOIN Servicio ON Cotizacion.idServicio = Servicio.idServicio INNER JOIN Categoria ON Servicio.idCategoria = Categoria.idCategoria WHERE Cotizacion.idCotizacion='" + idCotizacion + "'";
            ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblCotizacion = objSQL.mtdSelectDesc(consulta);

            List<ClListaCotizacionE> listaCotizacion = new List<ClListaCotizacionE>();

            for (int i = 0; i < tblCotizacion.Rows.Count; i++)
            {
                ClListaCotizacionE ObjCotizacion = new ClListaCotizacionE();
                ObjCotizacion.idCotizacion = int.Parse(tblCotizacion.Rows[i]["idCotizacion"].ToString());
                ObjCotizacion.tituloServicio = tblCotizacion.Rows[i]["Titulo"].ToString();
                ObjCotizacion.descripcion = tblCotizacion.Rows[i]["DescripcionCotizacion"].ToString();
                ObjCotizacion.direccion = tblCotizacion.Rows[i]["direccion"].ToString();
                ObjCotizacion.ciudad = tblCotizacion.Rows[i]["Ciudad"].ToString();
                ObjCotizacion.servicio = tblCotizacion.Rows[i]["Servicio"].ToString();
                ObjCotizacion.categoria = tblCotizacion.Rows[i]["Categoria"].ToString();
                ObjCotizacion.idCiudad = int.Parse(tblCotizacion.Rows[i]["idCiudad"].ToString());
                ObjCotizacion.idServicio = int.Parse(tblCotizacion.Rows[i]["idServicio"].ToString());
                ObjCotizacion.idCategoria = int.Parse(tblCotizacion.Rows[i]["idCategoria"].ToString());
                listaCotizacion.Add(ObjCotizacion);

            }

            return listaCotizacion;
        }
    }
}