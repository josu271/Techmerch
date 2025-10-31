<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <a href="${pageContext.request.contextPath}/citastecnica/agregar" class="btn btn-primary mb-3">
            <i class="bi bi-plus-circle"></i> Nueva Cita
        </a>

        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
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
                    <c:choose>
                        <c:when test="${empty citas}">
                            <tr>
                                <td colspan="7" class="text-center text-muted py-4">
                                    <i class="bi bi-inbox"></i> No hay citas técnicas registradas
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="cita" items="${citas}">
                                <tr>
                                    <td>${cita.idCitaTecnica}</td>
                                    <td>${cita.nombreCliente}</td>
                                    <td>${cita.nombreEmpleado}</td>
                                    <td>${cita.servicio}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${cita.estado == 'pendiente'}">
                                                <span class="badge bg-warning">Pendiente</span>
                                            </c:when>
                                            <c:when test="${cita.estado == 'confirmada'}">
                                                <span class="badge bg-primary">Confirmada</span>
                                            </c:when>
                                            <c:when test="${cita.estado == 'en_proceso'}">
                                                <span class="badge bg-info">En Proceso</span>
                                            </c:when>
                                            <c:when test="${cita.estado == 'completada'}">
                                                <span class="badge bg-success">Completada</span>
                                            </c:when>
                                            <c:when test="${cita.estado == 'cancelada'}">
                                                <span class="badge bg-danger">Cancelada</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">${cita.estado}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${cita.fechaProgramada}" pattern="dd/MM/yyyy HH:mm"/>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <a href="${pageContext.request.contextPath}/citastecnica/editar/${cita.idCitaTecnica}"
                                               class="btn btn-warning btn-sm">
                                                <i class="bi bi-pencil"></i> Editar
                                            </a>
                                            <a href="${pageContext.request.contextPath}/citastecnica/eliminar/${cita.idCitaTecnica}"
                                               class="btn btn-danger btn-sm"
                                               onclick="return confirm('¿Está seguro de eliminar esta cita?')">
                                                <i class="bi bi-trash"></i> Eliminar
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>