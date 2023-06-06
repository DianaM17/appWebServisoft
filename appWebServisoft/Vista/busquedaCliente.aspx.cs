using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class busquedaCliente : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["parametro"] != null)
                {
                    string input = Server.UrlDecode(Request.QueryString["parametro"]);

                    // Lógica para cargar los datos en el Repeater
                    ClBusquedaL objMoto = new ClBusquedaL();
                    List<ClCategoriaE> buscar = objMoto.mtdBuscarCategoria(input);

                    if (buscar.Count > 0)
                    {
                        reptCateg.DataSource = buscar;
                        reptCateg.DataBind();
                        Label1.Text = string.Empty;
                    }
                    else
                    {
                        reptCateg.DataSource = null;
                        reptCateg.DataBind();
                        Label1.Text = "No e encontrado ese resultado"; 
                    }
                }
            }


        }
    }
}