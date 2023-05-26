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
                Response.Redirect("~/Vista/HomeProfesional.aspx");

            }
            else if (objClienteE != null)
            {
                Response.Redirect("~/Vista/Home2.aspx");
            }
            else
            {
                string script = @"<script>
                            swal({
                                title: '¡Error!',
                                text: 'Usuario o contraseña incorrecta!!.',
                                type: 'error',
                                confirmButtonText: 'Aceptar'
                            });
                        </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }
    }
}