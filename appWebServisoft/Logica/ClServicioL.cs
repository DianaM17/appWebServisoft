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
    }
}