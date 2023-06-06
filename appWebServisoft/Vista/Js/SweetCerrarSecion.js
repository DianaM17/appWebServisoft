function confirmarCerrarSesion() {
    Swal.fire({
        title: '¿Estás seguro?',
        text: "¿Deseas cerrar sesión?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, cerrar sesión',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            // Aquí puedes redirigir o realizar las acciones necesarias para cerrar sesión
            window.location.href = 'Principal.aspx'; // Ejemplo de redirección
        }
    });
}

// Manejador de eventos onchange para el DropDownList
function ddlOpciones_SelectedIndexChanged() {
    var selectedValue = document.getElementById("<%= ddlOpciones.ClientID %>").value;

    switch (selectedValue) {
        case "salir":
            confirmarCerrarSesion();
            break;
        default:
            break;
    }
}


