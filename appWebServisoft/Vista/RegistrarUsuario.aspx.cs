using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
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
            //if (IsPostBack)
            //{
            //    // Comprueba si se hizo clic en el botón y maneja su evento
            //    if (Request.Form["btnRegistrarCliente"] != null)
            //    {
            //        btnRegistrarCliente_ServerClick(sender, e);
            //    }
            //}

        }

        protected void btnRegistrarCliente_ServerClick(object sender, EventArgs e)
        {
            string nombres = txtNombres.Value.Trim();
            string apellidos = txtApellidos.Value.Trim();
            string direccion = txtDireccion.Value.Trim();
            string telefono1 = txtTelefono.Value.Trim();
            string email = txtEmail.Value.Trim();
            string contraseña = txtContraseña.Value;

            if (!Regex.IsMatch(nombres, "^[A-Za-z\\s]+$") || !Regex.IsMatch(apellidos, "^[A-Za-z\\s]+$") || !Regex.IsMatch(direccion, "^[A-Za-z0-9\\s#-]+$"))
            {
                // Mostrar un mensaje de error si el formato no es válido
                string scripts = @"<script> swal({ title: '¡Error!', text: 'Los nombres y apellidos solo deben contener letras y espacios.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
                return;
            }
            if (!Regex.IsMatch(telefono1, "^[0-9]{10}$"))
            {
                string scripts = @"<script> swal({ title: '¡Error!', text: 'El número de teléfono debe contener exactamente 10 dígitos numéricos.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
                return;
            }
            if (!email.Contains("@"))
            {
                string scripts = @"<script> swal({ title: '¡Error!', text: 'El correo electrónico debe contener el símbolo @.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
                return;
            }
            if (contraseña.Length < 8 || !Regex.IsMatch(contraseña, "[A-Z]") || !Regex.IsMatch(contraseña, "[a-z]") || !Regex.IsMatch(contraseña, "[0-9]") || !Regex.IsMatch(contraseña, "[!@#$%^&*]"))
            {
                // Mostrar un mensaje de error si la contraseña no cumple con los requisitos
                string scripts = @"<script> swal({ title: '¡Error!', text: 'La contraseña debe tener al menos 8 caracteres y contener al menos una mayúscula, una minúscula, un carácter especial y un número.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
                return;
            }

            ClClienteL objClient = new ClClienteL();
            string telefono = txtTelefono.Value;
            int veriTelefono = objClient.mtdVerificarTelefono(telefono);

            if (veriTelefono > 0)
            {
                string scripts = @"<script> swal({ title: '¡Error!', text: 'El número de teléfono que ingresaste ya está registrado.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
            }
            else
            {
                if (FuImagen1.HasFile)
                {
                    string nombreImg = txtTelefono.Value + ".png";
                    string rutaImg = Server.MapPath("~/Vista/Imagenes/PerfilProfesional/" + nombreImg);
                    string rutaSQL = ("~/Vista/Imagenes/PerfilProfesional/" + nombreImg);
                    FlImagen.SaveAs(rutaImg);

                    ClClienteE objCliente = new ClClienteE();
                    objCliente.nombres = txtNombres.Value;
                    objCliente.apellidos = txtApellidos.Value;
                    objCliente.direccion = txtDireccion.Value;
                    objCliente.telefono = txtTelefono.Value;
                    objCliente.foto = rutaSQL;
                    objCliente.email = txtEmail.Value;
                    objCliente.clave = txtContraseña.Value;
                    objCliente.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());

                    txtNombres.Value = string.Empty;
                    txtApellidos.Value = string.Empty;
                    txtDireccion.Value = string.Empty;
                    txtTelefono.Value = string.Empty;
                    txtEmail.Value = string.Empty;
                    txtContraseña.Value = string.Empty;
                    ddlCiudad.SelectedIndex = 0;

                    ClClienteL objClientee = new ClClienteL();
                    int registro = objClientee.mtdRegistroCliente(objCliente);


                    if (registro == 1)
                    {
                        string sweetAlertScript = @"

                           <script>

                             swal({

                             title: '¡Registro Exitoso!',

                             text: 'Cliente Registrado Exitosamente.',

                             type: 'success',

                             showConfirmButton: false,

                             showCancelButton: false,

                             timer: 2000,

                             allowOutsideClick: false,

                             allowEscapeKey: false,

                             allowEnterKey: false

                           });

 

                       setTimeout(function() {

                           window.location.href = 'Login.aspx';

                           }, 2000);

                         </script>";



                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlertAndRedirect", sweetAlertScript);
                    }
                }
            }
        }

        protected void BtnRegistrarProfesional_ServerClick(object sender, EventArgs e)
        {
            string nombres = txtNombresP.Value.Trim();
            string apellidos = txtApellidosP.Value.Trim();
            string direccion = txtDireccionP.Value.Trim();
            string telefono1 = txtTelefonoP.Value.Trim();
            string email = txtEmailP.Value.Trim();
            string contraseña = txtClaveP.Value;
            string Perfil = txtPerfilP.Value.Trim();

            if (!Regex.IsMatch(nombres, "^[A-Za-z\\s]+$") ||
                !Regex.IsMatch(apellidos, "^[A-Za-z\\s]+$") ||
                !Regex.IsMatch(direccion, "^[A-Za-z0-9\\s#-]+$") ||
                !Regex.IsMatch(Perfil, "^[A-Za-z0-9\\s#-]+$"))
            {
                // Mostrar un mensaje de error si el formato no es válido
                string scripts = @"<script> swal({ title: '¡Error!', text: 'Los nombres y apellidos solo deben contener letras y espacios.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
                return;
            }
            if (!Regex.IsMatch(telefono1, "^[0-9]{10}$"))
            {
                string scripts = @"<script> swal({ title: '¡Error!', text: 'El número de teléfono debe contener exactamente 10 dígitos numéricos.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
                return;
            }
            if (!email.Contains("@"))
            {
                string scripts = @"<script> swal({ title: '¡Error!', text: 'El correo electrónico debe contener el símbolo @.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
                return;
            }
            if (contraseña.Length < 8 || !Regex.IsMatch(contraseña, "[A-Z]") || !Regex.IsMatch(contraseña, "[a-z]") || !Regex.IsMatch(contraseña, "[0-9]") || !Regex.IsMatch(contraseña, "[!@#$%^&*]"))
            {
                // Mostrar un mensaje de error si la contraseña no cumple con los requisitos
                string scripts = @"<script> swal({ title: '¡Error!', text: 'La contraseña debe tener al menos 8 caracteres y contener al menos una mayúscula, una minúscula, un carácter especial y un número.', type: 'error', confirmButtonText: 'Aceptar'});</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", scripts);
                return;
            }

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
                    string extension = Path.GetExtension(FlImagen.FileName);
                    string nombreImg = txtTelefonoP.Value + extension;
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

                    txtNombresP.Value = string.Empty;
                    txtApellidosP.Value = string.Empty;
                    txtTelefonoP.Value = string.Empty;
                    txtEmailP.Value = string.Empty;
                    txtDireccionP.Value = string.Empty;
                    txtPerfilP.Value = string.Empty;
                    ddlCategoria.SelectedIndex = 0;
                    ddlServicio.SelectedIndex = 0;
                    ddlCiudadd.SelectedIndex = 0;

                    ClProfesionalL objProfe = new ClProfesionalL();
                    //Recibo el entero de la ejecucion de la consulta
                    int regisProf = objProfe.mtdRegistroProfesionales(objProf);
                    //Recibir el id que se acabo de registrar
                    //int idRegistrado = objProfesional.mtdRegistroProfesionales(objProf);
                    int idServicio = int.Parse(ddlServicio.SelectedValue.ToString());



                    if (regisProf == 1)
                    {
                        string sweetAlertScript = @"

                           <script>

                             swal({

                             title: '¡Registro Exitoso!',

                             text: 'Profesional Registrado Exitosamente.',

                             type: 'success',

                             showConfirmButton: false,

                             showCancelButton: false,

                             timer: 2000,

                             allowOutsideClick: false,

                             allowEscapeKey: false,

                             allowEnterKey: false

                           });

 

                       setTimeout(function() {

                           window.location.href = 'Login.aspx';

                           }, 2000);

                         </script>";



                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlertAndRedirect", sweetAlertScript);
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