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
            ClClienteL objClient = new ClClienteL();
            string telefono = txtTelefonoP.Value;
            int veriTelefono = objClient.mtdVerificarTelefono(telefono);
            if (veriTelefono > 0)
            {
                string scripts = @"<script> swal({ title: '¡Error!', text: 'El número de telefono que ingresaste ya esta registrado!!.',type: 'error',
                            confirmButtonText: 'Aceptar'});
                    </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);

            }else
            {
                if (FuImagen.HasFile)
                {
                    string nombreImgC = txtTelefono.Value;
                    string rutaImgC = Server.MapPath("~/Vista/Imagenes/PerfilCliente/" + nombreImgC);
                    string rutaSQL = ("~/Vista/Imagenes/PerfilCliente/" + nombreImgC);
                    FuImagen.SaveAs(rutaImgC);

                    ClClienteE objCliente = new ClClienteE();

                    objCliente.nombres = txtNombres.Value;
                    objCliente.apellidos = txtApellidos.Value;
                    objCliente.direccion = txtDireccion.Value;
                    objCliente.telefono = txtTelefono.Value;
                    objCliente.email = txtEmail.Value;
                    objCliente.clave = txtContraseña.Value;
                    objCliente.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());

                    txtNombres.Value = "";
                    txtApellidos.Value = "";
                    txtDireccion.Value = "";
                    txtTelefono.Value = "";
                    txtEmail.Value = "";
                    txtContraseña.Value = "";
                    ddlCiudad.Items.Insert(0, new ListItem("Seleccione Ciudad: ", "0"));


                    int registro = objClient.mtdRegistroCliente(objCliente);

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

        protected void BtnRegistrarProfesional_ServerClick(object sender, EventArgs e)
        {
            ClProfesionalL objProfesional = new ClProfesionalL();
            string telefono = txtTelefonoP.Value;
            int VeriTelefono = objProfesional.mtdVerificarTelefono(telefono);
            if (VeriTelefono > 0)
            {
                string script = @"<script> swal({ title: '¡Error!', text: 'El número de telefono que ingresaste ya esta registrado!!.',type: 'error',
                            confirmButtonText: 'Aceptar'});
                    </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }
            else
            {
                if (FlImagen.HasFile)
                {
                    string nombreImg = txtTelefonoP.Value + ".png";
                    string rutaImg = Server.MapPath("~/Vista/Imagenes/PerfilProfesional/" + nombreImg);
                    string rutaSQL = ("~/Vista/Imagenes/PerfilProfesional/" + nombreImg);
                    FlImagen.SaveAs(rutaImg);

                    ClProfesionalE objProf = new ClProfesionalE();
                    objProf.nombres = txtNombresP.Value;
                    objProf.apellidos = txtApellidosP.Value;
                    objProf.telefono = txtTelefonoP.Value;
                    objProf.email = txtEmailP.Value;
                    objProf.clave = txtClaveP.Value;
                    objProf.direccion = txtDireccionP.Value;
                    objProf.perfil = txtPerfilP.Value;
                    objProf.fotos = rutaSQL;
                    objProf.idCategoria = int.Parse(ddlCategoria.SelectedValue.ToString());
                    objProf.idServicio = int.Parse(ddlServicio.SelectedValue.ToString());
                    objProf.idCiudad = int.Parse(ddlCiudadd.SelectedValue.ToString());

                    txtNombresP.Value = "";
                    txtApellidosP.Value = "";
                    txtTelefonoP.Value = "";
                    txtEmailP.Value = "";
                    txtDireccionP.Value = "";
                    txtPerfilP.Value = "";

                    ClProfesionalL objProfe = new ClProfesionalL();
                    //Recibo el entero de la ejecucion de la consulta
                    int regisProf = objProfe.mtdRegistroProfesionales(objProf);
                    //Recibir el id que se acabo de registrar
                    //int idRegistrado = objProfesional.mtdRegistroProfesionales(objProf);
                    int idServicio = int.Parse(ddlServicio.SelectedValue.ToString());

                    string script = @"<script> swal({ title: '¡Registro Exitoso!',
                              text: 'Profesional Registrado Exitosamente', type: 'success',
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