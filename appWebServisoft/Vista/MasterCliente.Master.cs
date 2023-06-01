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


        protected void ddlOpciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            string selectedValue = ddlOpciones.SelectedValue;

            switch (selectedValue)
            {
                case "perfil":
                    // Redireccionar a la página de perfil
                    Response.Redirect("PerfilCliente.aspx");
                    break;
                case "salir":
                    //// Ejecutar la función para confirmar el cierre de sesión
                    ScriptManager.RegisterStartupScript(this, GetType(), "cerrarSecion", "confirmarCerrarSesion();", true);
                    break;
                default:
                    break;
            }
        }

    








    }
}