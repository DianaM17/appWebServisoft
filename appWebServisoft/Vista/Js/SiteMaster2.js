var toggleButton = document.getElementById("toggleButton");
var cardElements = document.getElementById("cardElements");

toggleButton.addEventListener("click", function (event) {
    event.preventDefault(); // Prevenir comportamiento predeterminado del botón
    cardElements.classList.toggle("show-links");
});