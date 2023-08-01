using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class interfazProfecional : System.Web.UI.Page
    {
        // Declarar una variable de clase para almacenar los datos de listaCotizaciones1
        private List<ClSeleccionCotizacionE> listaCotizaciones1;

       
        protected void Page_Load(object sender, EventArgs e)
        {

            lblUsuario.Text = "Bienvenido: " + Session["usuario"].ToString();
            lblIdCategoria.Text = Session["idProfesional"].ToString();

            if (!IsPostBack)
            {
                ClCotizacionL objCotizacion = new ClCotizacionL();
                List<ClCotizacionE> listaCotizaciones = objCotizacion.mtdListarCotizacion(Convert.ToInt32(Session["idCategoria"]));
                repeaterListar.DataSource = listaCotizaciones;
                repeaterListar.DataBind();

                GridView1.DataSource = listaCotizaciones1;
                GridView1.DataBind();

                repeaterListar.ItemDataBound += RepeaterListar_ItemDataBound;

                listaCotizaciones1 = objCotizacion.mtdSeleccionCotizacion(1);

                // Verificar toda la lista y realizar el proceso cuando el campo 'CampoEspecifico' es igual a 1
                foreach (var elemento in listaCotizaciones1)
                {
                    if (elemento.seleccionProfesional == 1)
                    {
                        
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "MostrarSolicitado", "mostrarTrabajoSolicitado();", true);
                        // Ocultar el botón "Solicitar Trabajo" cuando se cumpla la condición
                        //btnSolicitarTrabajo.Visible = false;
                    }

                    else
                    {
                        
                    }
                }

               
            }
        }


        protected void RepeaterListar_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button btnSolicitarTrabajo = e.Item.FindControl("btnSolicitarTrabajo") as Button;
                btnSolicitarTrabajo.Click += BtnSolicitarTrabajo_Click;
            }
        }


        protected void BtnSolicitarTrabajo_Click(object sender, EventArgs e)
        {
            Button btnSolicitarTrabajo = sender as Button;

            //// Obtener el ID del botón
            string btnId = btnSolicitarTrabajo.ClientID;

            ////// Obtener el LabelIdBoton dentro del mismo contenedor del botón
            Label lblIdBoton = btnSolicitarTrabajo.Parent.FindControl("LabelIdBoton") as Label;

            // Mostrar el ID del botón en el LabelIdBoton
            lblIdBoton.Text = "ID del botón: " + btnId;
            lblIdBoton.Visible = true;
            lblIdBoton.ForeColor = System.Drawing.Color.Green;
            lblIdBoton.Font.Bold = true;

            //// Obtener el contenedor del botón
            RepeaterItem item = (RepeaterItem)btnSolicitarTrabajo.NamingContainer;

            // Encontrar el control Label "lblIdCotizacion" dentro del contenedor
            Label lblIdCotizacion = item.FindControl("lblIdCotizacion") as Label;

            // Obtener el valor del Label en una variable
            int idCotizacion = Convert.ToInt32(lblIdCotizacion.Text);

            // Obtener el ID de usuario de la sesión y convertirlo a entero
            int idUsuario = Convert.ToInt32(Session["idProfesional"]);

            ClSeleccionCotizacionE objRegistroCotizacion = new ClSeleccionCotizacionE();
            objRegistroCotizacion.seleccionProfesional = 1;
            objRegistroCotizacion.idProfesional = idUsuario;
            objRegistroCotizacion.idCotizacion = idCotizacion;

            ClCotizacionL objRegistroL = new ClCotizacionL();
            int resultado = objRegistroL.mtdRegistroSeleccionCotizacion(objRegistroCotizacion);

           
                if (resultado == 1)
            {
                //// Llamar al método JavaScript para mostrar el chulito y el texto
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "MostrarSolicitado", "mostrarTrabajoSolicitado();", true);
                //// Llamar a la función mostrarMensaje con el ID del botón
                ////ScriptManager.RegisterStartupScript(this, this.GetType(), "mostrarMensaje", "mostrarMensaje('" + btnId + "');", true);
            }
                
            }
        }
    }

