<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login - TiendaTech</title>
    <link rel="stylesheet" href="css/login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../../layout/navbar.jsp" />

<section class="login-section">
    <div class="login-container">
        <h1>Iniciar Sesión</h1>

        <form class="login-form" action="${pageContext.request.contextPath}/login" method="post">

            <label for="correo">Correo:</label>
            <input type="email" id="correo" name="correo" placeholder="Ingresa tu correo" required>

            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="contrasena" placeholder="Ingresa tu contraseña" required>

            <button type="submit"><i class="bi bi-box-arrow-in-right"></i> Iniciar Sesión</button>
        </form>

        <!-- Mostrar error -->
        <c:if test="${not empty error}">
            <p class="text-danger mt-3">${error}</p>
        </c:if>

</section>

</body>
</html>
