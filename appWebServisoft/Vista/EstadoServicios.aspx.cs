using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace appWebServisoft.Vista
{
    public partial class EstadoServicios : System.Web.UI.Page
    {
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
            }
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

        //protected void btnReprogramar_Click(object sender, EventArgs e)
        //{
        //    Button btnReprogramar = (Button)sender;
        //    GridViewRow row = (GridViewRow)btnReprogramar.NamingContainer.FindControl("gvServicioRow");
        //    if (row != null)
        //    {
        //        int idServicio = Convert.ToInt32(gvServicio.DataKeys[row.RowIndex].Value);
        //        ClSolicitudServicioE objServ = new ClSolicitudServicioE();
        //        objServ.fecha = txtFecha.Text;
        //        objServ.hora = txtHora.Value;
        //        objServ.ubicacion = txtDireccion.Text;
        //        objServ.idCiudad = int.Parse(ddlCiudad.SelectedValue.ToString());
        //        ClServicioL objServi = new ClServicioL();
        //        int Reprogramar = objServi.mtdReprogramarServicio(objServ, idServicio);
        //        string script = @"<script> swal({ title: '¡Reprogramación Exitosa!',
        //                      text: 'El servicio se ah reprogramado con exito', type: 'success',
        //                    confirmButtonText: 'Aceptar'
        //        });
        //            </script>";
        //        if (Reprogramar == 1)
        //        {
        //            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", script);
        //        }
        //    }
        //}

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
    }
}

