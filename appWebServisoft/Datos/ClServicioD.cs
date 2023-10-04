using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClServicioD
    {
        public List<ClServicioE> mtdListarServicio(string idCateg)
        {
            string consulta = "Select * from Servicio where idCategoria = " + idCateg + "";
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

            string consulta = "Insert into solicitudServicio(fecha, hora, descripcion, ubicacion, idCiudad, idServicio, idProfesional, " +
                "idCliente, idEstadoServicio) values ('" + objDatos.fecha + "','" + objDatos.hora + "', '" + objDatos.descripcion + "','" +
                objDatos.ubicacion + "', " + objDatos.idCiudad + " , " + objDatos.idServicio + ", " + objDatos.idProfesional + ", " + objDatos.idCliente + ", " + objDatos.idEstadoServicio + ")";

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
        public List<ClSolicitudServicioE> mtdServicioAceptado(int idProf, string fecha = "")
        {
            string consulta = "";
            if (fecha == "")
            {
                consulta = "SELECT SolSer.fecha,hora,descripcion,ubicacion, Ciu.nombre, Servicio.servicio, cli.nombres,apellidos " +
                "FROM solicitudServicio[SolSer] JOIN Ciudad[Ciu] ON SolSer.idCiudad = Ciu.idCiudad JOIN Servicio " +
                "ON SolSer.idServicio = Servicio.idServicio JOIN Cliente[cli] " +
                "ON SolSer.idCliente = cli.idCliente where idEstadoServicio = 1  and idProfesional = " + idProf + "";
            }
            else if (fecha != "")
            {
                consulta = "SELECT SolSer.fecha,hora,descripcion,ubicacion, Ciu.nombre, Servicio.servicio, cli.nombres,apellidos " +
                "FROM solicitudServicio[SolSer] JOIN Ciudad[Ciu] ON SolSer.idCiudad = Ciu.idCiudad JOIN Servicio " +
                "ON SolSer.idServicio = Servicio.idServicio JOIN Cliente[cli] " +
                "ON SolSer.idCliente = cli.idCliente where idEstadoServicio = 1  and idProfesional = " + idProf + " and fecha = '" + fecha + "'";
            }
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblServ = SQL.mtdSelectDesc(consulta);

            List<ClSolicitudServicioE> listaServ = new List<ClSolicitudServicioE>();
            ClSolicitudServicioE objServ = null;
            for (int i = 0; i < tblServ.Rows.Count; i++)
            {
                objServ = new ClSolicitudServicioE();
                string fechaCompleta = tblServ.Rows[i]["fecha"].ToString();
                DateTime fechas = DateTime.Parse(fechaCompleta);
                string fechaSinHora = fechas.ToString("dd-MM-yyyy");
                objServ.fecha = fechaSinHora;
                objServ.hora = tblServ.Rows[i]["hora"].ToString();
                objServ.descripcion = tblServ.Rows[i]["descripcion"].ToString();
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

            string consulta = "SELECT SolSer.idsolicitudServicio, fecha, hora, descripcion, ubicacion, Ciu.nombre, Servicio.servicio, Prof.nombres, apellidos," +
                "SolSer.idEstadoServicio, EstadoServicio.* FROM solicitudServicio [SolSer] JOIN Ciudad [Ciu] ON SolSer.idCiudad = Ciu.idCiudad JOIN Servicio " +
                "ON SolSer.idServicio = Servicio.idServicio JOIN Profesional [Prof] ON SolSer.idProfesional = Prof.idProfesional JOIN EstadoServicio " +
                "ON SolSer.idEstadoServicio = EstadoServicio.idEstadoServicio WHERE (SolSer.idEstadoServicio = 1 OR SolSer.idEstadoServicio = 5) " +
                "AND SolSer.idCliente = " + idCliente + "";

            ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblDatos = objSQL.mtdSelectDesc(consulta);

            List<ClSolicitudServicioE> listaServ = new List<ClSolicitudServicioE>();
            ClSolicitudServicioE objServ = null;
            for (int i = 0; i < tblDatos.Rows.Count; i++)
            {
                objServ = new ClSolicitudServicioE();
                objServ.idsolicitudServicio = int.Parse(tblDatos.Rows[i]["idsolicitudServicio"].ToString());
                string fechaCompleta = tblDatos.Rows[i]["fecha"].ToString();
                DateTime fechas = DateTime.Parse(fechaCompleta);
                string fechaSinHora = fechas.ToString("dd-MM-yyyy");
                objServ.fecha = fechaSinHora;
                objServ.hora = tblDatos.Rows[i]["hora"].ToString();
                objServ.descripcion = tblDatos.Rows[i]["descripcion"].ToString();
                objServ.ubicacion = tblDatos.Rows[i]["ubicacion"].ToString();
                objServ.nombre = tblDatos.Rows[i]["nombre"].ToString(); //Nombre de la ciudad
                objServ.servicio = tblDatos.Rows[i]["servicio"].ToString();
                objServ.nombres = tblDatos.Rows[i]["nombres"].ToString();
                objServ.apellidos = tblDatos.Rows[i]["apellidos"].ToString();
                objServ.NombreCompleto = objServ.nombres + " " + objServ.apellidos;
                objServ.estadoServ = tblDatos.Rows[i]["estado"].ToString();
                listaServ.Add(objServ);
            }
            return listaServ;
        }

        public int mtdCancelarServicio(int idSolicitud)
        {
            string consulta = "Update solicitudServicio Set idEstadoServicio = 2 where idSolicitudServicio = " + idSolicitud + "";
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

        public ClSolicitudServicioE mtdSeleccionarServ(int idServicio)
        {
            string consulta = " Select * from solicitudServicio soli inner join EstadoServicio Es On soli.idEstadoServicio = Es.idEstadoServicio " +
                "inner join Ciudad ciu on soli.idCiudad = ciu.idCiudad where idsolicitudServicio = " + idServicio + "";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblDatos = SQL.mtdSelectDesc(consulta);

            ClSolicitudServicioE objServ = null;
            if (tblDatos.Rows.Count > 0)
            {
                objServ = new ClSolicitudServicioE();
                objServ.idsolicitudServicio = int.Parse(tblDatos.Rows[0]["idSolicitudServicio"].ToString());
                objServ.fecha = tblDatos.Rows[0]["fecha"].ToString();
                objServ.hora = tblDatos.Rows[0]["hora"].ToString();
                objServ.estadoServ = tblDatos.Rows[0]["estado"].ToString();
                objServ.ubicacion = tblDatos.Rows[0]["ubicacion"].ToString();
                objServ.nombre = tblDatos.Rows[0]["nombre"].ToString();
            }
            return objServ;
        }

        public List<ClSolicitudServicioE> mtdListarTrabajos(int idProf)
        {
            string consulta = "SELECT solicitudServicio.idsolicitudServicio, solicitudServicio.fecha, solicitudServicio.hora, solicitudServicio.descripcion, solicitudServicio.ubicacion, " +
                "ciudad.nombre AS nombreCiudad, servicio.servicio AS nombreServicio, profesional.nombres AS nombreProfesional, cliente.nombres AS nombreCliente, cliente.telefono AS telefonoCliente, Cliente.apellidos AS apellidoCliente, " +
                "EstadoServicio.estado AS estadoServicio FROM solicitudServicio LEFT JOIN ciudad ON solicitudServicio.idCiudad = ciudad.idCiudad " +
                "LEFT JOIN servicio ON solicitudServicio.idServicio = servicio.idServicio LEFT JOIN profesional ON solicitudServicio.idProfesional = profesional.idProfesional " +
                "LEFT JOIN cliente ON solicitudServicio.idCliente = cliente.idCliente LEFT JOIN EstadoServicio ON solicitudServicio.idEstadoServicio = EstadoServicio.idEstadoServicio " +
                "WHERE solicitudServicio.idProfesional = " + idProf + "";

            ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblDatos = objSQL.mtdSelectDesc(consulta);

            List<ClSolicitudServicioE> listaServ = new List<ClSolicitudServicioE>();
            ClSolicitudServicioE objServ = null;
            for (int i = 0; i < tblDatos.Rows.Count; i++)
            {
                objServ = new ClSolicitudServicioE();
                objServ.idsolicitudServicio = int.Parse(tblDatos.Rows[i]["idsolicitudServicio"].ToString());
                string fechaCompleta = tblDatos.Rows[i]["fecha"].ToString();
                DateTime fechas = DateTime.Parse(fechaCompleta);
                string fechaSinHora = fechas.ToString("dd-MM-yyyy");
                objServ.fecha = fechaSinHora;
                objServ.hora = tblDatos.Rows[i]["hora"].ToString();
                objServ.descripcion = tblDatos.Rows[i]["descripcion"].ToString();
                objServ.ubicacion = tblDatos.Rows[i]["ubicacion"].ToString();
                objServ.nombre = tblDatos.Rows[i]["nombreCiudad"].ToString();
                objServ.servicio = tblDatos.Rows[i]["nombreServicio"].ToString();
                objServ.nombres = tblDatos.Rows[i]["nombreCliente"].ToString();
                objServ.apellidos = tblDatos.Rows[i]["apellidoCliente"].ToString();
                objServ.NombreCompleto = objServ.nombres + " " + objServ.apellidos;
                objServ.telefonoCliente = tblDatos.Rows[i]["telefonoCliente"].ToString();
                objServ.estadoServ = tblDatos.Rows[i]["estadoServicio"].ToString();

                listaServ.Add(objServ);
            }
            return listaServ;
        }

        public List<ClEstadoServicioE> mtdListarEstadoS()
        {
            string Consulta = "Select idEstadoServicio, estado from EstadoServicio";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblEstadoS = SQL.mtdSelectDesc(Consulta);

            List<ClEstadoServicioE> listaEstadoS = new List<ClEstadoServicioE>();
            ClEstadoServicioE objDatos = null;
            for (int i = 0; i < tblEstadoS.Rows.Count; i++)
            {
                objDatos = new ClEstadoServicioE();
                objDatos.idEstadoServicio = int.Parse(tblEstadoS.Rows[i]["idEstadoServicio"].ToString());
                objDatos.estado = tblEstadoS.Rows[i]["estado"].ToString();
                listaEstadoS.Add(objDatos);
            }
            return listaEstadoS;
        }

        public ClSolicitudServicioE mtdBuscarDatoServicio(int idServicio)
        {
            string consulta = "Select * from solicitudServicio [soli] inner join EstadoServicio [est] ON soli.idEstadoServicio = est.idEstadoServicio " +
                "where idServicio ='" + idServicio + "'";
            ClProcesarSQL objSQL = new ClProcesarSQL();
            DataTable tblDatos = objSQL.mtdSelectDesc(consulta);

            ClSolicitudServicioE objServicio = null;
            if (tblDatos.Rows.Count > 0)
            {
                objServicio = new ClSolicitudServicioE();
                objServicio.fecha = tblDatos.Rows[0]["fecha"].ToString();
                objServicio.hora = tblDatos.Rows[0]["hora"].ToString();
                objServicio.estadoServ = tblDatos.Rows[0]["estado"].ToString();
                objServicio.ubicacion = tblDatos.Rows[0]["ubicacion"].ToString();
                objServicio.nombre = tblDatos.Rows[0]["nombre"].ToString();

            }
            return objServicio;
        }

        // Método para verificar si la fecha y hora ya están en la base de datos
        public int HoraDisponible(string fecha, string hora)
        {
            string consulta = "SELECT COUNT(*) FROM solicitudServicio WHERE fecha = '" + fecha + "' and hora = '" + hora + "'";

            ClProcesarSQL SQL = new ClProcesarSQL();
            int Reprogramar = SQL.mtdIUDConec(consulta);
            return Reprogramar;
        }
    }
}
