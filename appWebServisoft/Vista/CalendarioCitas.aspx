<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalendarioCitas.aspx.cs" Inherits="appWebServisoft.Vista.CalendarioCitas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.print.min.css" media="print" />
    <link href="Css/Calendario_Servicios.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id='calendar' class="calendario"></div>
    </form>
    <script src="Js/Js_CalendarioServicios.js"></script>
    <%--<script>
        $(document).ready(function () {
            $('#calendar').fullCalendar({
                defaultView: 'month',
                events: function (start, end, timezone, callback) {
                    $.ajax({
                        url: 'CalendarioCitas.aspx',
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            var eventos = [];
                            for (var i = 0; i < response.length; i++) {
                                var evento = {
                                    id: response[i].idsolicitudServicio,
                                    title: response[i].descripcion,
                                    start: response[i].fecha + 'T' + response[i].hora,
                                    allDay: true,
                                    description: response[i].descripcion
                                };
                                eventos.push(evento);
                            }
                            callback(eventos);
                        },
                    });
                },
                eventRender: function (event, element) {
                    element.find('.fc-title').append('<br>' + event.description);
                }
            });
        });--%>
    </script>
</body>

</html>
