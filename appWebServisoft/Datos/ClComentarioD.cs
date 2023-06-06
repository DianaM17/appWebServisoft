using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClComentarioD
    {
        public List<ClComentarioE> mtdListarComentario()
        {
            string consulta = "SELECT c.nombres, c.apellidos, ca.comentarios, ca.puntos FROM Cliente c JOIN Calificacion ca ON c.IdCliente = ca.IdCliente";
            ClProcesarSQL objSql = new ClProcesarSQL();
            DataTable tblComentario = objSql.mtdSelectDesc(consulta);

            List<ClComentarioE> listaComentarios = new List<ClComentarioE>();

            for (int i = 0; i < tblComentario.Rows.Count; i++)
            {
                ClComentarioE objDatos = new ClComentarioE();
                objDatos.nombres = tblComentario.Rows[i]["nombres"].ToString();
                objDatos.apellidos = tblComentario.Rows[i]["apellidos"].ToString();
                objDatos.comentarios = tblComentario.Rows[i]["comentarios"].ToString();
                objDatos.puntos = tblComentario.Rows[i]["puntos"].ToString();

                listaComentarios.Add(objDatos);
            }
            return listaComentarios;
        }
    }
}