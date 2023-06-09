﻿using appWebServisoft.Entidades;
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
        public List<ClSolicitudServicioE> mtdServicioAceptado(int idProf, string fecha)
        {
            string consulta = "SELECT SolSer.fecha,hora,descripcion,ubicacion, Ciu.nombre, Servicio.servicio, cli.nombres,apellidos " +
                "FROM solicitudServicio[SolSer] JOIN Ciudad[Ciu] ON SolSer.idCiudad = Ciu.idCiudad JOIN Servicio " +
                "ON SolSer.idServicio = Servicio.idServicio JOIN Cliente[cli] " +
                "ON SolSer.idCliente = cli.idCliente where SolSer.estado = 'aceptado' and idProfesional = " + idProf + " and fecha = '" + fecha + "'";
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
                objServ.ubicacion = tblServ.Rows[i]["ubicacion"].ToString();
                objServ.nombre = tblServ.Rows[i]["nombre"].ToString(); //Nombre de la ciudad
                objServ.servicio = tblServ.Rows[i]["servicio"].ToString();
                objServ.nombres = tblServ.Rows[i]["nombres"].ToString();
                objServ.apellidos = tblServ.Rows[i]["apellidos"].ToString();
                objServ.NombreCompleto = objServ.nombres + " " + objServ.apellidos;
                listaServ.Add(objServ);
            }
            return listaServ;
        }

        //Muestra todos los servicios que ha hecho un cliente
        public List<ClSolicitudServicioE> mtdServicioCliente(int idCliente)
        {
            string consulta = "SELECT SolSer.idsolicitudServicio,fecha,hora,descripcion,ubicacion, Ciu.nombre, Servicio.servicio, Prof.nombres,apellidos" +
                " FROM solicitudServicio[SolSer] JOIN Ciudad[Ciu] ON SolSer.idCiudad = Ciu.idCiudad JOIN Servicio " +
                "ON SolSer.idServicio = Servicio.idServicio JOIN Profesional[Prof] " +
                "ON SolSer.idProfesional = Prof.idProfesional where SolSer.estado= 'aceptado' and idCliente = " + idCliente + "";
            ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblDatos = objSQL.mtdSelectDesc(consulta);

            List<ClSolicitudServicioE> listaServ = new List<ClSolicitudServicioE>();
            ClSolicitudServicioE objServ = null;
            for (int i = 0; i < tblDatos.Rows.Count; i++)
            {
                objServ = new ClSolicitudServicioE();
                objServ.idsolicitudServicio = int.Parse(tblDatos.Rows[i]["idsolicitudServicio"].ToString());
                objServ.fecha = tblDatos.Rows[i]["fecha"].ToString();
                objServ.hora = tblDatos.Rows[i]["hora"].ToString();
                objServ.descripcion = tblDatos.Rows[i]["descripcion"].ToString();
                objServ.ubicacion = tblDatos.Rows[i]["ubicacion"].ToString();
                objServ.nombre = tblDatos.Rows[i]["nombre"].ToString(); //Nombre de la ciudad
                objServ.servicio = tblDatos.Rows[i]["servicio"].ToString();
                objServ.nombres = tblDatos.Rows[i]["nombres"].ToString();
                objServ.apellidos = tblDatos.Rows[i]["apellidos"].ToString();
                objServ.NombreCompleto = objServ.nombres + " " + objServ.apellidos;
                listaServ.Add(objServ);
            }
            return listaServ;
        }

        public int mtdCancelarServicio(int idSolicitud)
        {
            string consulta = "Update solicitudServicio Set estado = 'cancelado' where idSolicitudServicio = " + idSolicitud + "";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int consul = SQL.mtdIUDConec(consulta);
            return consul;
        }

        public int mtdReprogramarServicio(ClSolicitudServicioE objServ, int idSolicitud)
        {
            string Consulta = "Update solicitudServicio Set fecha = '" + objServ.fecha + "',hora='" + objServ.hora + "'," +
                "ubicacion='" + objServ.ubicacion + "', idCiudad=" + objServ.idCiudad + " where idSolicitudServicio = " + idSolicitud + "";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Reprogramar = SQL.mtdIUDConec(Consulta);
            return Reprogramar;
        }
    }
}