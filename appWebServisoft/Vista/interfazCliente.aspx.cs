using appWebServisoft.Entidades;
using appWebServisoft.Logica;
using System;
using System.Collections.Generic;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Linq;
using System.Web;
using System.Web.UI;


namespace appWebServisoft.Vista
{
    public partial class interfazCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClProfesionalL objProfesional = new ClProfesionalL();
            List<ClProfesionalE> verifica = objProfesional.mtdListarProfesional();
            Repeater1.DataSource = verifica;
            Repeater1.DataBind();



            //ClServicioL objServicio = new ClServicioL();
            //List<ClImagenesServicioE> imagenes = objServicio.mtdlistarImagenServicio();

            //Repeater2.DataSource = imagenes;
            //Repeater2.DataBind();
         
            if (!IsPostBack)
            {
                //Cargar Combo ddlCategoria 
                ClCategoriaL objCategoria = new ClCategoriaL();
                List<ClCategoriaE> listaCategoria = new List<ClCategoriaE>();
                listaCategoria = objCategoria.mtdListar();

                ddlCategoria.DataSource = listaCategoria;
                ddlCategoria.DataTextField = "categoria";
                ddlCategoria.DataValueField = "idCategoria";
                ddlCategoria.DataBind();
                ddlCategoria.Items.Insert(0, new ListItem("Seleccione: ", "0"));

                ClComentarioL objComentario = new ClComentarioL();
                List<ClComentarioE> comentario = objComentario.mtdListarComentario();
                RepeaterContenido.DataSource = comentario;
                RepeaterContenido.DataBind();

                // Ejecutar la función de cambio de índice cada 5 segundos
                ScriptManager.RegisterStartupScript(this, GetType(), "ChangeIndex", "setInterval(ChangeCarouselIndex, 5000);", true);
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
            ddlServicio.Items.Insert(0, new ListItem("Seleccione: ", "0"));
        }

        protected void RepeaterContenido_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlGenericControl carouselItem = e.Item.FindControl("carouselItem") as HtmlGenericControl;
                if (carouselItem != null)
                {
                    if (e.Item.ItemIndex == 0)
                    {
                        carouselItem.Attributes["class"] += " active";
                    }
                }
            }
        }
        protected string GetCarouselItemClass(int itemIndex)
        {
            return itemIndex == 0 ? "carousel-item active" : "carousel-item";

        }
    }
}