<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Contacto - TiendaTech</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/contacto.css">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<!-- INCLUIR NAVBAR -->
<jsp:include page="../layout/navbar.jsp" />

<section class="contacto-section">
    <h1>Contáctanos</h1>
    <p>¿Tienes dudas o consultas? Completa el siguiente formulario y te responderemos lo antes posible.</p>

    <form class="form-contacto">
        <label for="nombre">Nombre completo:</label>
        <input type="text" id="nombre" name="nombre" placeholder="Ej: Juan Pérez" required>

        <label for="email">Correo electrónico:</label>
        <input type="email" id="email" name="email" placeholder="tucorreo@ejemplo.com" required>

        <label for="asunto">Asunto:</label>
        <input type="text" id="asunto" name="asunto" placeholder="Motivo de contacto" required>

        <label for="mensaje">Mensaje:</label>
        <textarea id="mensaje" name="mensaje" rows="5" placeholder="Escribe tu consulta aquí..." required></textarea>

        <button type="submit"><i class="bi bi-send"></i> Enviar mensaje</button>
    </form>
</section>

</body>
</html>
