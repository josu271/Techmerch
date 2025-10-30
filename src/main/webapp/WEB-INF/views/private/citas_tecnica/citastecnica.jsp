<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Citas Técnicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/citastecnica.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>Citas Técnicas</h1>
        <a href="${pageContext.request.contextPath}/citastecnica/agregar" class="btn btn-add">➕ Nueva Cita</a>

        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Cliente</th>
                    <th>Empleado</th>
                    <th>Servicio</th>
                    <th>Estado</th>
                    <th>Fecha Programada</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Juan Pérez</td>
                    <td>Técnico 1</td>
                    <td>Reparación</td>
                    <td>Pendiente</td>
                    <td>2025-10-31</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/citastecnica/editar" class="btn btn-edit">✏️ Editar</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
