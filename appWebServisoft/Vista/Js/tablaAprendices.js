var idPer;
var table;
var listaPersonal;

$(document).ready(function () {
    table = $('#DataTableTrabajosP').DataTable({
        data: jsonData,
        columns: [
            { data: 'fecha' },
            { data: 'hora' },
            { data: 'descripcion' },
            { data: 'ubicacion' },           
            { data: 'nombre' },           
            { data: 'telefonoCliente' },           
            { data: 'Estado' },           
            {
                "data": null,
                "defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btn-sm btnEditar'><i class='material-icons'>edit</i></button><button class='btn btn-danger btn-sm btnBorrar'><i class='material-icons'>delete</i></button></div></div>",
            }

        ]


    })

})
$// Escuchar el evento clic en elementos con la clase '.btnEditar' dentro del elemento con el ID '#DataTableRegistros'
$('#DataTableRegistros').on('click', '.btnEditar', function (e) {
    e.preventDefault(); // Prevenir el comportamiento predeterminado del enlace

    // Obtener los datos de la fila correspondiente al botón clicado utilizando DataTables
    var rowData = $('#DataTableRegistros').DataTable().row($(this).closest('tr')).data();
    var idPer = rowData.idPersonal; // Obtener el ID del personal

    // Realizar una solicitud AJAX para cargar datos utilizando el ID obtenido
    $.ajax({
        url: "ListarAprendices.aspx/mtdCargarDatos",
        type: "POST",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify({ idPersonal: idPer }),
        success: function (Data) {
            var datosProducto = Data.d; // Obtener los datos del servidor

            // Llenar los campos en el modal con los datos recibidos
            $('.txt-nombres-personal').val(datosProducto[0]["nombres"]);
            $('.txt-apellidos-personal').val(datosProducto[0]["apellidos"]);
            $('.txt-documento-personal').val(datosProducto[0]["documento"]);
            $('.txt-programa-personal').val(datosProducto[0]["programa"]);
            $('.txt-rol-personal').val(datosProducto[0]["rol"]);

            $('#editarModal').modal('show'); // Mostrar el modal de edición
        },
        error: function (error) {
            console.log(error); // Manejar errores en la consola
        }
    });
});
$(document).ready(function () {
    $('#btnActualizar').on('click', function (e) {
        e.preventDefault();

        var idPersonal = idPer;
        var nombres = $('.txt-nombres-personal').val();
        var apellidos = $('.txt-apellidos-personal').val();
        var documento = $('.txt-documento-personal').val();
        var idPrograma = $('.txt-programa-personal').val();

        var datosActualizados = {
            idPersonal: idPersonal,
            nombres: nombres,
            apellidos: apellidos,
            documento: documento,
            idPrograma: idPrograma,
        };

        actualizarDatos(datosActualizados);
    });

    function actualizarDatos(datos) {
        $.ajax({
            url: "TabTrabajosPen.aspx/mtdActualizarAprendiz",
            type: "POST",
            data: JSON.stringify({ data: datos }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                recargarTabla();
                mostrarMensajeExito();
                $('#editarModal').modal('hide');
            },
            error: function (error) {
                mostrarMensajeError();
                console.log(error);
            }
        });
    }

    function recargarTabla() {
        $.ajax({
            url: "TabTrabajosPen.aspx/mtdListar",
            type: "POST",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (response) {
                actualizarTabla(response.d);
                console.log(response.d);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    function actualizarTabla(data) {
        listaPersonal = data;
        table.clear();
        table.rows.add(listaPersonal);
        table.draw();
    }

    function mostrarMensajeExito() {
        swal("¡Éxito!", "Los datos se actualizaron correctamente.", "success");
    }

    function mostrarMensajeError() {
        swal("¡Error!", "Hubo un problema al actualizar los datos.", "error");
    }
});







