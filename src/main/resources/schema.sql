-- ======================================
-- TABLA: Categorias
-- ======================================
CREATE TABLE IF NOT EXISTS Categorias (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(35) NOT NULL,
    Descripcion VARCHAR(35),
    Estado BOOLEAN NOT NULL
);

-- ======================================
-- TABLA: Producto
-- ======================================
CREATE TABLE IF NOT EXISTS Producto (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    ID_Categoria INT NOT NULL,
    Nombre VARCHAR(35) NOT NULL,
    Descripcion VARCHAR(35),
    Tipo_Producto VARCHAR(35),
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (ID_Categoria)
        REFERENCES Categorias(ID_Categoria)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- ======================================
-- TABLA: Cliente
-- ======================================
CREATE TABLE IF NOT EXISTS Cliente (
    DNI_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(35) NOT NULL,
    Apellido VARCHAR(35) NOT NULL,
    Direccion VARCHAR(35),
    Correo VARCHAR(35),
    Celular VARCHAR(35)
);

-- ======================================
-- TABLA: Empleado
-- ======================================
CREATE TABLE IF NOT EXISTS Empleado (
    DNI_Empleado INT PRIMARY KEY,
    Nombre VARCHAR(35) NOT NULL,
    Apellido VARCHAR(35) NOT NULL,
    Direccion VARCHAR(35),
    Correo VARCHAR(35),
    Celular VARCHAR(35),
    Cargo VARCHAR(20)
);

-- ======================================
-- TABLA: Ventas
-- ======================================
CREATE TABLE IF NOT EXISTS Ventas (
    ID_Ventas INT AUTO_INCREMENT PRIMARY KEY,
    DNI_Cliente INT NOT NULL,
    DNI_Empleado INT NOT NULL,
    Fecha_Venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Metodo_Pago VARCHAR(20),
    Total DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Ventas_Cliente FOREIGN KEY (DNI_Cliente)
        REFERENCES Cliente(DNI_Cliente),
    CONSTRAINT FK_Ventas_Empleado FOREIGN KEY (DNI_Empleado)
        REFERENCES Empleado(DNI_Empleado)
);

-- ======================================
-- TABLA: DetalleVenta
-- ======================================
CREATE TABLE IF NOT EXISTS DetalleVenta (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT NOT NULL,
    ID_Ventas INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10,2) NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_DetalleVenta_Producto FOREIGN KEY (ID_Producto)
        REFERENCES Producto(ID_Producto),
    CONSTRAINT FK_DetalleVenta_Venta FOREIGN KEY (ID_Ventas)
        REFERENCES Ventas(ID_Ventas)
);

-- ======================================
-- TABLA: Cita_Tecnica
-- ======================================
CREATE TABLE IF NOT EXISTS Cita_Tecnica (
    ID_CitaTecnica INT AUTO_INCREMENT PRIMARY KEY,
    DNI_Cliente INT NOT NULL,
    DNI_Empleado INT NOT NULL,
    Servicio VARCHAR(50),
    Estado VARCHAR(15),
    Descripcion VARCHAR(100),
    Fecha_Programada TIMESTAMP,
    CONSTRAINT FK_Cita_Cliente FOREIGN KEY (DNI_Cliente)
        REFERENCES Cliente(DNI_Cliente),
    CONSTRAINT FK_Cita_Empleado FOREIGN KEY (DNI_Empleado)
        REFERENCES Empleado(DNI_Empleado)
);