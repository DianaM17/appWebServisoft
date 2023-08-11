using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace appWebServisoft.Vista
{
    
        public partial class EstadoServicios : System.Web.UI.Page
    {
        // Variable de clase para almacenar el valor de "idsolicitudServicio"
        protected int selectedSolicitudId = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idCliente = int.Parse(Session["idCliente"].ToString());
                // Obtener los datos desde la capa lógica
                ClServicioL objServicioL = new ClServicioL();
                List<ClSolicitudServicioE> listaServ = objServicioL.mtdServicioCliente(idCliente);

                // Asignar los datos al GridView
                gvServicio.DataSource = listaServ;
                gvServicio.DataBind();

                //Cargar Combo ddlCiudad 
                ClCiudadL objCiudad = new ClCiudadL();
                List<ClCiudadE> listaCiudad = new List<ClCiudadE>();
                listaCiudad = objCiudad.mtdListarCiudad();

                ddlCiudad.DataSource = listaCiudad;
                ddlCiudad.DataTextField = "nombre";
                ddlCiudad.DataValueField = "idCiudad";
                ddlCiudad.DataBind();
                ddlCiudad.Items.Insert(0, new ListItem("Seleccione Ciudad: ", "0"));
                // Llamar al método para enlazar datos al GridView
                BindGridView();
            }
        }

        protected void BindGridView()
        {
            int idCliente = int.Parse(Session["idCliente"].ToString());
            ClServicioL objServicioL = new ClServicioL();
            List<ClSolicitudServicioE> listaServ = objServicioL.mtdServicioCliente(idCliente);
            gvServicio.DataSource = listaServ;
            gvServicio.DataBind();
        }

        //protected void gvServicio_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        System.Web.UI.WebControls.Label label1 = e.Row.FindControl("Label1") as System.Web.UI.WebControls.Label;
        //        if (label1 != null)
        //        {
        //            string idsolicitudServicio = gvServicio.DataKeys[e.Row.RowIndex]["idsolicitudServicio"].ToString();
        //            label1.Text = idsolicitudServicio;
        //            System.Web.UI.WebControls.Button btnOpenModal = e.Row.FindControl("btnOpenModal") as System.Web.UI.WebControls.Button;
        //            if (btnOpenModal != null)
        //            {
        //                btnOpenModal.Attributes["data-idsolicitudservicio"] = idsolicitudServicio;
        //            }
        //        }
        //    }
        //}

        protected void gvServicio_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Obtener el valor del campo "estadoServ" para la fila actual
                string estadoServicio = DataBinder.Eval(e.Row.DataItem, "estadoServ").ToString();

                // Buscar el control de botón dentro del UpdatePanel
                Button btnOpenModal = e.Row.FindControl("btnOpenModal") as Button;

                // Verificar si el estado del servicio es "terminado" para mostrar el botón de comentarios
                if (estadoServicio == "Terminado")
                {
                    btnOpenModal.Visible = true;
                }
                else
                {
                    btnOpenModal.Visible = false;
                }

                // Ajustar el atributo data-idsolicitudservicio del botón para usarlo en JavaScript
                string idsolicitudServicio = gvServicio.DataKeys[e.Row.RowIndex]["idsolicitudServicio"].ToString();
                btnOpenModal.Attributes["data-idsolicitudservicio"] = idsolicitudServicio;
            }
        }

        protected void btnOpenModal_Click(object sender, EventArgs e)
        {
           
            Button btnOpenModal = sender as Button;
            string idsolicitudServicio = btnOpenModal.CommandArgument;
            Label2.Text = idsolicitudServicio;
            ScriptManager.RegisterStartupScript(this, GetType(), "MostrarModal", "$('#miModal').modal('show');", true);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Button btnCancelar = (Button)sender;
            GridViewRow row = (GridViewRow)btnCancelar.NamingContainer;

            if (row.RowIndex < gvServicio.DataKeys.Count)
            {
                int idServicio = Convert.ToInt32(gvServicio.DataKeys[row.RowIndex].Value);
                ClServicioL objServicio = new ClServicioL();
                int Cancelar = objServicio.mtdCancelarServicio(idServicio);

                string script = @"<script> swal({ title: '¡Cancelacion Exitosa!',
                              text: 'El servicio se ah cancelado con exito', type: 'success',
                            confirmButtonText: 'Aceptar'
                });
                    </script>";
                if (Cancelar == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idServicio = Convert.ToInt32(hdnSelectedId.Value);
            ClSolicitudServicioE objDatos = new ClSolicitudServicioE();
            objDatos.fecha = txtFecha.Text;
            objDatos.hora = txtHora.Value;
            objDatos.ubicacion = txtDireccion.Text;
            objDatos.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());

            ClServicioL objServicioL = new ClServicioL();
            int registro = objServicioL.mtdReprogramarServicio(objDatos, idServicio);

            if (registro == 1)
            {
                string script = @"<script> swal({ title: '¡Registro Exitoso!', text: 'El servicio ha sido solicitado con exito.',type: 'success',
                    confirmButtonText: 'Aceptar'});
                </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
            }

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            int idUsuario = Convert.ToInt32(Session["idCliente"]);
            ClComentarioE objRegistroComentario = new ClComentarioE();
            objRegistroComentario.nivel = hdnSelectedLevel.Value;
            objRegistroComentario.estrellas = Convert.ToInt32(hdnSelectedRating.Value);
            objRegistroComentario.comentarios = txtComentario.Text;
            int idsolicitudServicio;
            if (int.TryParse(Label2.Text, out idsolicitudServicio))
            {
                objRegistroComentario.idsolicitudServicio = idsolicitudServicio;
            }
            objRegistroComentario.idCliente = idUsuario;
            ClComentarioL objRegistroL = new ClComentarioL();
            int resultado = objRegistroL.mtdRegistroComentario(objRegistroComentario);

            if (resultado == 1)
            {
                
                ScriptManager.RegisterStartupScript(this, GetType(), "CerrarModalYRecargar", "$('.modal').modal('hide'); location.reload();", true);
            }
        }


        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "CerrarModalYRecargar", "$('.modal').modal('hide'); location.reload();", true);

        }


    }


}

