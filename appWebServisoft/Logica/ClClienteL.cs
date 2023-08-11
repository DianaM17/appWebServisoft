using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClClienteL : ClCiudadE
    {
        public int mtdRegistroCliente(ClClienteE objDatos)
        {
            ClClienteD objClienteD = new ClClienteD();
            int registrar = objClienteD.mtdRegistraCliente(objDatos);
            return registrar;
        }
        public ClClienteE mtdLoginCliente(string usuario, string clave)
        {
            ClClienteD objCliente = new ClClienteD();
            ClClienteE datos = objCliente.mtdLoginCliente(usuario, clave);
            return datos;
        }
        public int mtdVerificarCorreo(string email)
        {
            ClClienteD objcliente = new ClClienteD();
            int Verificar = objcliente.mtdVerificarCorreo(email);
            return Verificar;
        }

        public int mtdActualizarContrasela(string email, string clave)
        {
            ClClienteD objCliente = new ClClienteD();
            int Actualizar = objCliente.mtdActualizarContaseña(email, clave);
            return Actualizar;
        }

        public int mtdVerificarTelefono(string telefono)
        {
            ClClienteD objCliente = new ClClienteD();
            int Actualizar = objCliente.mtdVerificarTelefono(telefono);
            return Actualizar;
        }

        public ClClienteE mtdSeleccionarCliente(int idCliente)
        {
            ClClienteD objCliente = new ClClienteD();
            ClClienteE Seleccionar = objCliente.mtdSeleccionarCliente(idCliente);
            return Seleccionar;
        }

        public int mtdActualizarDatos(ClClienteE objClient, int idCliente)
        {
            ClClienteD objCliente = new ClClienteD();
            int Actualizar = objCliente.mtdActualizarDatos(objClient, idCliente);
            return Actualizar;
        }
        public int mtdActualizarImagen(ClClienteE objCliente, int idCliente)
        {
            ClClienteD objProfD = new ClClienteD();
            int Actualizar = objProfD.mtdActualizarImagen(objCliente, idCliente);
            return Actualizar;
        }
    }
}