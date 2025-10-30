-- ======================================
-- INSERCIONES: Categorias
-- ======================================
INSERT INTO Categorias (Nombre, Descripcion, Estado) VALUES
('Laptops', 'Computadoras portátiles', TRUE),
('Smartphones', 'Teléfonos inteligentes', TRUE),
('Tablets', 'Dispositivos tablet', TRUE),
('Accesorios', 'Accesorios para dispositivos', TRUE),
('Reparación', 'Servicios de reparación', TRUE);

-- ======================================
-- INSERCIONES: Usuario
-- ======================================
INSERT INTO Usuario (DNI, Correo, Contrasena, Tipo_Usuario, Estado) VALUES
(12345678, 'cliente1@email.com', '$2a$10$hashedpassword1', 'cliente', TRUE),
(87654321, 'cliente2@email.com', '$2a$10$hashedpassword2', 'cliente', TRUE),
(11223344, 'sulla@gmail.com', 'sulla123', 'empleado', TRUE),
(44332211, 'flores@gmail.com', 'flores123', 'empleado', TRUE),
(55667788, 'vilcahuaman@gmail.com', 'vilcahuaman123', 'cliente', TRUE);

-- ======================================
-- INSERCIONES: Cliente
-- ======================================
INSERT INTO Cliente (ID_Usuario, Nombre, Apellido, Direccion, Celular, Fecha_Nacimiento) VALUES
(1, 'Juan', 'Pérez', 'Av. Principal 123', '999888777', '1990-05-15'),
(2, 'María', 'Gómez', 'Calle Secundaria 456', '999777666', '1985-08-20'),
(5, 'Carlos', 'López', 'Jr. Los Olivos 789', '999666555', '1992-12-10');

-- ======================================
-- INSERCIONES: Empleado
-- ======================================
INSERT INTO Empleado (ID_Usuario, Nombre, Apellido, Direccion, Celular, Cargo, Salario, Fecha_Contratacion, Estado_Empleado) VALUES
(3, 'Roberto', 'Silva', 'Av. Trabajador 321', '999555444', 'Vendedor', 2500.00, '2023-01-15', 'activo'),
(4, 'Ana', 'Torres', 'Calle Empleado 654', '999444333', 'Técnico', 2800.00, '2022-06-01', 'activo');

-- ======================================
-- INSERCIONES: Producto
-- ======================================
INSERT INTO Producto (ID_Categoria, Nombre, Descripcion, Tipo_Producto, Precio, Stock, Estado) VALUES
(1, 'Laptop HP Pavilion', 'Laptop 15.6 pulgadas, 8GB RAM', 'Laptop', 899.99, 10, TRUE),
(1, 'Laptop Dell Inspiron', 'Laptop 14 pulgadas, 16GB RAM', 'Laptop', 1099.99, 8, TRUE),
(2, 'Samsung Galaxy S23', 'Smartphone Android 128GB', 'Smartphone', 799.99, 15, TRUE),
(2, 'iPhone 14', 'Smartphone Apple 128GB', 'Smartphone', 999.99, 12, TRUE),
(4, 'Mouse Inalámbrico', 'Mouse ergonómico inalámbrico', 'Accesorio', 29.99, 50, TRUE),
(4, 'Teclado Mecánico', 'Teclado gaming mecánico RGB', 'Accesorio', 89.99, 20, TRUE);

-- ======================================
-- INSERCIONES: Ventas
-- ======================================
INSERT INTO Ventas (ID_Cliente, ID_Empleado, Metodo_Pago, Total, Estado_Venta) VALUES
(1, 3, 'tarjeta', 929.98, 'completada'),
(2, 3, 'efectivo', 89.99, 'completada'),
(5, 4, 'transferencia', 1799.98, 'completada');

-- ======================================
-- INSERCIONES: DetalleVenta
-- ======================================
INSERT INTO DetalleVenta (ID_Producto, ID_Ventas, Cantidad, Precio_Unitario, Subtotal) VALUES
(3, 1, 1, 799.99, 799.99),
(5, 1, 1, 29.99, 29.99),
(6, 2, 1, 89.99, 89.99),
(1, 3, 2, 899.99, 1799.98);

-- ======================================
-- INSERCIONES: Cita_Tecnica
-- ======================================
INSERT INTO Cita_Tecnica (ID_Cliente, ID_Empleado, Servicio, Estado, Descripcion, Fecha_Programada) VALUES
(1, 4, 'Reparación de pantalla', 'pendiente', 'Pantalla rota, necesita reemplazo', '2024-01-15 10:00:00'),
(2, 4, 'Mantenimiento preventivo', 'confirmada', 'Limpieza interna y actualización de software', '2024-01-16 14:30:00'),
(5, 4, 'Instalación de software', 'completada', 'Instalación de Windows y Office', '2024-01-10 09:00:00');