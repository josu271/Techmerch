<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calendario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- CSS personalizados -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/calendario.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>📅 Calendario de Citas Técnicas</h1>
        <p class="descripcion">Aquí podrás visualizar, agregar y gestionar las citas programadas.</p>

        <div id="calendario-container">
            <div class="calendario-placeholder">
                <i class="bi bi-calendar3"></i>
                <p>Próximamente se integrará el calendario interactivo (FullCalendar.js o similar).</p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
