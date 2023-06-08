using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClClienteD
    {
        public int mtdRegistraCliente(ClClienteE objDatos)
        {
            string Registro = "Insert Into Cliente(nombres,apellidos,direccion,telefono,email,clave,idCiudad) Values('" + objDatos.nombres + "'," +
                "'" + objDatos.apellidos + "','" + objDatos.direccion + "','" + objDatos.telefono + "','" + objDatos.email + "','" + objDatos.clave + "'," + objDatos.idCiudad + ")";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int registros = SQL.mtdIUDConec(Registro);
            return registros;
        }

        public ClClienteE mtdLoginCliente(string usuario, string clave)
        {
            string consulta = "select * from Cliente where email='" + usuario + "' and clave='" + clave + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblDatos = SQL.mtdSelectDesc(consulta);

            ClClienteE objCliente = null;
            if (tblDatos.Rows.Count > 0)
            {
                objCliente = new ClClienteE();
                objCliente.idCliente = int.Parse(tblDatos.Rows[0]["idCliente"].ToString());
                objCliente.nombres = tblDatos.Rows[0]["nombres"].ToString();
                objCliente.apellidos = tblDatos.Rows[0]["apellidos"].ToString();
                objCliente.direccion = tblDatos.Rows[0]["direccion"].ToString();
                objCliente.telefono = tblDatos.Rows[0]["telefono"].ToString();
                objCliente.email = tblDatos.Rows[0]["email"].ToString();
                objCliente.clave = tblDatos.Rows[0]["clave"].ToString();
                objCliente.idCiudad = int.Parse(tblDatos.Rows[0]["idCiudad"].ToString());
            }
            return objCliente;
        }
        public int mtdVerificarCorreo(string email)
        {
            string correo = "SELECT COUNT(*) FROM Cliente WHERE email='" + email + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int verif = SQL.mtdVerificarExistenciaCorreo(correo);
            return verif;
        }
        public int mtdActualizarContaseña(string email, string nuevaContraseña)
        {
            string consulta = "UPDATE Cliente SET clave = '" + nuevaContraseña + "' where email='" + email + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int actualizar = SQL.mtdIUDConec(consulta);
            return actualizar;
        }

        public int mtdVerificarTelefono(string telefono)
        {
            string verificar = "Select count(*) from cliente where telefono = '" + telefono + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Verificar = SQL.mtdSelectConec(verificar);
            return Verificar;
        }

        public ClClienteE mtdSeleccionarCliente(int idCliente)
        {
            string Consulta = "Select * from Cliente Inner join Ciudad ON Cliente.idCiudad = Ciudad.idCiudad where idCliente ='"+idCliente+"'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblCliente = SQL.mtdSelectDesc(Consulta);

            ClClienteE objCliente = null;
            if (tblCliente.Rows.Count>0)
            {
                objCliente = new ClClienteE();
                objCliente.idCliente = int.Parse(tblCliente.Rows[0]["idCliente"].ToString());
                objCliente.nombres = tblCliente.Rows[0]["nombres"].ToString();
                objCliente.apellidos = tblCliente.Rows[0]["apellidos"].ToString();
                objCliente.direccion = tblCliente.Rows[0]["direccion"].ToString();
                objCliente.telefono = tblCliente.Rows[0]["telefono"].ToString();
                objCliente.email = tblCliente.Rows[0]["email"].ToString();
                objCliente.clave = tblCliente.Rows[0]["clave"].ToString();
                objCliente.idCiudad = int.Parse(tblCliente.Rows[0]["idCiudad"].ToString());
                objCliente.nombre = tblCliente.Rows[0]["nombre"].ToString();
            }
            return objCliente;
        }

        public int mtdActualizarDatos(ClClienteE objCliente ,int idCliente)
        {
            string Actualizar = "UPDATE Cliente Set nombres ='" + objCliente.nombres + "', apellidos='" + objCliente.apellidos + "',direccion=" +
                "'" + objCliente.direccion + "',telefono='" + objCliente.telefono + "',email='" + objCliente.email + "',clave='" + objCliente.clave + "'," +
                "foto = '"+objCliente.foto+"',idCiudad=" + objCliente.idCiudad + " where idCliente=" + idCliente + "";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int actualizar = SQL.mtdIUDConec(Actualizar);
            return actualizar;
        }
    }
}
