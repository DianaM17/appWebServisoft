using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class MasterProfecional : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsuario.Text = "Bienvenido: " + Session["usuario"].ToString();
            lblProfesion.Text = "(" + Session["profesion"].ToString() + ")";
            lblIdCategoria.Text =Session["idCategoria"].ToString();
        }

        protected void miImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("interfazProfesional.aspx");
        }
    }
}