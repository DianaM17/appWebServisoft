using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Security.Cryptography;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClProfesionalD
    {
        public int mtdRegistroProfesional(ClProfesionalE objProfesional)
        {
            int Registros = 1;
            string Registro = "Insert Into Profesional(nombres,apellidos,telefono,email,clave,direccion,perfil,fotos,idCategoria,idServicio,idCiudad) " +
                "Values('" + objProfesional.nombres + "','" + objProfesional.apellidos + "','" + objProfesional.telefono + "','" + objProfesional.email + "'," +
                "'" + objProfesional.clave + "','" + objProfesional.direccion + "','" + objProfesional.perfil + "','" + objProfesional.fotos + "',"
                + objProfesional.idCategoria + "," + objProfesional.idServicio + "," + objProfesional.idCiudad + ") SELECT SCOPE_IDENTITY() AS [UltimoId]";

            ClProcesarSQL SQL = new ClProcesarSQL();
            //int Registros = SQL.mtdIUDConec(Registro);
            DataTable tblId = SQL.mtdSelectDesc(Registro);

            int idReg = int.Parse(tblId.Rows[0]["UltimoId"].ToString());
            //REGISTRO A LA TABLA DE ROMPIMIENTO
            int isServicio = objProfesional.idServicio;
            //string sql = "insert....";
            return Registros;
        }

        public ClProfesionalE mtdLoginProfesional(string Usuario, string clave)
        {
            string consulta = "Select * from Profesional where email='" + Usuario + "' and clave='" + clave + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblDatos = SQL.mtdSelectDesc(consulta);

            ClProfesionalE objProfesional = null;
            if (tblDatos.Rows.Count > 0)
            {
                objProfesional = new ClProfesionalE();
                objProfesional.idProfesional = int.Parse(tblDatos.Rows[0]["idProfesional"].ToString());
                objProfesional.nombres = tblDatos.Rows[0]["nombres"].ToString();
                objProfesional.apellidos = tblDatos.Rows[0]["apellidos"].ToString();
                objProfesional.telefono = tblDatos.Rows[0]["telefono"].ToString();
                objProfesional.email = tblDatos.Rows[0]["email"].ToString();
                objProfesional.clave = tblDatos.Rows[0]["clave"].ToString();
                objProfesional.direccion = tblDatos.Rows[0]["direccion"].ToString();
                objProfesional.perfil = tblDatos.Rows[0]["perfil"].ToString();
                objProfesional.fotos = tblDatos.Rows[0]["fotos"].ToString();
                objProfesional.estado = tblDatos.Rows[0]["estado"].ToString();
                objProfesional.idCategoria = int.Parse(tblDatos.Rows[0]["idCategoria"].ToString());
                objProfesional.idServicio = int.Parse(tblDatos.Rows[0]["idServicio"].ToString());
                objProfesional.idCiudad = int.Parse(tblDatos.Rows[0]["idCiudad"].ToString());
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

        public List<ClProfesionalE> mtdListarProfecional()
        {
            string Consulta = "Select * from Profesional [prof] inner join Categoria [cat] ON prof.idCategoria = cat.idCategoria";
            ClProcesarSQL ObjSQL = new ClProcesarSQL();
            DataTable TablaProfesional = ObjSQL.mtdSelectDesc(Consulta);
            List<ClProfesionalE> VerProfesional = new List<ClProfesionalE>();

            for (int i = 0; i < TablaProfesional.Rows.Count; i++)
            {
                ClProfesionalE ObjProfesional = new ClProfesionalE();
                ObjProfesional.nombres = TablaProfesional.Rows[i]["nombres"].ToString();
                ObjProfesional.apellidos = TablaProfesional.Rows[i]["apellidos"].ToString();
                ObjProfesional.fotos = TablaProfesional.Rows[i]["fotos"].ToString();
                ObjProfesional.estado = TablaProfesional.Rows[i]["estado"].ToString();
                ObjProfesional.idCategoria = int.Parse(TablaProfesional.Rows[i]["idCategoria"].ToString());
                ObjProfesional.categoria = TablaProfesional.Rows[i]["categoria"].ToString();
                ObjProfesional.categorias = TablaProfesional.Rows[i]["categoria"].ToString();

                VerProfesional.Add(ObjProfesional);

            }

            return VerProfesional;
        }

        public ClProfesionalE mtdSeleccionarProf(int idProfesional)
        {
            string consulta = "Select * from Profesional [prof] Inner join Categoria [cat] ON prof.idCategoria = cat.idCategoria " +
           "Inner Join Servicio [Serv] ON prof.idServicio = Serv.idServicio INNER JOIN Ciudad [ciu] ON prof.idCiudad = ciu.idCiudad " +
           "where idProfesional= " + idProfesional + "";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblDatos = SQL.mtdSelectDesc(consulta);

            ClProfesionalE objProf = null;
            if (tblDatos.Rows.Count > 0)
            {
                objProf = new ClProfesionalE();
                objProf.idProfesional = int.Parse(tblDatos.Rows[0]["idProfesional"].ToString());
                objProf.nombres = tblDatos.Rows[0]["nombres"].ToString();
                objProf.apellidos = tblDatos.Rows[0]["apellidos"].ToString();
                objProf.telefono = tblDatos.Rows[0]["telefono"].ToString();
                objProf.email = tblDatos.Rows[0]["email"].ToString();
                objProf.clave = tblDatos.Rows[0]["clave"].ToString();
                objProf.direccion = tblDatos.Rows[0]["direccion"].ToString();
                objProf.perfil = tblDatos.Rows[0]["perfil"].ToString();
                objProf.fotos = tblDatos.Rows[0]["fotos"].ToString();
                objProf.estado = tblDatos.Rows[0]["estado"].ToString();
                objProf.idCategoria = int.Parse(tblDatos.Rows[0]["idCategoria"].ToString());
                objProf.categoria = tblDatos.Rows[0]["categoria"].ToString();
                objProf.idServicio = int.Parse(tblDatos.Rows[0]["idServicio"].ToString());
                objProf.servicio = tblDatos.Rows[0]["servicio"].ToString();
                objProf.idCiudad = int.Parse(tblDatos.Rows[0]["idCiudad"].ToString());
                objProf.nombre = tblDatos.Rows[0]["nombre"].ToString();
            }
            return objProf;
        }

        public int mtdActualizarDatos(ClProfesionalE objDatos, int idProfesional)
        {
            string actualizar = "Update Profesional set nombres = '" + objDatos.nombres + "', apellidos = '" + objDatos.apellidos + "', telefono='" + objDatos.telefono + "'," +
                "email='" + objDatos.email + "',clave='" + objDatos.clave + "',direccion='" + objDatos.direccion + "', perfil = '" + objDatos.perfil + "', fotos = '" + objDatos.fotos + "', " +
                "idCategoria = " + objDatos.idCategoria + ", idServicio = " + objDatos.idServicio + ", idCiudad = " + objDatos.idCiudad + " where idProfesional = " + idProfesional + ";";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Actualizar = SQL.mtdIUDConec(actualizar);
            return Actualizar;

        }

        public int mtdCambiarEstado(ClProfesionalE objDatos, int idProfesional)
        {
            string actualizar = "Update Profesional set estado = '" + objDatos.estado + "' where idProfesional = " + idProfesional + "";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Actualizar = SQL.mtdIUDConec(actualizar);
            return Actualizar;
        }

        public int mtdVerificarTelefono(string telefono)
        {
            string consulta = "Select Count(*) from Profesional where telefono='" + telefono + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Verificar = SQL.mtdSelectConec(consulta);
            return Verificar;

        }


        public int mtdActualizarImagen(ClProfesionalE objProf, int idProfesional)
        {
            string Consulta = "Update Profesional Set fotos = '" + objProf.fotos + "' where idProfesional=" + idProfesional + "";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Actualizar = SQL.mtdIUDConec(Consulta);
            return Actualizar;
        }

        public int mtdRegistrarTrabajo(ClImagenesServicioE objTrab)
        {
            string Consulta = "Insert Into Imagenes(imagen,idProfesional) Values('" + objTrab.imagen + "','" + objTrab.idProfesional + "')";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Regis = SQL.mtdIUDConec(Consulta);
            return Regis;
        }

        public List<ClImagenesServicioE> mtdListarImgTrab(int idProfesional)
        {
            string consulta = "Select imagen, idProfesional from Imagenes Where idProfesional = '" + idProfesional + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblImgTrabajos = SQL.mtdSelectDesc(consulta);
            List<ClImagenesServicioE> listaTrabajos = new List<ClImagenesServicioE>();
            ClImagenesServicioE objTrabajos = null;
            for (int i = 0; i < tblImgTrabajos.Rows.Count; i++)
            {
                objTrabajos = new ClImagenesServicioE();
                objTrabajos.imagen = tblImgTrabajos.Rows[i]["imagen"].ToString();
                objTrabajos.idProfesional = int.Parse(tblImgTrabajos.Rows[i]["idProfesional"].ToString());
                listaTrabajos.Add(objTrabajos);
            }
            return listaTrabajos;
        }

        public List<ClProfesionalSimple> mtdListarProfesionalActivo()

        {
            string Consulta = "SELECT * FROM Profesional WHERE estado = 'Activo'";
            ClProcesarSQL ObjSQL = new ClProcesarSQL();
            DataTable TablaProfesional = ObjSQL.mtdSelectDesc(Consulta);
            List<ClProfesionalSimple> VerProfesional = new List<ClProfesionalSimple>();
            ClProfesionalSimple ObjProfesional = null;
            for (int i = 0; i < TablaProfesional.Rows.Count; i++)
            {
                ObjProfesional = new ClProfesionalSimple();

                ObjProfesional.idProfesional = int.Parse(TablaProfesional.Rows[i]["idProfesional"].ToString());
                ObjProfesional.nombres = TablaProfesional.Rows[i]["nombres"].ToString();
                ObjProfesional.apellidos = TablaProfesional.Rows[i]["apellidos"].ToString();
                ObjProfesional.fotos = TablaProfesional.Rows[i]["fotos"].ToString();
                ObjProfesional.estado = TablaProfesional.Rows[i]["estado"].ToString();

                VerProfesional.Add(ObjProfesional);
            }

            return VerProfesional;
        }
    }
}
