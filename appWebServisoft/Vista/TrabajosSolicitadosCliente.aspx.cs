using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System;
using System.Web.UI;
using System.Xml.Linq;

namespace appWebServisoft.Vista
{
    public partial class TrabajosSolicitadosCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               
                ClCotizacionL objCotizacion = new ClCotizacionL();
                List<ClCotizacionE> listaCotizaciones = objCotizacion.mtdListarCotizacionCliente(Convert.ToInt32(Session["idCliente"]));
                repeaterListar.DataSource = listaCotizaciones;
                repeaterListar.DataBind();

                grrProfesional.RowDataBound += grrProfesional_RowDataBound;

            }

        }


        protected void ReprogramarLinkButton_Click(object sender, EventArgs e)
        {
            // Obtener el valor del idCotizacion del LinkButton clicado
            LinkButton linkButton = (LinkButton)sender;
            string idCotizacionStr = linkButton.CommandArgument;

            // Mostrar el valor del idCotizacion en el Label4
            Label4.Text = idCotizacionStr;
            // Forzar la actualización del UpdatePanel2
            UpdatePanel2.Update();
            // Verificar si el valor en Label4.Text es un número válido
            if (int.TryParse(idCotizacionStr, out int idCotizacion))
            {
                ClCotizacionL objCotizacion = new ClCotizacionL();
                List<ClSeleccionCotizacion1E> listaCotizaciones1 = objCotizacion.mtdListarProfesionalCotiizacion(idCotizacion, 1);
                grrProfesional.DataSource = listaCotizaciones1;
                grrProfesional.DataBind();
                // Forzar la actualización del UpdatePanel2
                UpdatePanel3.Update();
            }


            // Abre la ventana modal
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowModal", "$('#staticBackdrop').modal('show');", true);
        }



        protected void grrProfesional_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                // Oculta las celdas de encabezado que desees por su índice (0-based)
                e.Row.Cells[0].Visible = false; // Oculta la columna idCotizacion
                e.Row.Cells[3].Visible = false; // Oculta la columna idseleccioncotizacion
                e.Row.Cells[4].Visible = false; // Oculta la columna seleccionProfesional
                e.Row.Cells[5].Visible = false; // Oculta la columna idProfesional
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Oculta las celdas de datos que desees por su índice (0-based)
                e.Row.Cells[0].Visible = false; // Oculta la columna idCotizacion
                e.Row.Cells[3].Visible = false; // Oculta la columna idseleccioncotizacion
                e.Row.Cells[4].Visible = false; // Oculta la columna seleccionProfesional
                e.Row.Cells[5].Visible = false; // Oculta la columna idProfesional
            }
        }



    }
}

 