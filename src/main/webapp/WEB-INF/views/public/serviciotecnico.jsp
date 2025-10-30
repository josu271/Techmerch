<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Servicio Técnico - TiendaTech</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/serviciotecnico.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../layout/navbar.jsp" />

<!-- SECCIÓN PROMOCIONAL / MINI INICIO -->
<section class="servicio-intro">
    <div class="intro-texto">
        <h1>Servicio Técnico de Confianza</h1>
        <p>En TiendaTech nos especializamos en reparaciones rápidas y confiables para tu equipo. <br>
           Garantizamos calidad, profesionalismo y atención personalizada. <br>
           ¡Tu satisfacción es nuestra prioridad!</p>
        <a href="#reserva" class="btn-reserva">Reservar Cita Ahora</a>
    </div>
    <div class="intro-imagen">
        <img src="<c:url value='/img/servicio-tecnico.jpg' />" alt="Servicio Técnico">
    </div>
</section>

<!-- SECCIÓN DE RESERVA -->
<section id="reserva" class="servicio-reserva">
    <h2>Reserva tu Cita de Servicio Técnico</h2>
    <p>Completa el formulario y nuestro equipo especializado te contactará para confirmar la cita.</p>

    <form action="#" method="post" class="servicio-form">
        <label for="nombre">Nombre completo:</label>
        <input type="text" id="nombre" name="nombre" placeholder="Ej: Juan Pérez" required>

        <label for="email">Correo electrónico:</label>
        <input type="email" id="email" name="email" placeholder="tucorreo@ejemplo.com" required>

        <label for="telefono">Teléfono:</label>
        <input type="tel" id="telefono" name="telefono" placeholder="Ej: +51 912345678" required>

        <label for="equipo">Equipo a reparar:</label>
        <input type="text" id="equipo" name="equipo" placeholder="Ej: Laptop ASUS ROG" required>

        <label for="fecha">Fecha de cita:</label>
        <input type="date" id="fecha" name="fecha" required>

        <label for="hora">Hora de cita:</label>
        <input type="time" id="hora" name="hora" required>

        <label for="detalle">Detalles del problema:</label>
        <textarea id="detalle" name="detalle" rows="4" placeholder="Describe el problema de tu equipo" required></textarea>

        <button type="submit"><i class="bi bi-calendar-check"></i> Reservar Cita</button>
    </form>

    <c:if test="${not empty mensaje}">
        <p class="mensaje-exito">${mensaje}</p>
    </c:if>
</section>

</body>
</html>
