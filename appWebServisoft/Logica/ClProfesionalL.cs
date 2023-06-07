using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClProfesionalL
    {
        public int mtdRegistroProfesionales(ClProfesionalE objProfesional)
        {
            ClProfesionalD objProfesionalD = new ClProfesionalD();
            int registro = objProfesionalD.mtdRegistroProfesional(objProfesional);
            return registro;
        }

        public ClProfesionalE mtdLoginProfesional(string usuario, string clave)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            ClProfesionalE datos = objProf.mtdLoginProfesional(usuario, clave);
            return datos;
        }

        public int mtdVerificarCorreo(string email)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            int Verificar = objProf.mtdVerificarCorreo(email);
            return Verificar;
        }

        public int mtdActualizarContrasela(string email, string clave)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            int Actualizar = objProf.mtdActualizarContaseña(email, clave);
            return Actualizar;
        }

        public ClProfesionalE mtdBuscarProf(int idProfesional)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            ClProfesionalE objDatos = objProf.mtdSeleccionarProf(idProfesional);
            return objDatos;
        }

        public int mtdActualizarDatos(ClProfesionalE objDatos, int idProfesional)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            int Actualizar = objProf.mtdActualizarDatos(objDatos, idProfesional);
            return Actualizar;
        }
        public int mtdCambiarEstado(ClProfesionalE objDatos, int idProfesional)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            int Actualizar = objProf.mtdCambiarEstado(objDatos, idProfesional);
            return Actualizar;
        }
        public List<ClProfesionalE> mtdListarProfesional()
        {
            ClProfesionalD ObjProfecionalProfecional = new ClProfesionalD();
            List<ClProfesionalE> verProfesional = ObjProfecionalProfecional.mtdListarProfecional();
            return verProfesional;
        }
        public int mtdVerificarTelefono(string telefono)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            int Verificar = objProf.mtdVerificarTelefono(telefono);
            return Verificar;
        }

        public int mtdActualizarImagen(ClProfesionalE objProf, int idProfesional)
        {
            ClProfesionalD objProfD = new ClProfesionalD();
            int Actualizar = objProfD.mtdActualizarImagen(objProf, idProfesional);
            return Actualizar;
        }

        public int mtdRegistraImagenTrabajo(ClImagenesServicioE objTrab)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            int Agregar = objProf.mtdRegistrarTrabajo(objTrab);
            return Agregar;
        }

        public List<ClImagenesServicioE> mtdListarTrabajos(int idProfesional)
        {
            ClProfesionalD objProf = new ClProfesionalD();
            List<ClImagenesServicioE> lista = objProf.mtdListarImgTrab(idProfesional);
            return lista;
        }
    }
}

