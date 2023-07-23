using appWebServisoft.Entidades;
using System.Collections.Generic;
using System.Data;

namespace appWebServisoft.Datos
{
    public class ClComentarioD
    {
        public List<ClComentarioE> mtdListarComentario()
        {
            string consulta = "SELECT c.nombres, c.apellidos,c.foto, ca.comentarios, ca.nivel FROM Cliente c JOIN Calificacion ca ON c.IdCliente = ca.IdCliente ORDER BY RAND()";
            ClProcesarSQL objSql = new ClProcesarSQL();
            DataTable tblComentario = objSql.mtdSelectDesc(consulta);

            List<ClComentarioE> listaComentarios = new List<ClComentarioE>();

            for (int i = 0; i < tblComentario.Rows.Count; i++)
            {
                ClComentarioE objDatos = new ClComentarioE();
                objDatos.foto = tblComentario.Rows[i]["foto"].ToString();
                objDatos.nombres = tblComentario.Rows[i]["nombres"].ToString();
                objDatos.apellidos = tblComentario.Rows[i]["apellidos"].ToString();
                objDatos.comentarios = tblComentario.Rows[i]["comentarios"].ToString();
                objDatos.nivel = tblComentario.Rows[i]["nivel"].ToString();


                listaComentarios.Add(objDatos);
            }
            return listaComentarios;
        }

        public int mtdRegistrarComentario(ClComentarioE objSelectCom)
        {
            string Registro = "Insert Into Calificacion(nivel, estrellas, comentarios, idsolicitudServicio, idCliente)" +
                             "Values('" + objSelectCom.nivel +  "'," + objSelectCom.estrellas + ",'"+objSelectCom.comentarios+"',"+objSelectCom.idsolicitudServicio+","+objSelectCom.idCliente+")";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int regis = SQL.mtdIUDConec(Registro);
            return regis;
        }
    }
}