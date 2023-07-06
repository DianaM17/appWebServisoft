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

        public int mtdsolicitarServicio(ClSolicitudServicioE objDatos)
        {

            string consulta = "Insert into solicitudServicio(fecha, hora, descripcion, estado, ubicacion, idServicio, idProfesional, " +
                "idCliente) values ('" + objDatos.fecha + "','" + objDatos.hora + "', '" + objDatos.descripcion + "','" +
                objDatos.ubicacion + "', " + objDatos.idServicio + ", " + objDatos.idProfesional + ", " + objDatos.idCliente + ")";

            string consulta = "Insert into solicitudServicio(fecha, hora, descripcion, estado, ubicacion, idCiudad, idServicio, idCategoria, idProfesional, " +
                "idCliente) values ('" + objDatos.fecha + "','" + objDatos.hora + "', '" + objDatos.descripcion + "', '" + objDatos.estado + "', '" +
                objDatos.ubicacion + "', "+objDatos.idCiudad+" , " + objDatos.idServicio + ", "+objDatos.idCategoria+", " + objDatos.idProfesional + ", " + objDatos.idCliente + ")";

            ClProcesarSQL SQL = new ClProcesarSQL();
            int registro = SQL.mtdIUDConec(consulta);
            return registro;
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
            string registro = "Insert into Servicio(servicio, idCategoria) values ('" + objDatos.servicio + "'," + objDatos.idCategoria + ")";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int regis = SQL.mtdIUDConec(registro);
            return regis;
        }

        public List<ClImagenesServicioE> mtdlistarImagenServicio()
        {
            string consulta = "select * from Imagenes";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblServicios = SQL.mtdSelectDesc(consulta);

            List<ClImagenesServicioE> listaServicio = new List<ClImagenesServicioE>();
            ClImagenesServicioE objServ = null;
            for (int i = 0; i < tblServicios.Rows.Count; i++)
            {
                objServ = new ClImagenesServicioE();
                objServ.imagen = tblServicios.Rows[i]["imagen"].ToString();
                listaServicio.Add(objServ);
            }
            return listaServicio;
        }

        //Lista todos los servicios que tiene un profesional
        public List<ClSolicitudServicioE> mtdServicioAceptado(int idProf)
        {
            string consulta = "Select * From SolicitudServicio Where idProfesional = " + idProf + "";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblServ = SQL.mtdSelectDesc(consulta);

            List<ClSolicitudServicioE> listaServ = new List<ClSolicitudServicioE>();
            ClSolicitudServicioE objServ = null;
            for (int i = 0; i < tblServ.Rows.Count; i++)
            {
                objServ = new ClSolicitudServicioE();
                objServ.idsolicitudServicio = int.Parse(tblServ.Rows[i]["idSolicitudServicio"].ToString());
                objServ.fecha = tblServ.Rows[i]["fecha"].ToString();
                objServ.hora = tblServ.Rows[i]["hora"].ToString();
                objServ.descripcion = tblServ.Rows[i]["descripcion"].ToString();
                objServ.ubicacion = tblServ.Rows[i]["ubicacion"].ToString();
                objServ.idCiudad = int.Parse(tblServ.Rows[i]["idCiudad"].ToString());
                objServ.idServicio = int.Parse(tblServ.Rows[i]["idServicio"].ToString());
                objServ.idProfesional = int.Parse(tblServ.Rows[i]["idProfesional"].ToString());
                objServ.idCliente = int.Parse(tblServ.Rows[i]["idCliente"].ToString());
                listaServ.Add(objServ);
            }
            return listaServ;
        }
    }
}