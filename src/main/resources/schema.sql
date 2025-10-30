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
-- TABLA: Usuario
-- ======================================
CREATE TABLE IF NOT EXISTS Usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    DNI INT NOT NULL UNIQUE,
    Correo VARCHAR(100) NOT NULL UNIQUE,
    Contrasena VARCHAR(255) NOT NULL,
    Tipo_Usuario VARCHAR(10) NOT NULL CHECK (Tipo_Usuario IN ('cliente', 'empleado')),
    Estado BOOLEAN DEFAULT TRUE,
    Fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Ultimo_Login TIMESTAMP
);

-- ======================================
-- TABLA: Cliente
-- ======================================
CREATE TABLE IF NOT EXISTS Cliente (
    ID_Usuario INT PRIMARY KEY,
    Nombre VARCHAR(35) NOT NULL,
    Apellido VARCHAR(35) NOT NULL,
    Direccion VARCHAR(100),
    Celular VARCHAR(20),
    Fecha_Nacimiento DATE,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario) ON DELETE CASCADE
);

-- ======================================
-- TABLA: Empleado
-- ======================================
CREATE TABLE IF NOT EXISTS Empleado (
    ID_Usuario INT PRIMARY KEY,
    Nombre VARCHAR(35) NOT NULL,
    Apellido VARCHAR(35) NOT NULL,
    Direccion VARCHAR(100),
    Celular VARCHAR(20),
    Cargo VARCHAR(30) NOT NULL,
    Salario DECIMAL(10,2),
    Fecha_Contratacion DATE NOT NULL,
    Estado_Empleado VARCHAR(10) DEFAULT 'activo' CHECK (Estado_Empleado IN ('activo', 'inactivo', 'vacaciones')),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario) ON DELETE CASCADE
);

-- ======================================
-- TABLA: Producto
-- ======================================
CREATE TABLE IF NOT EXISTS Producto (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    ID_Categoria INT NOT NULL,
    Nombre VARCHAR(35) NOT NULL,
    Descripcion TEXT,
    Tipo_Producto VARCHAR(35),
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    Estado BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria)
);

-- ======================================
-- TABLA: Ventas
-- ======================================
CREATE TABLE IF NOT EXISTS Ventas (
    ID_Ventas INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Empleado INT NOT NULL,
    Fecha_Venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Metodo_Pago VARCHAR(20) NOT NULL CHECK (Metodo_Pago IN ('efectivo', 'tarjeta', 'transferencia')),
    Total DECIMAL(10,2) NOT NULL,
    Estado_Venta VARCHAR(15) DEFAULT 'completada' CHECK (Estado_Venta IN ('pendiente', 'completada', 'cancelada')),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Usuario),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Usuario)
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
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto),
    FOREIGN KEY (ID_Ventas) REFERENCES Ventas(ID_Ventas) ON DELETE CASCADE
);

-- ======================================
-- TABLA: Cita_Tecnica
-- ======================================
CREATE TABLE IF NOT EXISTS Cita_Tecnica (
    ID_CitaTecnica INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Empleado INT NOT NULL,
    Servicio VARCHAR(50) NOT NULL,
    Estado VARCHAR(15) DEFAULT 'pendiente' CHECK (Estado IN ('pendiente', 'confirmada', 'en_proceso', 'completada', 'cancelada')),
    Descripcion TEXT,
    Fecha_Programada TIMESTAMP NOT NULL,
    Fecha_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Usuario),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Usuario)
);