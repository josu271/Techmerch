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
        <!-- solo frontend, redirige directo al panel -->
        <form class="login-form" action="${pageContext.request.contextPath}/panel" method="get">

            <label for="usuario">Usuario:</label>
            <input type="text" id="usuario" name="usuario" placeholder="Ingresa tu usuario" required>

            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" placeholder="Ingresa tu contraseña" required>

            <button type="submit"><i class="bi bi-box-arrow-in-right"></i> Iniciar Sesión</button>
        </form>
        <p class="registro-texto">¿No tienes cuenta? <a href="registro.jsp">Regístrate aquí</a></p>
    </div>
</section>

</body>
</html>
