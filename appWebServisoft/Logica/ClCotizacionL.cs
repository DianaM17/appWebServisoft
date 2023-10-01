using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System.Collections.Generic;

namespace appWebServisoft.Logica
{
    public class ClCotizacionL
    {
        public int mtdRegistroCotizacion(ClCotizacionE objCot)
        {
            ClCotizacioD objCoti = new ClCotizacioD();
            int regis = objCoti.mtdRegistrarCotizacion(objCot);
            return regis;
        }

        public ClCotizacionE mtdCotizacion(int idCot)
        {
            ClCotizacioD objCotiz = new ClCotizacioD();
            ClCotizacionE lista = objCotiz.mtdMostrarImg(idCot);
            return lista;
        }

        public List<ClCotizacionE> mtdListarCotizacion(int idCategoria)
            {
            ClCotizacioD ObjCotizacion = new ClCotizacioD();
            List<ClCotizacionE> ListaCotizacion = ObjCotizacion.mtdListaCotizacion(idCategoria);
            return ListaCotizacion;
        }

        public List<ClCotizacionE> mtdListarCotizacionCliente(int idCliente)
        {
            ClCotizacioD ObjCotizacion = new ClCotizacioD();
            List<ClCotizacionE> ListaCotizacion = ObjCotizacion.mtdListaCotizacionCliente(idCliente);
            return ListaCotizacion;
        }


        public int mtdRegistroSeleccionCotizacion(ClSeleccionCotizacionE objSelectCot)
        {
            ClCotizacioD objSelectCoti = new ClCotizacioD();
            int regis = objSelectCoti.mtdRegistrarSelecionCotizacion(objSelectCot);
            return regis;
        }

        public List<ClSeleccionCotizacionE> mtdSeleccionCotizacion(int seleccionProf, int idProfesional)
        {
            ClCotizacioD ObjCotizacion = new ClCotizacioD();
            List<ClSeleccionCotizacionE> ListaCotizacion = ObjCotizacion.mtdSeleccionCotizacion(seleccionProf, idProfesional);
            return ListaCotizacion;
        }

        public List<ClSeleccionCotizacion1E> mtdListarProfesionalCotiizacion(int idCotizacion, int seleccionProfesional)
        {
            ClCotizacioD ObjCotizacion = new ClCotizacioD();
            List<ClSeleccionCotizacion1E> ListaCotizacion = ObjCotizacion.mtdListarProfesionalCotizacion(idCotizacion, seleccionProfesional);
            return ListaCotizacion;
        }

        //Logica eliminar selecion cotizacion
        public int mtdEliminarseleleccionCotizacion(int idSeleccionCotizacion)
        {
            ClCotizacioD objSelectCoti = new ClCotizacioD();
            int regis = objSelectCoti.mtdEliminarseleleccionCotizacion(idSeleccionCotizacion);
            return regis;
        }

        public List<ClListaCotizacionE> mtdListaCotizacionUsuario(int idCotizacion)
        {
            ClCotizacioD ObjCotizacion = new ClCotizacioD();
            List<ClListaCotizacionE> ListaCotizacion = ObjCotizacion.mtdListaCotizacionUsuario(idCotizacion);
            return ListaCotizacion;
        }
    }
}