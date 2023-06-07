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
    public partial class interfazCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClProfesionalL objProfesional = new ClProfesionalL();
            List<ClProfesionalE> verifica = objProfesional.mtdListarProfesional();
            Repeater1.DataSource = verifica;
            Repeater1.DataBind();

            
        }
    }
}