<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Techmerch - Editar Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ventas.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>Editar Venta #${venta.idVenta}</h1>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/ventas/actualizar" method="post">
                <input type="hidden" name="idVenta" value="${venta.idVenta}">

                <div class="form-row">
                    <div class="form-group">
                        <label for="idCliente">Cliente *</label>
                        <select class="form-control" id="idCliente" name="idCliente" required>
                            <c:forEach var="cliente" items="${clientes}">
                                <option value="${cliente.idUsuario}"
                                    ${cliente.idUsuario == venta.idCliente ? 'selected' : ''}>
                                    ${cliente.nombre} ${cliente.apellido} - ${cliente.dni}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="idEmpleado">Empleado *</label>
                        <select class="form-control" id="idEmpleado" name="idEmpleado" required>
                            <c:forEach var="empleado" items="${empleados}">
                                <option value="${empleado.idUsuario}"
                                    ${empleado.idUsuario == venta.idEmpleado ? 'selected' : ''}>
                                    ${empleado.nombre} ${empleado.apellido} - ${empleado.cargo}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="metodoPago">Método de Pago *</label>
                        <select class="form-control" id="metodoPago" name="metodoPago" required>
                            <option value="efectivo" ${venta.metodoPago == 'efectivo' ? 'selected' : ''}>Efectivo</option>
                            <option value="tarjeta" ${venta.metodoPago == 'tarjeta' ? 'selected' : ''}>Tarjeta</option>
                            <option value="transferencia" ${venta.metodoPago == 'transferencia' ? 'selected' : ''}>Transferencia</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="estadoVenta">Estado de Venta</label>
                        <select class="form-control" id="estadoVenta" name="estadoVenta">
                            <option value="pendiente" ${venta.estadoVenta == 'pendiente' ? 'selected' : ''}>Pendiente</option>
                            <option value="completada" ${venta.estadoVenta == 'completada' ? 'selected' : ''}>Completada</option>
                            <option value="cancelada" ${venta.estadoVenta == 'cancelada' ? 'selected' : ''}>Cancelada</option>
                        </select>
                    </div>
                </div>

                <!-- Detalles existentes de la venta -->
                <div class="detalles-venta">
                    <h4>Detalles de la Venta</h4>

                    <c:forEach var="detalle" items="${venta.detalles}" varStatus="status">
                        <div class="detalle-item">
                            <span>${detalle.producto.nombre}</span>
                            <span>S/. ${detalle.precioUnitario}</span>
                            <span>${detalle.cantidad}</span>
                            <span>S/. ${detalle.subtotal}</span>
                            <span class="text-muted">(Existente)</span>
                        </div>
                    </c:forEach>

                    <div class="venta-total">
                        Total: S/. ${venta.total}
                    </div>
                </div>

                <div class="form-group" style="margin-top: 2rem;">
                    <button type="submit" class="btn-save">
                        <i class="bi bi-check-circle"></i> Actualizar Venta
                    </button>
                    <a href="${pageContext.request.contextPath}/ventas" class="btn-cancel">
                        <i class="bi bi-x-circle"></i> Cancelar
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>