using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    public partial class interfazProfecional : System.Web.UI.Page
    {

        private List<int> cotizacionesOcultas = new List<int>();

        // Declarar la variable listaCotizaciones1 fuera del método BindRepeater() y RepeaterListar_ItemDataBound
        private List<ClSeleccionCotizacionE> listaCotizaciones1 = new List<ClSeleccionCotizacionE>();



        protected void Page_Load(object sender, EventArgs e)
        {

            lblUsuario.Text = "Bienvenido: " + Session["usuario"].ToString();
            lblIdCategoria.Text = Session["idProfesional"].ToString();

            if (!IsPostBack)
            {
                //ClCotizacionL objCotizacion = new ClCotizacionL();
                //List<ClSeleccionCotizacionE> listaCotizaciones1 = objCotizacion.mtdSeleccionCotizacion(1, 7);
                //GridView1.DataSource = listaCotizaciones1;
                //GridView1.DataBind(); 


                repeaterListar.ItemDataBound += RepeaterListar_ItemDataBound;

     

                BindRepeater();

                // Asignar el atributo personalizado en cada botón



            }
        }

        protected void BindRepeater()
        {
            ClCotizacionL objCotizacion = new ClCotizacionL();
            List<ClCotizacionE> listaCotizaciones = objCotizacion.mtdListarCotizacion(Convert.ToInt32(Session["idCategoria"]));

            int idProfesional;

            if (int.TryParse(Session["idProfesional"].ToString(), out idProfesional))
            {
                // Obtener la lista de registros de seleccionProfesional para el idCotizacion e idProfesional específicos
                listaCotizaciones1 = objCotizacion.mtdSeleccionCotizacion(1, idProfesional);
            }

            cotizacionesOcultas.Clear(); // Limpiamos la lista antes de agregar nuevas cotizaciones ocultas

            foreach (ClSeleccionCotizacionE cotizacion in listaCotizaciones1)
            {
                // Verificar si la cotización tiene seleccionProfesional = 1
                if (cotizacion.seleccionProfesional == 1)
                {
                    // Agregar el idCotizacion a la lista de cotizaciones ocultas
                    cotizacionesOcultas.Add(cotizacion.idCotizacion);
                }
            }

            repeaterListar.DataSource = listaCotizaciones;
            repeaterListar.DataBind();
        }






        protected void RepeaterListar_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Obtener el botón "btnSolicitarTrabajo" del RepeaterItem actual
                Button btnSolicitarTrabajo = (Button)e.Item.FindControl("btnSolicitarTrabajo");

                Label lblChulito = (Label)e.Item.FindControl("lblChulito");
                Label lblTextoSolicitado = (Label)e.Item.FindControl("lblTextoSolicitado");
                // Obtener el botón "btnCancelarSolicitud" del RepeaterItem actual
                Button btnCancelarSolicitud = (Button)e.Item.FindControl("btnCancelarSolicitud");

                // Obtener el idCotizacion del botón actual
                string idCotizacionBtnStr = btnSolicitarTrabajo.CommandArgument;
                int idCotizacionBtn;
                if (int.TryParse(idCotizacionBtnStr, out idCotizacionBtn))
                {
                    // Verificar si el idCotizacion está en la lista de cotizaciones ocultas
                    if (cotizacionesOcultas.Contains(idCotizacionBtn))
                    {
                        // Si el idCotizacion está en la lista, ocultar el botón "btnSolicitarTrabajo"
                        btnSolicitarTrabajo.Visible = false;

                        // Obtener la cotización correspondiente de la lista listaCotizaciones1
                        ClSeleccionCotizacionE cotizacion = listaCotizaciones1.FirstOrDefault(c => c.idCotizacion == idCotizacionBtn);
                        if (cotizacion != null)
                        {
                            // Asignar el idSeleccionCotizacion al botón "btnCancelarSolicitud"
                            btnCancelarSolicitud.Attributes["data-idseleccioncotizaciones"] = cotizacion.idSeleccionCotizacion.ToString();
                            // Encontrar el control Label "lblIdSeleccionCotizacion" dentro del contenedor
                            Label lblIdSeleccionCotizacion = (Label)e.Item.FindControl("lblIdSeleccionCotizacion");
                            // Asignar el valor de idSeleccionCotizacion al Label
                            lblIdSeleccionCotizacion.Text = cotizacion.idSeleccionCotizacion.ToString();
                            // Mostrar los elementos adicionales
                            lblChulito.Visible = true;
                            lblTextoSolicitado.Visible = true;
                            btnCancelarSolicitud.Visible = true;
                        }

                        
                    }
                    else
                    {
                        btnSolicitarTrabajo.Visible = true;
                        btnCancelarSolicitud.Visible = false; // Ocultar el botón "Cancelar Solicitud"
                    }
                }
            }
        }


        protected void BtnSolicitarTrabajo_Click(object sender, EventArgs e)
        {
            // Obtener el botón que generó el evento
            Button btn = (Button)sender;

            // Obtener el CommandArgument que contiene el valor del idCotizacion
            string idCotizacion1 = btn.CommandArgument;


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
                        }).then((result) => {
                            // Recargar la página después de que el usuario hace clic en 'Aceptar'
                            if (result.isConfirmed || result.isDismissed) {
                                window.location.reload();
                            }
                        });
                    </script>";

                ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, false);
            }
        
          
       
        }

        protected void btnCancelarSolicitud_Click(object sender, EventArgs e)
        {
            Button btnCancelarSolicitud = (Button)sender;
            RepeaterItem repeaterItem = (RepeaterItem)btnCancelarSolicitud.NamingContainer;

            // Get the data-idseleccioncotizaciones attribute value from the "btnCancelarSolicitud" button
            string idSeleccionCotizacionStr = btnCancelarSolicitud.Attributes["data-idseleccioncotizaciones"];

            int idSeleccionCotizacion;
            if (int.TryParse(idSeleccionCotizacionStr, out idSeleccionCotizacion))
            {


                ClCotizacionL objeliminarCotizacion = new ClCotizacionL();
                int resultado = objeliminarCotizacion.mtdEliminarseleleccionCotizacion(idSeleccionCotizacion);

                if (resultado == 1)
                {
                    // Mostrar el SweetAlert
                    string script = @"<script type='text/javascript'>
                        Swal.fire({
                            title: 'Cotización Cancelada',
                            text: '¡La cotización ha sido Cancelada!',
                            icon: 'success',
                            confirmButtonText: 'Aceptar'}).then((result) => {
                            // Recargar la página después de que el usuario hace clic en 'Aceptar'
                            if (result.isConfirmed || result.isDismissed) {
                                window.location.reload();
                            }
                        });
                    </script>";
            
                    ScriptManager.RegisterStartupScript(this, GetType(), "Popup", script, false);
                }
            }
          
        }


        protected void timerActualizar_Tick(object sender, EventArgs e)
        {
            // Obtener el valor de la sesión "idProfesional" como entero
            int idProfesional;
            if (int.TryParse(Session["idProfesional"].ToString(), out idProfesional))
            {
                // Crear una instancia de la clase ClCotizacionL
                ClCotizacionL objCotizacion = new ClCotizacionL();

                // Obtener la lista de registros de seleccionProfesional para el idCotizacion e idProfesional específicos
                List<ClSeleccionCotizacionE> listaCotizaciones1 = objCotizacion.mtdSeleccionCotizacion(1, idProfesional);

                // Asignar la lista como fuente de datos del GridView
                gridViewDatos.DataSource = listaCotizaciones1;
                gridViewDatos.DataBind();
            }
        }

        }
}