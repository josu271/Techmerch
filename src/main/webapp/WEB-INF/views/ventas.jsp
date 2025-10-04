<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Ventas</title>
    <link rel="stylesheet" href="css/panel.css">
    <link rel="stylesheet" href="css/sidebars.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="css/ventas.css">
</head>
<body>

<div class="contenedor">

    <%-- Sidebar --%>
    <jsp:include page="layout/sidebar.jsp" />

    <%-- Contenido principal --%>
    <main class="contenido">
        <div class="topbar">
            <h2>Gestión de Ventas</h2>
            <div class="usuario">
                <i class="bi bi-person-circle"></i> Admin
            </div>
        </div>

        <!-- FORMULARIO DE VENTA -->
        <section class="form-venta">
            <h3>Registrar Venta</h3>
            <form>
                <div class="form-grid">
                    <div>
                        <label for="cliente">Cliente:</label>
                        <input type="text" id="cliente" name="cliente" required>
                    </div>
                    <div>
                        <label for="producto">Producto:</label>
                        <input type="text" id="producto" name="producto" required>
                    </div>
                    <div>
                        <label for="cantidad">Cantidad:</label>
                        <input type="number" id="cantidad" name="cantidad" required>
                    </div>
                    <div>
                        <label for="precio">Precio Unitario:</label>
                        <input type="number" id="precio" name="precio" step="0.01" required>
                    </div>
                </div>
                <button type="submit" class="btn-registrar">
                    <i class="bi bi-cart-plus"></i> Registrar Venta
                </button>
            </form>
        </section>

        <!-- TABLA DE VENTAS -->
        <section class="tablas">
            <h3>Lista de Ventas</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Cliente</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio Unit.</th>
                        <th>Total</th>
                        <th>Fecha</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>101</td>
                        <td>Juan Pérez</td>
                        <td>Laptop Acer</td>
                        <td>1</td>
                        <td>$1200</td>
                        <td>$1200</td>
                        <td>2025-10-04</td>
                        <td>
                            <button class="btn-editar"><i class="bi bi-pencil-square"></i></button>
                            <button class="btn-eliminar"><i class="bi bi-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>102</td>
                        <td>Ana Torres</td>
                        <td>Mouse Logitech</td>
                        <td>2</td>
                        <td>$25</td>
                        <td>$50</td>
                        <td>2025-10-04</td>
                        <td>
                            <button class="btn-editar"><i class="bi bi-pencil-square"></i></button>
                            <button class="btn-eliminar"><i class="bi bi-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>
</div>

</body>
</html>
