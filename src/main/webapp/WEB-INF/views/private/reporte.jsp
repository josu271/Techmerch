<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reportes - TiendaTech</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">

</head>
<body class="bg-light">
<div class="contenedor">
<%@ include file="../layout/sidebar.jsp" %>

<div class="container py-4">
    <h2 class="mb-4 text-center"><i class="bi bi-bar-chart"></i> Reportes de Ventas</h2>

    <div class="row">
        <!-- 📊 Ventas por producto -->
        <div class="col-md-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Ventas por Producto (Top 10)</h5>
                    <canvas id="productoChart"></canvas>
                </div>
            </div>
        </div>

        <!-- 📈 Ventas diarias -->
        <div class="col-md-6 mb-4">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title">Evolución de Ventas Diarias</h5>
                    <canvas id="lineChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- 🍩 Top productos por categoría -->
    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <h5 class="card-title">Top 10 Productos por Categoría</h5>
            <canvas id="categoriaChart"></canvas>
        </div>
    </div>
</div>

<script>
    // 📊 Ventas por producto
    const productos = [<c:forEach var="r" items="${ventasPorProducto}">"${r.nombre}",</c:forEach>];
    const totales = [<c:forEach var="r" items="${ventasPorProducto}">${r.total},</c:forEach>];

    new Chart(document.getElementById('productoChart'), {
        type: 'bar',
        data: {
            labels: productos,
            datasets: [{
                label: 'Ventas ($)',
                data: totales,
                backgroundColor: '#2563eb'
            }]
        }
    });

    // 📈 Ventas semanales
    const fechas = [<c:forEach var="r" items="${ventasSemanales}">"${r.fecha}",</c:forEach>];
    const montos = [<c:forEach var="r" items="${ventasSemanales}">${r.total},</c:forEach>];

    new Chart(document.getElementById('lineChart'), {
        type: 'line',
        data: {
            labels: fechas,
            datasets: [{
                label: 'Total de Ventas ($)',
                data: montos,
                borderColor: '#16a34a',
                fill: true,
                tension: 0.3
            }]
        }
    });

    // 🍩 Top por categoría
    const categorias = [<c:forEach var="r" items="${topPorCategoria}">"${r.producto}",</c:forEach>];
    const cantidades = [<c:forEach var="r" items="${topPorCategoria}">${r.total},</c:forEach>];

    new Chart(document.getElementById('categoriaChart'), {
        type: 'doughnut',
        data: {
            labels: categorias,
            datasets: [{
                data: cantidades,
                backgroundColor: ['#2563eb','#16a34a','#f59e0b','#dc2626','#9333ea','#0891b2']
            }]
        }
    });
</script>
<div
</body>
</html>
