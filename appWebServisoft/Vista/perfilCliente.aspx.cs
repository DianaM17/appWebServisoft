using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class perfilCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int idCliente = Int32.Parse(lblIdCliente.Text = Session["idCliente"].ToString());
            if (!IsPostBack)
            {
                ClClienteL objCliente = new ClClienteL();
                ClClienteE Buscar = objCliente.mtdSeleccionarCliente(idCliente);
                if (Buscar != null)
                {
                    txtNombres.Text = Buscar.nombres;
                    txtApellidos.Text = Buscar.apellidos;
                    txtDireccion.Text = Buscar.direccion;
                    txtTelefono.Text = Buscar.telefono;
                    txtEmail.Text = Buscar.email;
                    txtClave.Text = Buscar.clave;

                    //Combo ddlCiudad
                    ClCiudadD objCiudad = new ClCiudadD();
                    List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
                    listaCiudad = objCiudad.mtdListarCiudad();
                    ddlCiudad.DataSource = listaCiudad;
                    ddlCiudad.DataTextField = "nombre";
                    ddlCiudad.DataValueField = "idCiudad";
                    ddlCiudad.DataBind();
                    ddlCiudad.SelectedValue = Buscar.idCiudad.ToString();
                }
            }

        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            int idCliente = Int32.Parse(lblIdCliente.Text = Session["idCliente"].ToString());
            ClClienteE objClient = new ClClienteE();
            objClient.nombres = txtNombres.Text;
            objClient.apellidos = txtApellidos.Text;
            objClient.direccion = txtDireccion.Text;
            objClient.telefono = txtTelefono.Text;
            objClient.email = txtEmail.Text;
            objClient.clave = txtClave.Text;
            objClient.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());

            ClClienteL objCliente = new ClClienteL();
            int registro = objCliente.mtdActualizarDatos(objClient, idCliente);
            string script = @"<script> swal({ title: '¡Registro Exitoso!',
                              text: 'Cliente Registrado Exitosamente', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";
            if (registro == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }

        }
    }
}