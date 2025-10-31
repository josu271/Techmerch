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
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>Agregar Nuevo Producto</h1>

        <form action="${pageContext.request.contextPath}/api/productos" method="POST" class="product-form">
            <div class="form-group">
                <label for="nombre">Nombre del Producto:</label>
                <input type="text" id="nombre" name="nombre" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" class="form-control" rows="3"></textarea>
            </div>

            <div class="form-group">
                <label for="idCategoria">Categoría:</label>
                <select id="idCategoria" name="idCategoria" class="form-control" required>
                    <option value="">Seleccione una categoría</option>
                    <c:forEach var="categoria" items="${categorias}">
                        <option value="${categoria.ID_Categoria}">${categoria.Nombre}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="tipoProducto">Tipo de Producto:</label>
                <input type="text" id="tipoProducto" name="tipoProducto" class="form-control">
            </div>

            <div class="form-group">
                <label for="precio">Precio:</label>
                <input type="number" id="precio" name="precio" class="form-control" step="0.01" min="0" required>
            </div>

            <div class="form-group">
                <label for="stock">Stock:</label>
                <input type="number" id="stock" name="stock" class="form-control" min="0" required>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-success">Guardar Producto</button>
                <a href="${pageContext.request.contextPath}/productos" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>