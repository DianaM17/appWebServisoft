<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chatWhatsapp.aspx.cs" Inherits="appWebServisoft.Vista.chatWhatsapp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
       <%--       <div id="chatModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeChatModal()">&times;</span>
        <div class="chat-messages">
            <div class="message received">
                <div class="message-content">
                    ¡Hola! ¿En qué puedo ayudarte?
                </div>
            </div>
            <div class="message sent">
                <div class="message-content">
                    ¡Hola! Necesito ayuda con mi pedido.
                </div>
            </div>
            <!-- Puedes agregar más mensajes simulados aquí -->
        </div>
       <div class="chat-input">
            <input type="text" id="messageInput" placeholder="Escribe tu mensaje...">
            <button onclick="sendMessage()">Enviar</button>
        </div>
    </div>
</div>--%>

        <style>/* Estilos para el modal */
/* Estilos para el modal */
.modal {
    display: none;
    position: fixed;
    z-index: 9999; /* Ajusta el valor de z-index para que esté por encima de los demás elementos */
    bottom: 20px; /* Ajusta la distancia desde la parte inferior */
    right: 20px; /* Ajusta la distancia desde la parte derecha */
    max-width: 400px; /* Ajusta el ancho máximo de la modal */
    width: 80%;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}


.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

/* Estilos para el chat */
.chat-messages {
    max-height: 300px;
    overflow-y: auto;
}

.message {
    padding: 8px;
    margin-bottom: 5px;
    border-radius: 5px;
    max-width: 70%;
}

.received {
    background-color: #e5e5ea;
    float: left;
}

.sent {
    background-color: #dcf8c6;
    float: right;
}

.chat-input {
    margin-top: 10px;
}

.chat-input input {
    width: 80%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.chat-input button {
    width: 18%;
    padding: 8px;
    margin-left: 2%;
    border: none;
    background-color: #25d366;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
}

.chat-input button:hover {
    background-color: #128c7e;
}


</style>
        </div>
    </form>
</body>
</html>
