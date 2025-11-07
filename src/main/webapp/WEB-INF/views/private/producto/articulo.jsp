<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <!-- CSS específicos -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/citastecnica.css">
</head>
<body>

<div class="contenedor">
    <%@ include file="../../layout/sidebar.jsp" %>

    <div class="contenido">
        <h1>Gestión de Productos</h1>
        <a href="${pageContext.request.contextPath}/articulo/agregar" class="btn-add">➕ Agregar Producto</a>

        <table class="data-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Categoría</th>
                    <th>Descripción</th>
                    <th>Tipo</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="producto" items="${productos}">
                    <tr>
                        <td>${producto.idProducto}</td>
                        <td>${producto.nombre}</td>
                        <td>${producto.categoriaNombre}</td>
                        <td>${producto.descripcion}</td>
                        <td>${producto.tipoProducto}</td>
                        <td>S/. ${producto.precio}</td>
                        <td>
                            <c:choose>
                                <c:when test="${producto.stock < 10}">
                                    <span class="stock-low">${producto.stock}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="stock-normal">${producto.stock}</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${producto.estado == 1}">

                                    <span class="badge bg-success">Activo</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-secondary">Inactivo</span>
                                </c:otherwise>
                            </c:choose>
                        </td>


                        <td>
                            <a href="${pageContext.request.contextPath}/articulo/editar/${producto.ID_Producto}" class="btn-edit">✏️ Editar</a>
                        </td>
                    </tr>
                </c:forEach>

                <%-- Mensaje si no hay productos --%>
                <c:if test="${empty productos}">
                    <tr>
                        <td colspan="9" style="text-align: center; padding: 2rem;">
                            No hay productos registrados
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
