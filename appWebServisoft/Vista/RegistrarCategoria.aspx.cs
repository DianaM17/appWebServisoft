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
    public partial class RegistrarCategoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ClCategoriaL objCateg = new ClCategoriaL();
            if (FuImagen.HasFile)
            {
                string categoria = txtCategoria.Text;
                int verificar = objCateg.mtdVerificar(categoria);
                if (verificar > 0)
                {
                    string script = @"<script> swal({ title: '¡Error!', text: 'La Categoria que intentas registrar, ya existe.',type: 'error',
                            confirmButtonText: 'Aceptar'});
                    </script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
                }
                else
                {
                    string nombreImg = txtCategoria.Text + ".png";
                    string rutaImg = Server.MapPath("~/Vista/Imagenes/Categoria/" + nombreImg);
                    string ruta = ("~/Vista/Imagenes/Categoria/" + nombreImg);
                    FuImagen.SaveAs(rutaImg);

                    ClCategoriaE objCat = new ClCategoriaE();
                    objCat.categoria = txtCategoria.Text;
                    objCat.imagen = ruta;

                    int resul = objCateg.mtdRegistrar(objCat);
                    if (resul == 1)
                    {
                        string script = @"<script> swal({ title: '¡Registro Exitoso!', text: 'Categoria Registrada correctamente.',type: 'success',
                            confirmButtonText: 'Aceptar'});
                        </script>";
                        ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
                    }

                }

            }
        }
    }
}
