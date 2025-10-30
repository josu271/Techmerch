<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nueva Cita Técnica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/citastecnica.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
</head>
<body>
<%@ include file="../../layout/sidebar.jsp" %>

<div class="contenido">
    <h1>Registrar Nueva Cita Técnica</h1>
    <form method="post" action="#">
        <label>Cliente:</label>
        <input type="text" name="cliente">
        <label>Empleado:</label>
        <input type="text" name="empleado">
        <label>Servicio:</label>
        <input type="text" name="servicio">
        <label>Descripción:</label>
        <textarea name="descripcion"></textarea>
        <label>Fecha Programada:</label>
        <input type="datetime-local" name="fecha">
        <button type="submit" class="btn-save">Guardar</button>
    </form>
</div>
</body>
</html>
