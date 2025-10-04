<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Panel Administrativo - TiendaTech</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/panel.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body>
  <div class="contenedor">

    <!-- Incluir la barra lateral -->
    <jsp:include page="layout/sidebar.jsp" />

    <!-- CONTENIDO PRINCIPAL -->
    <main class="contenido">
      <header class="topbar">
        <h1>Panel Administrativo</h1>
        <div class="usuario">
          <i class="bi bi-person-circle"></i> Admin
        </div>
      </header>

      <!-- DASHBOARD -->
      <section class="dashboard">
        <div class="card">
          <h3>Ventas de Hoy</h3>
          <p><span class="dato">$1,250</span></p>
        </div>
        <div class="card">
          <h3>Equipos en Reparación</h3>
          <p><span class="dato">5</span></p>
        </div>
        <div class="card">
          <h3>Próximas Citas</h3>
          <p><span class="dato">3</span></p>
        </div>
      </section>

      <!-- TABLAS DE EJEMPLO -->
      <section class="tablas">
        <h2>Últimas Ventas</h2>
        <table>
          <thead>
            <tr>
              <th>Cliente</th>
              <th>Producto</th>
              <th>Monto</th>
              <th>Fecha</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Juan Pérez</td>
              <td>Laptop Dell</td>
              <td>$899</td>
              <td>13/09/2025</td>
            </tr>
            <tr>
              <td>Ana Gómez</td>
              <td>MacBook Pro</td>
              <td>$1999</td>
              <td>12/09/2025</td>
            </tr>
          </tbody>
        </table>
      </section>

      <section class="tablas">
        <h2>Citas Técnicas</h2>
        <table>
          <thead>
            <tr>
              <th>Cliente</th>
              <th>Equipo</th>
              <th>Problema</th>
              <th>Estado</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Carlos Ruiz</td>
              <td>HP Pavilion</td>
              <td>No enciende</td>
              <td>En Diagnóstico</td>
            </tr>
            <tr>
              <td>María López</td>
              <td>Lenovo ThinkPad</td>
              <td>Pantalla dañada</td>
              <td>Listo para Entrega</td>
            </tr>
          </tbody>
        </table>
      </section>
    </main>
  </div>
</body>
</html>
