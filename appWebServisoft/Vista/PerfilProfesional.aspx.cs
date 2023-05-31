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
    public partial class PerfilProfesional : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            if (!IsPostBack)
            {
                ClProfesionalL obj = new ClProfesionalL();
                ClProfesionalE Buscar = obj.mtdBuscarProf(idProf);
                if (Buscar != null)
                {
                    txtNombres.Value = Buscar.nombres;
                    txtApellidos.Value = Buscar.apellidos;
                    txtTelefono.Value = Buscar.telefono;
                    txtEmail.Value = Buscar.email;
                    txtPassword.Value = Buscar.clave;
                    txtDireccion.Value = Buscar.direccion;
                    txtPerfil.Value = Buscar.perfil;
                    //txtFotos.Text = Buscar.fotos;
                    //txtEstado.Text = Buscar.estado;
                    //ddlCategoria.SelectedIndex = Buscar.idCategoria;
                    //ddlServicios.SelectedIndex = Buscar.idServicio;
                }
            }

        }
    }
}
