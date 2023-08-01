using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
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
                listaCotizaciones1 = objCotizacion.mtdSeleccionCotizacion(1);
                //repeaterListar.DataSource = listaCotizaciones;
                //repeaterListar.DataBind();
                Session["ListaCotizaciones1"] = listaCotizaciones1;
                GridView1.DataKeyNames = new string[] { "idsolicitudServicio" }; // Configurar DataKeyNames
                GridView1.DataBind();

                repeaterListar.ItemDataBound += RepeaterListar_ItemDataBound;

                BindRepeater();

                // Asignar el atributo personalizado en cada botón
            


            }
        }

        private void BindRepeater()
        {
            ClCotizacionL objCotizacion = new ClCotizacionL();
            List<ClCotizacionE> listaCotizaciones = objCotizacion.mtdListarCotizacion(Convert.ToInt32(Session["idCategoria"]));
            listaCotizaciones1 = objCotizacion.mtdSeleccionCotizacion(1);
            repeaterListar.DataSource = listaCotizaciones;
            repeaterListar.DataBind();
        }

        protected void RepeaterListar_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                RepeaterItem repeaterItem = e.Item;

                // Obtener el valor del identificador "idCotizacion" desde el RepeaterItem
                int idCotizacion = Convert.ToInt32(DataBinder.Eval(repeaterItem.DataItem, "idCotizacion"));

                // Buscar el registro correspondiente en la lista listaCotizaciones1 usando el idCotizacion
                ClSeleccionCotizacionE seleccionCotizacion = listaCotizaciones1.FirstOrDefault(c => c.seleccionProfesional == idCotizacion);

                // Acceder al botón dentro del RepeaterItem
                Button btnSolicitarTrabajo = repeaterItem.FindControl("btnSolicitarTrabajo") as Button;
                Button btnCancelarSolicitud = repeaterItem.FindControl("btnCancelarSolicitud") as Button;
                Label lblChulito = repeaterItem.FindControl("lblChulito") as Label;
                Label lblTextoSolicitado = repeaterItem.FindControl("lblTextoSolicitado") as Label;

                // Verificar si el campo seleccionProfesional es igual a 1 para ocultar el botón "Solicitar Trabajo"
                if (seleccionCotizacion != null && seleccionCotizacion.seleccionProfesional == 1)
                {
                    btnSolicitarTrabajo.Visible = false;
                    lblChulito.Visible = true;
                    lblTextoSolicitado.Visible = true;
                    btnCancelarSolicitud.Visible = true; // Mostrar el botón "Cancelar Solicitud"
                }
                else
                {
                    btnSolicitarTrabajo.Visible = true;
                    btnCancelarSolicitud.Visible = false; // Ocultar el botón "Cancelar Solicitud"
                }

                // Agregar el controlador de eventos Click para el botón "Solicitar Trabajo"
                btnSolicitarTrabajo.Click += BtnSolicitarTrabajo_Click;

                // Agregar el atributo personalizado en el evento ItemDataBound
                btnSolicitarTrabajo.Attributes["data-idcotizacion"] = idCotizacion.ToString();
            }
        }










        protected void BtnSolicitarTrabajo_Click(object sender, EventArgs e)
        {
            Button btnSolicitarTrabajo = sender as Button;

            //// Obtener el ID del botón
            string btnId = btnSolicitarTrabajo.ClientID;

            ////// Obtener el LabelIdBoton dentro del mismo contenedor del botón
            Label lblIdBoton = btnSolicitarTrabajo.Parent.FindControl("LabelIdBoton") as Label;

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
                // Mostrar el SweetAlert
                string script = @"<script type='text/javascript'>
                            Swal.fire({
                                title: 'Cotización solicitada',
                                text: '¡La cotización ha sido solicitada exitosamente!',
                                icon: 'success',
                                confirmButtonText: 'Aceptar'
                            });
                        </script>";
                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, false);
            }
                
            }

        protected void btnCancelarSolicitud_Click(object sender, EventArgs e)
        {
            // Mostrar el SweetAlert
            string script = @"<script type='text/javascript'>
                            Swal.fire({
                                title: 'Cotización Cancelada',
                                text: '¡La cotización ha sido Cancelada!',
                                icon: 'success',
                                confirmButtonText: 'Aceptar'
                            });
                        </script>";
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, false);
        }
    }
    }

