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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClCategoriaL objCategoria = new ClCategoriaL();
                List<ClCategoriaE> listaCategoria = new List<ClCategoriaE>();
                listaCategoria = objCategoria.mtdListar();

                ddlCategoria.DataSource = listaCategoria;
                ddlCategoria.DataTextField = "categoria";
                ddlCategoria.DataValueField = "idCategoria";
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new ListItem("Seleccione: ", "0"));
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            ClServicioE objDatos = new ClServicioE();
            objDatos.servicio = txtServicio.Text;
            objDatos.idCategoria = int.Parse(ddlCategoria.SelectedValue.ToString());

            ClServicioL objServicioL = new ClServicioL();
            int registro = objServicioL.mtdRegistrarServ(objDatos);

            if (registro == 1)
            {
                string script = @"<script> swal({ title: '¡Registro Exitoso!', text: 'El servicio ha sido registrado con exito.',type: 'success',
                            confirmButtonText: 'Aceptar'});
                        </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);

            }
        }
    }
}