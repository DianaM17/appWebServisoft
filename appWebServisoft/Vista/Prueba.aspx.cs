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
    public partial class Prueba : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClProfesionalL objProfecionalL = new ClProfesionalL();
            List<ClProfesionalSimple> listaProfesionalesAc = objProfecionalL.mtdListarProfesionalActivo();
            grrDatos.DataSource = listaProfesionalesAc;
            grrDatos.DataBind();
        }

        protected void grrDatos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow) 
            {
                // Obtener el control de imagen en la fila actual
                Image image = (Image)e.Row.FindControl("ImgProf");

                // Obtener los datos del producto para esta fila
                ClProfesionalSimple obImgprof = (ClProfesionalSimple)e.Row.DataItem;

                // Construir la ruta completa de la imagen
                string rutaImagen = (obImgprof.fotos);

                // Asignar la ruta de la imagen al control de imagen
                image.ImageUrl = rutaImagen;
            }
        }
    }
}
