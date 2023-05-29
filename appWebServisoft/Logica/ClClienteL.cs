using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClClienteL
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

    }
}