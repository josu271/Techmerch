<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Reportes - TiendaTech</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reporte.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="d-flex">
    <%@ include file="layout/sidebar.jsp" %>

    <!-- Contenido principal -->
    <div class="content p-4 w-100">
        <h2 class="mb-4"><i class="bi bi-bar-chart"></i> Reportes</h2>

        <!-- Resumen rápido -->
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Ventas del Mes</h5>
                        <p class="fs-4 text-primary">$12,540</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Productos Vendidos</h5>
                        <p class="fs-4 text-success">320</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Clientes Nuevos</h5>
                        <p class="fs-4 text-warning">25</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Gráficos -->
        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Ventas Semanales</h5>
                        <canvas id="ventasChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Categorías Más Vendidas</h5>
                        <canvas id="categoriasChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    // Gráfico de ventas
    new Chart(document.getElementById('ventasChart'), {
        type: 'line',
        data: {
            labels: ['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'],
            datasets: [{
                label: 'Ventas ($)',
                data: [1200, 1500, 1000, 1800, 2000, 2200, 1700],
                borderColor: '#1e40af',
                backgroundColor: 'rgba(30, 64, 175, 0.2)',
                fill: true,
                tension: 0.3
            }]
        }
    });

    // Gráfico de categorías
    new Chart(document.getElementById('categoriasChart'), {
        type: 'doughnut',
        data: {
            labels: ['Computadoras', 'Accesorios', 'Celulares', 'Otros'],
            datasets: [{
                data: [40, 30, 20, 10],
                backgroundColor: ['#1e3a8a', '#16a34a', '#f59e0b', '#6b7280']
            }]
        }
    });
</script>
</body>
</html>
