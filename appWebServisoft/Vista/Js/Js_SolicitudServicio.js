function generateYearOptions() {
    const yearSelect = document.getElementById("year");
    const currentYear = new Date().getFullYear();

    for (let i = currentYear; i <= currentYear + 5; i++) {
        const option = document.createElement("option");
        option.value = i;
        option.text = i;
        yearSelect.appendChild(option);
    }
}

function generateCalendar(year, month) {
    const calendarContainer = document.getElementById("calendar");
    calendarContainer.innerHTML = "";

    const daysInMonth = new Date(year, month + 1, 0).getDate();
    const firstDayIndex = new Date(year, month, 1).getDay();

    const calendar = document.createElement("div");
    calendar.classList.add("calendar");

    // Add day names
    const dayNames = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
    for (let i = 0; i < 7; i++) {
        const dayName = document.createElement("div");
        dayName.classList.add("day");
        dayName.innerText = dayNames[i];
        calendar.appendChild(dayName);
    }

    // Add empty cells for previous month
    for (let i = 0; i < firstDayIndex; i++) {
        const emptyCell = document.createElement("div");
        emptyCell.classList.add("day", "empty");
        calendar.appendChild(emptyCell);
    }

    // Add days of the month
    for (let i = 1; i <= daysInMonth; i++) {
        const dayCell = document.createElement("div");
        dayCell.classList.add("day");
        dayCell.innerText = i;
        dayCell.setAttribute("onclick", `openModal(${i}, ${month}, ${year})`);
        calendar.appendChild(dayCell);
    }

    calendarContainer.appendChild(calendar);
}

function loadCalendar() {
    const year = parseInt(document.getElementById("year").value);
    const month = parseInt(document.getElementById("month").value);

    generateCalendar(year, month);
}

function openModal(day, month, year) {
    const modal = document.getElementById("modal");
    const modalDate = document.getElementById("eventdate");

    modal.style.display = "block";
    modalDate.value = `${day}-${month + 1}-${year}`;
}

function closeModal() {
    const modal = document.getElementById("modal");
    modal.style.display = "none";
}

function saveEvent() {
    const eventDate = document.getElementById("eventdate").value;
    const eventTime = document.getElementById("event-time").value;
    const clientName = document.getElementById("client-name").value;
    const professionalName = document.getElementById("professional-name").value;

    // Validar que los campos no estén vacíos
    if (eventTime === "" || clientName === "" || professionalName === "") {
        alert("Por favor, completa todos los campos.");
        return;
    }

    // Aquí puedes agregar la lógica para guardar el evento en tu sistema o hacer cualquier otra acción deseada
    console.log("Evento guardado:");
    console.log("Fecha:", eventDate);
    console.log("Hora:", eventTime);
    console.log("Nombre del Cliente:", clientName);
    console.log("Nombre del Profesional:", professionalName);

    // Limpiar los campos y cerrar la ventana modal
    document.getElementById("event-time").value = "";
    document.getElementById("client-name").value = "";
    document.getElementById("professional-name").value = "";
    closeModal();
}

window.onload = function () {
    generateYearOptions();
};
