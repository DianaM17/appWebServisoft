﻿using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
            string Consulta = "Select * from Profesional";

            ClProcesarSQL ObjSQL = new ClProcesarSQL();
            DataTable TablaProfesional = ObjSQL.mtdSelectDesc(Consulta);



            List<ClProfesionalE> VerProfesional = new List<ClProfesionalE>();

            for (int i = 0; i < TablaProfesional.Rows.Count; i++)
            {
                ClProfesionalE ObjProfesional = new ClProfesionalE();
                ObjProfesional.idProfesional = int.Parse(TablaProfesional.Rows[i]["idProfesional"].ToString());
                ObjProfesional.nombres = TablaProfesional.Rows[i]["nombres"].ToString();
                ObjProfesional.apellidos = TablaProfesional.Rows[i]["apellidos"].ToString();
                ObjProfesional.telefono = TablaProfesional.Rows[i]["telefono"].ToString();
                ObjProfesional.email = TablaProfesional.Rows[i]["email"].ToString();
                ObjProfesional.clave = TablaProfesional.Rows[i]["clave"].ToString();
                ObjProfesional.direccion = TablaProfesional.Rows[i]["direccion"].ToString();
                ObjProfesional.perfil = TablaProfesional.Rows[i]["perfil"].ToString();
                ObjProfesional.fotos = TablaProfesional.Rows[i]["fotos"].ToString();
                ObjProfesional.estado = TablaProfesional.Rows[i]["estado"].ToString();
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
                objProf.idServicio = int.Parse(tblDatos.Rows[0]["idServicio"].ToString());
                objProf.idCiudad = int.Parse(tblDatos.Rows[0]["idCiudad"].ToString());
            }
            return objProf;

        }

        public int mtdActualizarDatos(ClProfesionalE objDatos, int idProfesional)
        {
            string actualizar = "Update Profesional set nombres = '" + objDatos.nombres + "', apellidos = '" + objDatos.apellidos + "', telefono='" + objDatos.telefono + "'," +
                "email='" + objDatos.email + "',clave='" + objDatos.clave + "',direccion='" + objDatos.direccion + "', perfil = '" + objDatos.perfil + "', fotos = '" + objDatos.fotos + "', " +
                "estado = '" + objDatos.estado + "', idCategoria = " + objDatos.idCategoria + ", idServicio = " + objDatos.idServicio + ", idCiudad = " + objDatos.idCiudad + " where idProfesional = " + idProfesional + ";";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Actualizar = SQL.mtdIUDConec(actualizar);
            return Actualizar;

        }
    }
}
