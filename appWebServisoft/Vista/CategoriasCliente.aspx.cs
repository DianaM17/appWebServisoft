using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista.VistaCategorias
{
    public partial class CategoriasCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClCategoriaL objCate = new ClCategoriaL();
            List<ClCategoriaE> list = objCate.mtdListar();

            reptCateg.DataSource = list;
            reptCateg.DataBind();
        }
    }
}