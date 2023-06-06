using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClBusquedaL
    {
        public List<ClCategoriaE> mtdBuscarCategoria(string buscar)
        {
            ClBusquedaD ObjCategoria = new ClBusquedaD();
            List<ClCategoriaE> buscarCategoria = ObjCategoria.mtdBuscarCategoria();
            List<ClCategoriaE> ListaCategoria = new List<ClCategoriaE>();

            if (buscarCategoria != null && buscar != "")
            {
                for (int i = 0; i < buscarCategoria.Count; i++)
                {
                    if (buscarCategoria[i].categoria.IndexOf(buscar, StringComparison.OrdinalIgnoreCase) >= 0)
                    {
                        ClCategoriaE objMotos = buscarCategoria[i];
                        ListaCategoria.Add(objMotos);
                    }
                }
            }

            return ListaCategoria;
        }

    }
}