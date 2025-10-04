<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>TecMerch</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">

    <!-- ICONOS (ejemplo con FontAwesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<aside class="sidebar">
  <div class="logo">
    <i class="bi bi-laptop"></i>
    <span>TiendaTech</span>
  </div>
  <nav>
<a href="${pageContext.request.contextPath}/ventas"><i class="bi bi-cart"></i> Ventas</a>
<a href="${pageContext.request.contextPath}/articulo"><i class="bi bi-box-seam"></i> Productos</a>
    <a href="#"><i class="bi bi-bar-chart"></i> Reportes</a>
    <a href="#"><i class="bi bi-tools"></i> Citas Técnicas</a>
    <a href="#"><i class="bi bi-calendar-event"></i> Calendario</a>
    <a href="#"><i class="bi bi-people"></i> Clientes</a>
  </nav>
</aside>
