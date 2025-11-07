<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Techmerch - Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ventas.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>Ventas</h1>
        <a href="${pageContext.request.contextPath}/ventas/agregar" class="btn-add">
            <i class="bi bi-plus-circle"></i> Nueva Venta
        </a>

        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Cliente</th>
                    <th>Empleado</th>
                    <th>Fecha</th>
                    <th>Método de Pago</th>
                    <th>Total</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="v" items="${ventas}">
                    <tr>
                        <td>${v.idVenta}</td>
                        <td>
                            <c:if test="${not empty v.cliente}">
                                ${v.cliente.nombre} ${v.cliente.apellido}
                            </c:if>
                            <c:if test="${empty v.cliente}">
                                Cliente #${v.idCliente}
                            </c:if>
                        </td>
                        <td>
                            <c:if test="${not empty v.empleado}">
                                ${v.empleado.nombre} ${v.empleado.apellido}
                            </c:if>
                            <c:if test="${empty v.empleado}">
                                Empleado #${v.idEmpleado}
                            </c:if>
                        </td>
                        <td>${v.fechaVenta}</td>
                        <td>
                            <c:choose>
                                <c:when test="${v.metodoPago == 'efectivo'}">Efectivo</c:when>
                                <c:when test="${v.metodoPago == 'tarjeta'}">Tarjeta</c:when>
                                <c:when test="${v.metodoPago == 'transferencia'}">Transferencia</c:when>
                                <c:otherwise>${v.metodoPago}</c:otherwise>
                            </c:choose>
                        </td>
                        <td>S/. ${v.total}</td>
                        <td>
                            <c:choose>
                                <c:when test="${v.estadoVenta == 'completada'}">
                                    <span class="estado-completada">Completada</span>
                                </c:when>
                                <c:when test="${v.estadoVenta == 'pendiente'}">
                                    <span class="estado-pendiente">Pendiente</span>
                                </c:when>
                                <c:when test="${v.estadoVenta == 'cancelada'}">
                                    <span class="estado-cancelada">Cancelada</span>
                                </c:when>
                                <c:otherwise>${v.estadoVenta}</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/ventas/editar/${v.idVenta}" class="btn-edit">
                                <i class="bi bi-pencil"></i> Editar
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>