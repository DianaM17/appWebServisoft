using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace appWebServisoft.Datos
{
    public class ClBusquedaD
    {
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