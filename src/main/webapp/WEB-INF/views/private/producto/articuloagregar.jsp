<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>TiendaTech - Agregar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/citastecnica.css">
</head>
<body>

<div class="contenedor">
    <%-- ✅ Incluye el sidebar desde la carpeta layout --%>
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido p-4">
        <h2 class="mb-4">Agregar Nuevo Producto</h2>

        <%-- ✅ Formulario HTML clásico, compatible con Spring Boot y JdbcTemplate --%>
        <form action="${pageContext.request.contextPath}/articulo/guardar" method="POST">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre del Producto:</label>
                <input type="text" id="nombre" name="nombre" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción:</label>
                <textarea id="descripcion" name="descripcion" class="form-control" rows="3"></textarea>
            </div>

            <div class="mb-3">
                <label for="idCategoria" class="form-label">Categoría:</label>
                <select id="idCategoria" name="idCategoria" class="form-select" required>
                    <option value="">Seleccione una categoría</option>
                    <c:forEach var="categoria" items="${categorias}">
                        <option value="${categoria.ID_Categoria}">${categoria.Nombre}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="tipoProducto" class="form-label">Tipo de Producto:</label>
                <input type="text" id="tipoProducto" name="tipoProducto" class="form-control">
            </div>

            <div class="mb-3">
                <label for="precio" class="form-label">Precio:</label>
                <input type="number" id="precio" name="precio" class="form-control" step="0.01" min="0" required>
            </div>

            <div class="mb-3">
                <label for="stock" class="form-label">Stock:</label>
                <input type="number" id="stock" name="stock" class="form-control" min="0" required>
            </div>

            <div class="mt-4">
                <button type="submit" class="btn btn-success">
                    <i class="bi bi-save"></i> Guardar Producto
                </button>
                <a href="${pageContext.request.contextPath}/articulo" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Cancelar
                </a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
