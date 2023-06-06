using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class MasterCliente : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblUsuario.Text= "Bienvenido: "+ Session["usuario"].ToString();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }


      
        protected void Button1_Click(object sender, ImageClickEventArgs e)
        {
         
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string input = TextBox2.Text;
            string url = "busquedaCliente.aspx?parametro=" + Server.UrlEncode(input);
            Response.Redirect(url);
        }

        protected void mostrarValor()
        {
            string selectedValue = ddlOpciones.SelectedValue;

            if (selectedValue == "1")
            {
                // Redireccionar a la página de perfil
                Response.Redirect("perfil.aspx");
            }
            else if (selectedValue == "2")
            {
                
                ScriptManager.RegisterStartupScript(this, GetType(), "cerrarSesion", "confirmarCerrarSesion();", true);
            }
        }













    }
}