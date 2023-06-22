﻿using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClCotizacionL
    {
        public int mtdRegistroCotizacion(ClCotizacionE objCot)
        {
            ClCotizacioD objCoti = new ClCotizacioD();
            int regis = objCoti.mtdRegistrarCotizacion(objCot);
            return regis;
        }

        public ClCotizacionE mtdCotizacion(string idCot)
        {
            ClCotizacioD objCotiz = new ClCotizacioD();
            ClCotizacionE lista = objCotiz.mtdMostrarImg(idCot);
            return lista;
        }

        public List<ClCotizacionE> mtdListarCotizacion(int idCategoria)
        {
            ClCotizacioD ObjCotizacion = new ClCotizacioD();
            List<ClCotizacionE> ListaCotizacion = ObjCotizacion.mtdListaCotizacion(idCategoria);
            return ListaCotizacion;
        }
    }
}