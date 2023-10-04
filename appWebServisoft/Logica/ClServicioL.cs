using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClServicioL
    {
        public List<ClServicioE> mtdListarServicio(string idCateg)
        {
            ClServicioD objServicio = new ClServicioD();
            List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);
            return listaServicio;
        }

        public int mtdVerificarSer(string Servicio)
        {
            ClServicioD objServ = new ClServicioD();
            int verif = objServ.mtdVerificarServ(Servicio);
            return verif;
        }

        public int mtdRegistrarServ(ClServicioE objDatos)
        {
            ClServicioD objServ = new ClServicioD();
            int regis = objServ.mtdRegistrarServicio(objDatos);
            return regis;
        }

        public List<ClImagenesServicioE> mtdlistarImagenServicio()
        {
            ClServicioD objServicio = new ClServicioD();
            List<ClImagenesServicioE> listaServicio = objServicio.mtdlistarImagenServicio();
            return listaServicio;
        }

        public int mtdSolicitudServicio(ClSolicitudServicioE objDatos)
        {
            ClServicioD objSolicitud = new ClServicioD();
            int registro = objSolicitud.mtdsolicitarServicio(objDatos);
            return registro;
        }

        public List<ClSolicitudServicioE> mtdServicioAceptado(int idProfesional, string fecha = "")
        {
            ClServicioD objServicio = new ClServicioD();
            List<ClSolicitudServicioE> listaServ = objServicio.mtdServicioAceptado(idProfesional, fecha);
            return listaServ;
        }

        public List<ClSolicitudServicioE> mtdServicioCliente(int idCliente)
        {
            ClServicioD objServicio = new ClServicioD();
            List<ClSolicitudServicioE> listaServ = objServicio.mtdServicioCliente(idCliente);
            return listaServ;
        }

        public int mtdCancelarServicio(int idServicio)
        {
            ClServicioD objServicio = new ClServicioD();
            int cancelar = objServicio.mtdCancelarServicio(idServicio);
            return cancelar;
        }

        public int mtdReprogramarServicio(ClSolicitudServicioE objSolicitud, int idServicio)
        {
            ClServicioD objServ = new ClServicioD();
            int Reprogramar = objServ.mtdReprogramarServicio(objSolicitud, idServicio);
            return Reprogramar;
        }

        public List<ClSolicitudServicioE> mtdListarTrabajos(int idProfesional)
        {
            ClServicioD objServicio = new ClServicioD();
            List<ClSolicitudServicioE> listarTrabajos = objServicio.mtdListarTrabajos(idProfesional);
            return listarTrabajos;
        }

        public List<ClEstadoServicioE> mtdListarEstadoS()
        {
            ClServicioD objEstadoS = new ClServicioD();
            List<ClEstadoServicioE> ListaEstadoServ = objEstadoS.mtdListarEstadoS();
            return ListaEstadoServ;
        }

        public ClSolicitudServicioE mtdDatosServicio(int idServicio)
        {
            ClServicioD objServicio = new ClServicioD();
            ClSolicitudServicioE listarDatos = objServicio.mtdBuscarDatoServicio(idServicio);
            return listarDatos;
        }

        public ClSolicitudServicioE mtdSeleccionarServ(int idServicio)
        {
            ClServicioD objServ = new ClServicioD();
            ClSolicitudServicioE objServicio = objServ.mtdSeleccionarServ(idServicio);
            return objServicio;
        }

        public List<ClServiciooE> mtdBuscarServicio(int idCateg)
        {
            ClServicioD objServicio = new ClServicioD();
            List<ClServiciooE> listaServicio = objServicio.mtdBuscar(idCateg);
            return listaServicio;
        }

        public int mtdHoraDisponible(string fecha, string hora)
        {
            ClServicioD objServ = new ClServicioD();
            int Reprogramar = objServ.HoraDisponible(fecha, hora);
            return Reprogramar;

        }
    }
}