<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Techmerch - Nueva Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ventas.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>Nueva Venta</h1>

        <!-- Mostrar mensaje de error si no hay productos -->
        <c:if test="${empty productos}">
            <div class="alert alert-warning">
                No hay productos disponibles en stock.
                <a href="${pageContext.request.contextPath}/productos/agregar" class="alert-link">
                    Agregar productos
                </a>
            </div>
        </c:if>

        <c:if test="${not empty productos}">
            <div class="form-container">
                <form action="${pageContext.request.contextPath}/ventas/guardar" method="post">

                    <!-- Información básica de la venta -->
                    <div class="form-section">
                        <h4>Información de la Venta</h4>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="idCliente">Cliente *</label>
                                <select class="form-control" id="idCliente" name="idCliente" required>
                                    <option value="">Seleccionar cliente</option>
                                    <c:forEach var="cliente" items="${clientes}">
                                        <option value="${cliente.idUsuario}">
                                            ${cliente.nombre} ${cliente.apellido} - ${cliente.dni}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="idEmpleado">Empleado *</label>
                                <select class="form-control" id="idEmpleado" name="idEmpleado" required>
                                    <option value="">Seleccionar empleado</option>
                                    <c:forEach var="empleado" items="${empleados}">
                                        <option value="${empleado.idUsuario}">
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
                                    <option value="">Seleccionar método</option>
                                    <option value="efectivo">Efectivo</option>
                                    <option value="tarjeta">Tarjeta</option>
                                    <option value="transferencia">Transferencia</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="estadoVenta">Estado de Venta</label>
                                <select class="form-control" id="estadoVenta" name="estadoVenta">
                                    <option value="pendiente">Pendiente</option>
                                    <option value="completada" selected>Completada</option>
                                    <option value="cancelada">Cancelada</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Selección de productos con búsqueda simple -->
                    <div class="form-section">
                        <h4>Selección de Productos</h4>

                        <!-- Filtro de búsqueda -->
                        <div class="form-group">
                            <label for="filtroProducto">Buscar Producto</label>
                            <input type="text" id="filtroProducto" class="form-control"
                                   placeholder="Escriba para filtrar productos..."
                                   onkeyup="filtrarProductos()">
                        </div>

                        <!-- Lista de productos filtrados -->
                        <div class="productos-lista">
                            <table class="data-table" id="tablaProductos">
                                <thead>
                                    <tr>
                                        <th>Seleccionar</th>
                                        <th>Producto</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Stock</th>
                                        <th>Cantidad</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="producto" items="${productos}">
                                        <c:if test="${producto.stock > 0}">
                                            <tr class="producto-item" data-nombre="${producto.nombre.toLowerCase()}">
                                                <td>
                                                    <input type="checkbox" name="productosSeleccionados"
                                                           value="${producto.idProducto}"
                                                           class="producto-checkbox">
                                                </td>
                                                <td>${producto.nombre}</td>
                                                <td>${producto.descripcion}</td>
                                                <td>S/. ${producto.precio}</td>
                                                <td>
                                                    <span class="text-success">${producto.stock}</span>
                                                </td>
                                                <td>
                                                    <input type="number"
                                                           name="cantidad_${producto.idProducto}"
                                                           min="1"
                                                           max="${producto.stock}"
                                                           value="1"
                                                           class="form-control cantidad-input">
                                                </td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Resumen de productos seleccionados -->
                        <div class="resumen-productos mt-4">
                            <h5>Resumen de Productos Seleccionados</h5>
                            <div id="resumenSeleccionados" class="resumen-lista">
                                <p class="text-muted">No hay productos seleccionados</p>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-save">
                            <i class="bi bi-check-circle"></i> Registrar Venta
                        </button>
                        <a href="${pageContext.request.contextPath}/ventas" class="btn-cancel">
                            <i class="bi bi-x-circle"></i> Cancelar
                        </a>
                    </div>
                </form>
            </div>
        </c:if>
    </div>
</div>

</body>
</html>