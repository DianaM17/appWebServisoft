using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting;
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
                    lblNombre.Text = Session["usuario"].ToString();
                    ImgPerfil.ImageUrl = Buscar.fotos;
                    lblPerfil.Text = Buscar.perfil;
                    lblEmail.Text = Buscar.email;
                    lblDireccion.Text = Buscar.direccion;
                    lblTelefono.Text = Buscar.telefono;
                    lblServicio.Text = Buscar.servicio;
                    lblCategoria.Text = Buscar.categoria;
                    lblCiudad.Text = Buscar.nombre;
                    lblEstado.Text = Buscar.estado;


                    ImgPerfil1.ImageUrl = Buscar.fotos;
                    txtNombres.Value = Buscar.nombres;
                    txtApellidos.Value = Buscar.apellidos;
                    txtTelefono.Value = Buscar.telefono;
                    txtEmail.Value = Buscar.email;
                    txtPassword.Value = Buscar.clave;
                    txtDireccion.Value = Buscar.direccion;
                    txtPerfil.Value = Buscar.perfil;

                    //Combo ddlCategoria
                    ClCategoriaL objCategoria = new ClCategoriaL();
                    List<ClCategoriaE> listaCategoria = new List<ClCategoriaE>();
                    listaCategoria = objCategoria.mtdListar();

                    ddlCategoria.DataSource = listaCategoria;
                    ddlCategoria.DataTextField = "categoria";
                    ddlCategoria.DataValueField = "idCategoria";
                    ddlCategoria.DataBind();
                    ddlCategoria.SelectedValue = Buscar.idCategoria.ToString();

                    //Combo ddlCiudad
                    ClCiudadD objCiudad = new ClCiudadD();
                    List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
                    listaCiudad = objCiudad.mtdListarCiudad();
                    ddlCiudad.DataSource = listaCiudad;
                    ddlCiudad.DataTextField = "nombre";
                    ddlCiudad.DataValueField = "idCiudad";
                    ddlCiudad.DataBind();
                    ddlCiudad.SelectedValue = Buscar.idCiudad.ToString();

                    //Combo ddlServicio
                    string idCateg = ddlCategoria.SelectedValue;
                    ClServicioL objServicio = new ClServicioL();
                    List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);

                    // Limpiar los elementos existentes en el ComboBox
                    ddlServicio.Items.Clear();

                    ddlServicio.DataSource = listaServicio;
                    ddlServicio.DataTextField = "servicio";
                    ddlServicio.DataValueField = "idServicio";
                    ddlServicio.DataBind();
                    ddlServicio.SelectedValue = Buscar.idServicio.ToString();
                }
            }

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            ClProfesionalE objProf = new ClProfesionalE();

            objProf.nombres = txtNombres.Value;
            objProf.apellidos = txtApellidos.Value;
            objProf.telefono = txtTelefono.Value;
            objProf.email = txtEmail.Value;
            objProf.clave = txtPassword.Value;
            objProf.direccion = txtDireccion.Value;
            objProf.perfil = txtPerfil.Value;
            objProf.idCategoria = int.Parse(ddlCategoria.SelectedValue.ToString());
            objProf.idServicio = int.Parse(ddlServicio.SelectedValue.ToString());
            objProf.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());

            ClProfesionalL objProfesional = new ClProfesionalL();
            int regisProf = objProfesional.mtdActualizarDatos(objProf, idProf);

            string script = @"<script> swal({ title: '¡Actualización Exitosa!',
                              text: 'Datos Registrados Exitosamente', type: 'success',
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
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            ClProfesionalL obj = new ClProfesionalL();
            ClProfesionalE Buscar = obj.mtdBuscarProf(idProf);
            //Combo ddlServicio
            string idCateg = ddlCategoria.SelectedValue;
            ClServicioL objServicio = new ClServicioL();
            List<ClServicioE> listaServicio = objServicio.mtdListarServicio(idCateg);

            // Limpiar los elementos existentes en el ComboBox
            ddlServicio.Items.Clear();

            ddlServicio.DataSource = listaServicio;
            ddlServicio.DataTextField = "servicio";
            ddlServicio.DataValueField = "idServicio";
            ddlServicio.DataBind();
            ddlServicio.SelectedValue = Buscar.idServicio.ToString();
        }

        protected void chkEstado_CheckedChanged(object sender, EventArgs e)
        {
            int idProf = Int32.Parse(lblIdProfesional.Text = Session["idProfesional"].ToString());
            ClProfesionalE objProf = new ClProfesionalE();

            string activo = "activo";
            string inactivo = "inactivo";
            if (chkEstado.Checked)
            {
                objProf.estado = activo;
            }
            else
            {
                objProf.estado = inactivo;
            }
            ClProfesionalL objProfesional = new ClProfesionalL();
            int regisProf = objProfesional.mtdCambiarEstado(objProf, idProf);
            string script = @"<script> swal({ title: '¡Cambio Exitoso!',
                              text: 'Su estado se ha cambiado Exitosamente', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";

            if (regisProf == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
        }
    }

}

