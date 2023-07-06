function generateCalendar(year, month, eventos) {
    const calendarContainer = document.getElementById("calendar");
    calendarContainer.innerHTML = "";

    const daysInMonth = new Date(year, month + 1, 0).getDate();
    const firstDayIndex = new Date(year, month, 1).getDay();

    const calendar = document.createElement("div");
    calendar.classList.add("calendar");

    // Agregar cabecera del calendario
    const header = document.createElement("div");
    header.classList.add("header");
    header.innerText = moment({ year, month }).format("MMMM YYYY");
    calendar.appendChild(header);

    // Agregar días de la semana
    const weekDays = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];
    const weekDaysContainer = document.createElement("div");
    weekDaysContainer.classList.add("week-days");
    for (let i = 0; i < weekDays.length; i++) {
        const day = document.createElement("div");
        day.classList.add("week-day");
        day.innerText = weekDays[i];
        weekDaysContainer.appendChild(day);
    }
    calendar.appendChild(weekDaysContainer);

    // Agregar casillas para los días del mes
    const daysContainer = document.createElement("div");
    daysContainer.classList.add("days");
    for (let i = 0; i < firstDayIndex; i++) {
        const emptyCell = document.createElement("div");
        emptyCell.classList.add("day", "empty");
        daysContainer.appendChild(emptyCell);
    }
    for (let i = 1; i <= daysInMonth; i++) {
        const dayCell = document.createElement("div");
        dayCell.classList.add("day");
        dayCell.innerText = i;

        // Buscar eventos para el día actual
        const currentDayEvents = eventos.filter(evento => {
            const eventoFecha = moment(evento.fecha, "YYYY-MM-DD");
            return eventoFecha.year() === year && eventoFecha.month() === month && eventoFecha.date() === i;
        });

        // Mostrar eventos en la casilla del día
        if (currentDayEvents.length > 0) {
            const eventList = document.createElement("ul");
            eventList.classList.add("event-list");
            currentDayEvents.forEach(evento => {
                const eventItem = document.createElement("li");
                eventItem.innerText = evento.title;
                eventList.appendChild(eventItem);
            });
            dayCell.appendChild(eventList);
        }

        daysContainer.appendChild(dayCell);
    }
    calendar.appendChild(daysContainer);

    calendarContainer.appendChild(calendar);
}

// Cargar el calendario con los eventos
function loadCalendar() {
    const year = new Date().getFullYear();
    const month = new Date().getMonth();

    // Simulación de eventos obtenidos desde la API
    const eventos = [
        { title: "Evento 1", fecha: "2023-07-04" },
        { title: "Evento 2", fecha: "2023-07-08" },
        { title: "Evento 3", fecha: "2023-07-15" }
    ];

    generateCalendar(year, month, eventos);
}

// Llamar a la función para cargar el calendario al cargar la página
window.onload = loadCalendar;





