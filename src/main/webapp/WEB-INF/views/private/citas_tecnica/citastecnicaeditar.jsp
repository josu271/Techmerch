<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Cita Técnica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/citastecnica.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
</head>
<body>
<%@ include file="../../layout/sidebar.jsp" %>

<div class="content">
    <h1>Editar Cita Técnica</h1>
    <form method="post" action="#">
        <label>ID:</label>
        <input type="text" name="id" readonly value="1">
        <label>Estado:</label>
        <select name="estado">
            <option>Pendiente</option>
            <option>En proceso</option>
            <option>Completado</option>
        </select>
        <button type="submit" class="btn-save">Actualizar</button>
    </form>
</div>
</body>
</html>
