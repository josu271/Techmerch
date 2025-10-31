<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Cita Técnica</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

</head>
<body class="p-4">
    <%@ include file="../../layout/sidebar.jsp" %>


<h2>Nueva Cita Técnica</h2>

<form action="${pageContext.request.contextPath}/citastecnica/agregar" method="post" class="mt-3">

    <div class="mb-3">
        <label>ID Cliente:</label>
        <input type="number" name="idCliente" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>ID Empleado:</label>
        <input type="number" name="idEmpleado" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Servicio:</label>
        <input type="text" name="servicio" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Estado:</label>
        <select name="estado" class="form-select">
            <option value="pendiente">Pendiente</option>
            <option value="confirmada">Confirmada</option>
            <option value="en_proceso">En Proceso</option>
            <option value="completada">Completada</option>
            <option value="cancelada">Cancelada</option>
        </select>
    </div>

    <div class="mb-3">
        <label>Descripción:</label>
        <textarea name="descripcion" class="form-control"></textarea>
    </div>

    <div class="mb-3">
        <label>Fecha Programada:</label>
        <input type="datetime-local" name="fechaProgramada" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-success">Guardar</button>
    <a href="${pageContext.request.contextPath}/citastecnica" class="btn btn-secondary">Cancelar</a>
</form>

</body>
</html>
