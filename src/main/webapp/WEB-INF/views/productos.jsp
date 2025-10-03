<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Productos - Techmerch</title>
  <link rel="stylesheet" href="<c:url value='/Css/Productos.css' />">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body>

  <%@ include file="layout/navbar.jsp" %>

  <section class="productos">
    <h1>Nuestros Productos</h1>
    <p>Explora nuestra selección de equipos de última generación</p>

    <div class="grid-productos">
      <!-- Producto 1 -->
      <div class="tarjeta-producto">
        <img src="<c:url value='/img/MacBook Pro 16M3 Max.jpg' />" alt="MacBook Pro">
        <h3>MacBook Pro 16” M3 Max</h3>
        <p class="marca">Apple</p>
        <p class="precio">$2499</p>
        <button class="btn-primario">Añadir al Carrito</button>
      </div>

      <!-- Producto 2 -->
      <div class="tarjeta-producto">
        <img src="<c:url value='/img/ASUS ROG Strix G15 Gaming.jpg' />" alt="ASUS ROG">
        <h3>ASUS ROG Strix G15</h3>
        <p class="marca">ASUS</p>
        <p class="precio">$1799</p>
        <button class="btn-primario">Añadir al Carrito</button>
      </div>

      <!-- Producto 3 -->
      <div class="tarjeta-producto">
        <img src="<c:url value='/img/Dell XPS 15 OLED.jpg' />" alt="Dell XPS">
        <h3>Dell XPS 15 OLED</h3>
        <p class="marca">Dell</p>
        <p class="precio">$1599</p>
        <button class="btn-primario">Añadir al Carrito</button>
      </div>

      <!-- Producto 4 -->
      <div class="tarjeta-producto">
        <img src="<c:url value='/img/Custom Gaming Desktop RTX 4080.jpg' />" alt="PC Gamer">
        <h3>Custom Gaming RTX 4080</h3>
        <p class="marca">Custom</p>
        <p class="precio">$2999</p>
        <button class="btn-primario">Añadir al Carrito</button>
      </div>
    </div>
  </section>


</body>
</html>
