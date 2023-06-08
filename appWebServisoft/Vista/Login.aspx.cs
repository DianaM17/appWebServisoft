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
    public partial class Loginn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
                Response.Cache.SetNoStore();

                txtEmail.Value = string.Empty;
                txtClave.Value = string.Empty;
            }
        }

        protected void btnIngresar_ServerClick(object sender, EventArgs e)
        {
            string usuario = txtEmail.Value;
            string clave = txtClave.Value;
            ClProfesionalL objProfesional = new ClProfesionalL();
            ClProfesionalE objProfesionalE = objProfesional.mtdLoginProfesional(usuario, clave);
            ClClienteL objCliente = new ClClienteL();
            ClClienteE objClienteE = objCliente.mtdLoginCliente(usuario, clave);

            if (objProfesionalE != null)
            {
                Session["idProfesional"] = objProfesionalE.idProfesional;
                Session["TeleProfesional"] = objProfesionalE.telefono;
                Session["usuario"] = objProfesionalE.nombres + " " + objProfesionalE.apellidos;

                Session["idProfesional"] = objProfesionalE.idProfesional;
                Response.Redirect("PerfilProfesional.aspx");

            }
            else if (objClienteE != null)
            {
                Session["idCliente"] = objClienteE.idCliente;
                Session["Cliente"] = objClienteE;
                Session["usuario"] = objClienteE.nombres + " " + objClienteE.apellidos;
                Response.Redirect("interfazCliente.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Swal.fire({ title: 'Oops...', text: 'Usuario o Contraseña incorrectos!', icon: 'error', confirmButtonText: 'Aceptar', customClass: { confirmButton: 'swal-button swal-button--error-color' } });", true);

            }
        }
    }
}

