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
    public partial class Prueba : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClProfesionalL objProfecionalL = new ClProfesionalL();

            List<ClProfesionalSimple> listaProfecionales = objProfecionalL.mtdListarProfesional1();
            grrDatos.DataSource = listaProfecionales;
            grrDatos.DataBind();
        }
    }
}