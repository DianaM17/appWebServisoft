using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClProfesionalD
    {
        public int mtdRegistroProfesional(ClProfesionalE objProfesional)
        {
            string Registro = "Insert Into Profesional(nombres,apellidos,telefono,email,clave,direccion,perfil,idCategoria,idServicio,idCiudad) Values('" + objProfesional.nombres + "','" + objProfesional.apellidos + "'," +
                "'" + objProfesional.telefono + "','" + objProfesional.email + "','" + objProfesional.clave + "','" + objProfesional.direccion + "','" + objProfesional.perfil + "'," + objProfesional.idCategoria + "," + objProfesional.idServicio + "," + objProfesional.idCiudad + ")";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Registros = SQL.mtdIUDConec(Registro);
            return Registros;
        }

        public ClProfesionalE mtdLoginProfesional(string Usuario, string clave)
        {
            string consulta = "Select * from Profesional where email='" + Usuario + "' and clave='" + clave + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblDatos = SQL.mtdSelectDesc(consulta);

            ClProfesionalE objProfesional = null;
            if (tblDatos.Rows.Count == 1)
            {
                objProfesional = new ClProfesionalE();
                objProfesional.idProfesional = int.Parse(tblDatos.Rows[0]["IdProfesional"].ToString());
                objProfesional.nombres = tblDatos.Rows[0]["nombres"].ToString();
                objProfesional.apellidos = tblDatos.Rows[0]["apellidos"].ToString();
                objProfesional.telefono = tblDatos.Rows[0]["telefono"].ToString();
                objProfesional.email = tblDatos.Rows[0]["email"].ToString();
                objProfesional.direccion = tblDatos.Rows[0]["direccion"].ToString();
                objProfesional.perfil = tblDatos.Rows[0]["perfil"].ToString();
                objProfesional.fotos = tblDatos.Rows[0]["fotos"].ToString();
                objProfesional.estado = tblDatos.Rows[0]["estado"].ToString();
                objProfesional.idServicio = int.Parse(tblDatos.Rows[0]["idServicio"].ToString());
                objProfesional.idCiudad = int.Parse(tblDatos.Rows[0]["IdCiudad"].ToString());
            }
            return objProfesional;
        }

        public int mtdVerificarCorreo(string email)
        {
            string correo = "SELECT COUNT(*) FROM Profesional WHERE email='" + email + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int verif = SQL.mtdVerificarExistenciaCorreo(correo);
            return verif;
        }
        public int mtdActualizarContaseña(string email, string nuevaContraseña)
        {
            string consulta = "UPDATE Profesional SET clave = '" + nuevaContraseña + "' where email='" + email + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int actualizar = SQL.mtdIUDConec(consulta);
            return actualizar;
        }
    }
}