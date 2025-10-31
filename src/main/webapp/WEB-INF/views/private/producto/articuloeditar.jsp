<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>TiendaTech - Editar Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/citastecnica.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>Editar Producto</h1>

        <form action="${pageContext.request.contextPath}/api/productos/${producto.ID_Producto}" method="POST" class="product-form">
            <input type="hidden" name="_method" value="PUT">

            <div class="form-group">
                <label for="nombre">Nombre del Producto:</label>
                <input type="text" id="nombre" name="nombre" class="form-control"
                       value="${producto.Nombre}" required>
            </div>

            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" class="form-control" rows="3">${producto.Descripcion}</textarea>
            </div>

            <div class="form-group">
                <label for="idCategoria">Categoría:</label>
                <select id="idCategoria" name="idCategoria" class="form-control" required>
                    <option value="">Seleccione una categoría</option>
                    <c:forEach var="categoria" items="${categorias}">
                        <option value="${categoria.ID_Categoria}"
                                ${categoria.ID_Categoria == producto.ID_Categoria ? 'selected' : ''}>
                            ${categoria.Nombre}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <label for="tipoProducto">Tipo de Producto:</label>
                <input type="text" id="tipoProducto" name="tipoProducto" class="form-control"
                       value="${producto.Tipo_Producto}">
            </div>

            <div class="form-group">
                <label for="precio">Precio:</label>
                <input type="number" id="precio" name="precio" class="form-control"
                       value="${producto.Precio}" step="0.01" min="0" required>
            </div>

            <div class="form-group">
                <label for="stock">Stock:</label>
                <input type="number" id="stock" name="stock" class="form-control"
                       value="${producto.Stock}" min="0" required>
            </div>

            <div class="form-group">
                <label for="estado">Estado:</label>
                <select id="estado" name="estado" class="form-control">
                    <option value="true" ${producto.Estado ? 'selected' : ''}>Activo</option>
                    <option value="false" ${!producto.Estado ? 'selected' : ''}>Inactivo</option>
                </select>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">Actualizar Producto</button>
                <a href="${pageContext.request.contextPath}/productos" class="btn btn-secondary">Cancelar</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>