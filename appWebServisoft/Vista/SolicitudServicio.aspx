<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SolicitudServicio.aspx.cs" Inherits="appWebServisoft.Vista.SolicitudServicio" %>


<!DOCTYPE html>
<html>
<head>
    <title>Calendario</title>
    <link href="Css/Estilos_SolicitudServicio.css" rel="stylesheet" />
</head>
<body>
    <h1>Calendario</h1>
    <div id="calendar-container">
        <h2>Selecciona el mes y el año:</h2>
        <div class="select-container">
            <select id="month">
                <option value="0">Enero</option>
                <option value="1">Febrero</option>
                <option value="2">Marzo</option>
                <option value="3">Abril</option>
                <option value="4">Mayo</option>
                <option value="5">Junio</option>
                <option value="6">Julio</option>
                <option value="7">Agosto</option>
                <option value="8">Septiembre</option>
                <option value="9">Octubre</option>
                <option value="10">Noviembre</option>
                <option value="11">Diciembre</option>
            </select>
            <select id="year"></select>
        </div>
        <div class="button-container">
            <button onclick="loadCalendar()">Mostrar Calendario</button>
        </div>
        <div id="calendar"></div>
    </div>

    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>Crear evento</h2>
            <div>
                <label for="event-date">Fecha:</label>
                <input type="text" id="event-date" disabled>
            </div>
            <div>
                <label for="event-time">Hora:</label>
                <input type="time" id="event-time">
            </div>
            <div>
                <label for="client-name">Nombre del Cliente:</label>
                <input type="text" id="client-name">
            </div>
            <div>
                <label for="professional-name">Nombre del Profesional:</label>
                <input type="text" id="professional-name">
            </div>
            <button onclick="saveEvent()">Guardar</button>
        </div>
    </div>

    <script src="Js/Js_SolicitudServicio.js"></script>
</body>
</html>

