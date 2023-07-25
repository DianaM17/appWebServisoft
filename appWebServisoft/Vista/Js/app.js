function initializeGallery() {
    const enlaces = document.querySelectorAll('.custom-link');
    const lightbox = document.querySelector('.lightbox');
    const grande = document.querySelector('.grande');
    const cerrar = document.querySelector('.cerrar');

    enlaces.forEach((cadaEnlace) => {
        cadaEnlace.addEventListener('click', (e) => {
            e.preventDefault();
            let ruta = cadaEnlace.querySelector('.img').src;
            console.log(ruta);

            lightbox.classList.add('activo');
            grande.setAttribute('src', ruta);
        });
    });

    cerrar.addEventListener('click', (e) => {
        e.preventDefault(); // Evita que la página se recargue al cerrar la lightbox
        lightbox.classList.remove('activo');
        // Vuelve a inicializar la galería cada vez que se cierra la lightbox
        initializeGallery();
    });
}

document.addEventListener('DOMContentLoaded', () => {
    initializeGallery();
});
