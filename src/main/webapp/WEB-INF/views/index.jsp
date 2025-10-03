<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/Css/main.css' />">

<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TiendaTech</title>
  <!-- CSS principal -->
  <link rel="stylesheet" href="<c:url value='/Css/main.css' />">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body>

  <%@ include file="layout/navbar.jsp" %>

  <!-- HERO -->
  <section class="hero">
    <h1>Las mejores computadoras <br> <span class="resaltado">a los mejores precios</span></h1>
    <p>Encuentra laptops, desktops y accesorios de las mejores marcas</p>
    <div class="botones-hero">
      <a href="<c:url value='/productos' />" class="btn-primario">Ver Productos</a>
      <button class="btn-oferta">Ofertas Especiales</button>
    </div>

  </section>

  <!-- BENEFICIOS -->
  <section class="beneficios">
    <div class="beneficio">
      <i class="bi bi-truck"></i>
      <h3>Envío Gratis</h3>
      <p>En compras mayores a $50</p>
    </div>
    <div class="beneficio">
      <i class="bi bi-shield-check"></i>
      <h3>Garantía</h3>
      <p>Hasta 3 años de garantía</p>
    </div>
    <div class="beneficio">
      <i class="bi bi-headset"></i>
      <h3>Soporte 24/7</h3>
      <p>Asistencia técnica siempre</p>
    </div>
    <div class="beneficio">
      <i class="bi bi-credit-card"></i>
      <h3>Financiamiento</h3>
      <p>Hasta 24 meses sin intereses</p>
    </div>
  </section>

  <!-- CATEGORÍAS -->
  <section class="categorias">
    <h2>Explora por Categorías</h2>
    <div class="grid-categorias">
      <div class="tarjeta-categoria">
        <img src="<c:url value='/img/MacBook Pro 16M3 Max.jpg' />" alt="Laptops">
        <span>Laptops</span>
      </div>
      <div class="tarjeta-categoria">
        <img src="<c:url value='/img/ASUS ROG Strix G15 Gaming.jpg' />" alt="Gaming">
        <span>Gaming</span>
      </div>
      <div class="tarjeta-categoria">
        <img src="<c:url value='/img/Custom Gaming Desktop RTX 4080.jpg' />" alt="Escritorios">
        <span>Escritorios</span>
      </div>
      <div class="tarjeta-categoria">
        <img src="<c:url value='/img/Dell XPS 15 OLED.jpg' />" alt="Accesorios">
        <span>Accesorios</span>
      </div>
    </div>
  </section>

  <!-- PRODUCTOS DESTACADOS -->
  <section class="destacados">
    <h2>Productos Destacados</h2>
    <p>Los equipos más populares y mejor valorados</p>
    <div class="grid-productos">
      <div class="tarjeta-producto">
        <div class="etiqueta">Oferta</div>
        <img src="<c:url value='/img/MacBook Pro 16M3 Max.jpg' />" alt="MacBook Pro">
        <h3>MacBook Pro 16” M3 Max</h3>
        <p class="marca">Apple</p>
        <p class="precio">$2499 <span class="precio-anterior">$2899</span></p>
        <div class="acciones-producto">
          <button class="btn-secundario">Detalles</button>
          <button class="btn-primario">Añadir</button>
        </div>
      </div>
      <!-- ... repite tus demás productos -->
    </div>
    <button class="btn-ver-todo">Ver Todos los Productos</button>
  </section>

  <!-- SUSCRIPCIÓN -->
  <section class="suscripcion">
    <h2>¡Mantente Actualizado!</h2>
    <p>Recibe ofertas exclusivas y las últimas noticias tecnológicas</p>
    <div class="form-suscripcion">
      <input type="email" placeholder="Tu correo">
      <button onclick="location.href='<c:url value='/productos' />'" class="btn-ver-todo">
        Ver Todos los Productos
      </button>

    </div>
  </section>

</body>
</html>
