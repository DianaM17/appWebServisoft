document.addEventListener('DOMContentLoaded', function () {
    var parent = document.querySelector('.splitview'),
        topPanel = parent.querySelector('.top'),
        handle = parent.querySelector('.handle'),
        skewHack = 0,
        delta = 0;

    // If the parent has .skewed class, set the skewHack var.
    if (parent.className.indexOf('skewed') != -1) {
        skewHack = 1000;
    }

    parent.addEventListener('mousemove', function (event) {
        // Get the delta between the mouse position and center point.
        delta = (event.clientX - window.innerWidth / 2) * 0.5;

        // Move the handle.
        handle.style.left = event.clientX + delta + 'px';

        // Adjust the top panel width.
        topPanel.style.width = event.clientX + skewHack + delta + 'px';
    });
});


/*cards profesional*/

$(document).ready(function () {
    var owl = $('.owl-carousel');

    owl.owlCarousel({
        loop: true,
        nav: true,
        navText: [
            '<button class="owl-prev" data-action="prev">&#8249; Anterior</button>',
            '<button class="owl-next" data-action="next">Siguiente &#8250;</button>'
        ],
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 2
            },
            900: {
                items: 4
            }
        }
    });

    // Manejar el evento click en el botón de flecha previa
    $('.owl-prev').click(function () {
        owl.trigger('prev.owl.carousel');
    });

    // Manejar el evento click en el botón de flecha siguiente
    $('.owl-next').click(function () {
        owl.trigger('next.owl.carousel');
    });

    // Evitar que se recargue la página al hacer clic en los botones
    $('.owl-prev, .owl-next').click(function (e) {
        e.preventDefault();
    });
});