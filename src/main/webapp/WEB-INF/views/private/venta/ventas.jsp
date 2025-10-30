<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>TiendaTech - Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/citastecnica.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>Ventas</h1>
        <a href="${pageContext.request.contextPath}/ventas/agregar" class="btn-add">➕ Nueva Venta</a>

        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Cliente</th>
                    <th>Empleado</th>
                    <th>Método de Pago</th>
                    <th>Total</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="v" items="${ventas}">
                    <tr>
                        <td>${v.idVenta}</td>  <!-- Ahora usa idVenta (minúsculas) -->
                        <td>${v.idCliente}</td>
                        <td>${v.idEmpleado}</td>
                        <td>${v.metodoPago}</td>
                        <td>S/. ${v.total}</td>
                        <td>${v.estadoVenta}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/ventas/editar/${v.idVenta}" class="btn-edit">✏️ Editar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>