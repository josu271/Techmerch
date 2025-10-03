<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>TecMerch</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

    <!-- ICONOS (ejemplo con FontAwesome) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<header class="barra-navegacion">
    <div class="logo">
        <i class="fa-solid fa-laptop"></i> TecMerch
    </div>

    <div class="barra-busqueda">
        <input type="text" placeholder="Buscar productos...">
    </div>

    <nav>
        <a href="${pageContext.request.contextPath}/">Inicio</a>
        <a href="${pageContext.request.contextPath}/productos">Productos</a>
        <a href="${pageContext.request.contextPath}/contacto">Contacto</a>
        <a href="${pageContext.request.contextPath}/serviciotecnico">Servicio Tecnico</a>
        <a href="${pageContext.request.contextPath}/login">Login</a>
        <i class="fa-solid fa-cart-shopping"></i>
    </nav>
</header>
