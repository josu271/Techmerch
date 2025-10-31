<form action="${pageContext.request.contextPath}/citastecnica/editar" method="post">
    <input type="hidden" name="idCitaTecnica" value="${cita.idCitaTecnica}">

    <div class="mb-3">
        <label>ID Cliente:</label>
        <input type="number" name="idCliente" value="${cita.idCliente}" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>ID Empleado:</label>
        <input type="number" name="idEmpleado" value="${cita.idEmpleado}" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Servicio:</label>
        <input type="text" name="servicio" value="${cita.servicio}" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Estado:</label>
        <select name="estado" class="form-select">
            <option ${cita.estado == 'pendiente' ? 'selected' : ''}>pendiente</option>
            <option ${cita.estado == 'confirmada' ? 'selected' : ''}>confirmada</option>
            <option ${cita.estado == 'en_proceso' ? 'selected' : ''}>en_proceso</option>
            <option ${cita.estado == 'completada' ? 'selected' : ''}>completada</option>
            <option ${cita.estado == 'cancelada' ? 'selected' : ''}>cancelada</option>
        </select>
    </div>

    <div class="mb-3">
        <label>Descripción:</label>
        <textarea name="descripcion" class="form-control">${cita.descripcion}</textarea>
    </div>

    <div class="mb-3">
        <label>Fecha Programada:</label>
        <input type="datetime-local" name="fechaProgramada" class="form-control"
               value="${cita.fechaProgramada.toLocalDateTime()}">
    </div>

    <button type="submit" class="btn btn-primary">Actualizar</button>
    <a href="${pageContext.request.contextPath}/citastecnica" class="btn btn-secondary">Cancelar</a>
</form>
