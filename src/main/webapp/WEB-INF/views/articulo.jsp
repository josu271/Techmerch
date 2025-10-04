<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/producto.css">
</head>
<body>
<div class="d-flex">
    <%@ include file="layout/sidebar.jsp" %>

    <!-- Contenido principal -->
    <div class="content p-4 w-100">
        <h2 class="mb-4">Gestión de Productos</h2>

        <!-- Tabla de productos -->
        <div class="card shadow-sm">
            <div class="card-body">
                <h5 class="card-title">Lista de Productos</h5>
                <table class="table table-striped">
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
                            <td>101</td>
                            <td>Mouse Gamer</td>
                            <td>Accesorios</td>
                            <td>$25.00</td>
                            <td>15</td>
                            <td>
                                <button class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>
                        <tr>
                            <td>102</td>
                            <td>Teclado Mecánico</td>
                            <td>Accesorios</td>
                            <td>$55.00</td>
                            <td>10</td>
                            <td>
                                <button class="btn btn-sm btn-warning"><i class="bi bi-pencil"></i></button>
                                <button class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Formulario para agregar producto -->
        <div class="card shadow-sm mt-4">
            <div class="card-body">
                <h5 class="card-title">Agregar Producto</h5>
                <form>
                    <div class="mb-3">
                        <label for="nombre" class="form-label">Nombre del Producto</label>
                        <input type="text" id="nombre" class="form-control" placeholder="Ejemplo: Laptop Gamer">
                    </div>
                    <div class="mb-3">
                        <label for="categoria" class="form-label">Categoría</label>
                        <input type="text" id="categoria" class="form-control" placeholder="Ejemplo: Computadoras">
                    </div>
                    <div class="mb-3">
                        <label for="precio" class="form-label">Precio</label>
                        <input type="number" id="precio" class="form-control" step="0.01" placeholder="Ejemplo: 1500.00">
                    </div>
                    <div class="mb-3">
                        <label for="stock" class="form-label">Stock</label>
                        <input type="number" id="stock" class="form-control" placeholder="Ejemplo: 20">
                    </div>
                    <button type="submit" class="btn btn-primary"><i class="bi bi-plus-circle"></i> Agregar</button>
                </form>
            </div>
        </div>

    </div>
</div>
</body>
</html>
