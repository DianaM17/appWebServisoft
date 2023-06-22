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
    public partial class interfazProfecional : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClCotizacionL objCotizacion = new ClCotizacionL();
                List<ClCotizacionE> listaCotizaciones = objCotizacion.mtdListarCotizacion(Convert.ToInt32(Session["idCategoria"]));
                repeaterListar.DataSource = listaCotizaciones;
                repeaterListar.DataBind();
            }



        }

    }
}