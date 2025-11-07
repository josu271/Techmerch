<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Cita Técnica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/citastecn.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1><i class="bi bi-plus-circle me-2"></i>Nueva Cita Técnica</h1>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/citastecnica/agregar" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">ID Cliente:</label>
                        <input type="number" name="idCliente" class="form-control" required min="1">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">ID Empleado:</label>
                        <input type="number" name="idEmpleado" class="form-control" required min="1">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Servicio:</label>
                    <input type="text" name="servicio" class="form-control" required>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Estado:</label>
                        <select name="estado" class="form-select">
                            <option value="pendiente">Pendiente</option>
                            <option value="confirmada">Confirmada</option>
                            <option value="en_proceso">En Proceso</option>
                            <option value="completada">Completada</option>
                            <option value="cancelada">Cancelada</option>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Fecha Programada:</label>
                        <input type="datetime-local" name="fechaProgramada" class="form-control" required>
                    </div>
                </div>

                <div class="mb-4">
                    <label class="form-label">Descripción:</label>
                    <textarea name="descripcion" class="form-control" rows="4"></textarea>
                </div>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-success">
                        <i class="bi bi-check-circle me-2"></i> Guardar
                    </button>
                    <a href="${pageContext.request.contextPath}/citastecnica" class="btn btn-secondary">
                        <i class="bi bi-x-circle me-2"></i> Cancelar
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>