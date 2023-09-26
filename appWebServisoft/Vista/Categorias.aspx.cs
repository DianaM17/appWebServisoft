using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClCategoriaL objCate = new ClCategoriaL();
            List<ClCategoriaE> list = objCate.mtdListar();

            reptCateg.DataSource = list;
            reptCateg.DataBind();

        }

        [WebMethod]
        public static List<ClServiciooE> ObtenerServicioPorCategoria(int idCategoria)
        {
            // Llama a tu método de búsqueda de servicios por categoría
            ClServicioL objServ = new ClServicioL();
            List<ClServiciooE> servicios = objServ.mtdBuscarServicio(idCategoria);
            return servicios;
        }
    }
}