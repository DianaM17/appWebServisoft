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
    public partial class RegistrarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Cargar Combo ddlCiudad Cliente
                ClCiudadL objCiudad = new ClCiudadL();
                List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
                listaCiudad = objCiudad.mtdListarCiudad();

                ddlCiudad.DataSource = listaCiudad;
                ddlCiudad.DataTextField = "nombre";
                ddlCiudad.DataValueField = "idCiudad";
                ddlCiudad.DataBind();
                ddlCiudad.Items.Insert(0, new ListItem("Seleccione Ciudad: ", "0"));

                //Cargar Combo ddlCategoria 
                ClCategoriaL objCategoria = new ClCategoriaL();
                List<ClCategoriaE> listaCategoria = new List<ClCategoriaE>();
                listaCategoria = objCategoria.mtdListar();

                ddlCategoria.DataSource = listaCategoria;
                ddlCategoria.DataTextField = "categoria";
                ddlCategoria.DataValueField = "idCategoria";
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new ListItem("Seleccione Categoria: ", "0"));

                //Cargar Combo ddlCiudadd Profeional
                ddlCiudadd.DataSource = listaCiudad;
                ddlCiudadd.DataTextField = "nombre";
                ddlCiudadd.DataValueField = "idCiudad";
                ddlCiudadd.DataBind();
                ddlCiudadd.Items.Insert(0, new ListItem("Seleccione Ciudad: ", "0"));
            }
        }

        protected void btnRegistrarCliente_ServerClick(object sender, EventArgs e)
        {
            ClClienteE objCliente = new ClClienteE();

            objCliente.nombres = txtNombres.Value;
            objCliente.apellidos = txtApellidos.Value;
            objCliente.direccion = txtDireccion.Value;
            objCliente.telefono = txtTelefono.Value;
            objCliente.email = txtEmail.Value;
            objCliente.clave = txtContraseña.Value;
            objCliente.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());

            ClClienteL objClient = new ClClienteL();
            int registro = objClient.mtdRegistroCliente(objCliente);

            string script = @"<script> swal({ title: '¡Registro Exitoso!',
                              text: 'Instructor Registrado Exitosamente', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";
            if (registro == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }

        protected void BtnRegistrarProfesional_ServerClick(object sender, EventArgs e)
        {
            ClProfesionalE objProf = new ClProfesionalE();

            objProf.nombres = txtNombresP.Value;
            objProf.apellidos = txtApellidosP.Value;
            objProf.telefono = txtTelefonoP.Value;
            objProf.email = txtEmailP.Value;
            objProf.clave = txtClaveP.Value;
            objProf.direccion = txtDireccionP.Value;
            objProf.perfil = txtPerfilP.Value;
            objProf.idCategoria = int.Parse(ddlCategoria.SelectedValue.ToString());
            objProf.idServicio = int.Parse(ddlServicio.SelectedValue.ToString());
            objProf.idCiudad = int.Parse(ddlCiudadd.SelectedValue.ToString());

            ClProfesionalL objProfesional = new ClProfesionalL();
            int regisProf = objProfesional.mtdRegistroProfesionales(objProf);

            string script = @"<script> swal({ title: '¡Registro Exitoso!',
                              text: 'Instructor Registrado Exitosamente', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";

            if (regisProf == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            string idCateg = ddlCategoria.SelectedValue;
            ClServicioL objServicio = new ClServicioL();
            List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);

            // Limpiar los elementos existentes en el ComboBox
            ddlServicio.Items.Clear();

            ddlServicio.DataSource = listaServicio;
            ddlServicio.DataTextField = "servicio";
            ddlServicio.DataValueField = "idServicio";
            ddlServicio.DataBind();
            ddlServicio.Items.Insert(0, new ListItem("Seleccione Servicio: ", "0"));
        }
    }
}