using appWebServisoft.Datos;
using appWebServisoft.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace appWebServisoft.Logica
{
    public class ClComentarioL
    {
        public List<ClComentarioE> mtdListarComentario()
        {
            ClComentarioD objComentarioD = new ClComentarioD();
            List<ClComentarioE> listaComentarios = objComentarioD.mtdListarComentario();
            return listaComentarios;
        }

        public int mtdRegistroComentario(ClComentarioE objCom)
        {
            ClComentarioD objCoti = new ClComentarioD();
            int regis = objCoti.mtdRegistrarComentario(objCom);
            return regis;
        }
    }
}