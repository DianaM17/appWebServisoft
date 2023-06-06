using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClCategoriaD
    {
        public List<ClCategoriaE> mtdListarCate()
        {
            string consulta = "Select * from Categoria";
            ClProcesarSQL SQL = new ClProcesarSQL();
            DataTable tblCategorias = SQL.mtdSelectDesc(consulta);

            List<ClCategoriaE> listaCategorias = new List<ClCategoriaE>();
            for (int i = 0; i < tblCategorias.Rows.Count; i++)
            {
                ClCategoriaE objCateg = new ClCategoriaE();
                objCateg.idCategoria = int.Parse(tblCategorias.Rows[i]["idCategoria"].ToString());
                objCateg.categoria = tblCategorias.Rows[i]["categoria"].ToString();
                objCateg.imagen = tblCategorias.Rows[i]["imagen"].ToString();
                listaCategorias.Add(objCateg);
            }
            return listaCategorias;
        }

        public int mtdRegistraCategoria(ClCategoriaE objDatos)
        {
            string registro = "Insert into Categoria(categoria,imagen) values('" + objDatos.categoria + "','" + objDatos.imagen + "')";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int regis = SQL.mtdIUDConec(registro);
            return regis;
        }

        public int mtdVerificar(string categoria)
        {
            string consulta = "Select Count(*) from Categoria where categoria='" + categoria + "'";
            ClProcesarSQL SQL = new ClProcesarSQL();
            int Verificar = SQL.mtdSelectConec(consulta);
            return Verificar;
        }

        public List<ClCategoriaE> mtdBuscarCategoria(string busqueda = "")
        {
            string consulta = "select * from Categoria where categoria LIKE '%" + busqueda + "%'";
            ClProcesarSQL ObjSQL = new ClProcesarSQL();
            DataTable TablaCategoria = ObjSQL.mtdSelectDesc(consulta);

            List<ClCategoriaE> buscarCategoria = new List<ClCategoriaE>();

            for (int i = 0; i < TablaCategoria.Rows.Count; i++)
            {
                ClCategoriaE ObjMotos = new ClCategoriaE();
                ObjMotos.idCategoria = int.Parse(TablaCategoria.Rows[i]["idCategoria"].ToString());
                ObjMotos.categoria = TablaCategoria.Rows[i]["categoria"].ToString();
                ObjMotos.imagen = TablaCategoria.Rows[i]["imagen"].ToString();

                buscarCategoria.Add(ObjMotos);

            }

            return buscarCategoria;

        }
    }
}