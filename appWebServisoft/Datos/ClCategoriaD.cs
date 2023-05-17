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
    }
}