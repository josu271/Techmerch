<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>PC Gamer</td>
                    <td>Computadora</td>
                    <td>3500.00</td>
                    <td>10</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/articulo/editar" class="btn-edit">✏️ Editar</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
