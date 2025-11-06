-- ======================================
-- TABLA: Categorias
-- ======================================
CREATE TABLE IF NOT EXISTS Categorias (
    ID_Categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Descripcion TEXT,
    Estado BOOLEAN NOT NULL DEFAULT 1
);

-- ======================================
-- TABLA: Usuario
-- ======================================
CREATE TABLE IF NOT EXISTS Usuario (
    ID_Usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    DNI INTEGER NOT NULL UNIQUE,
    Correo TEXT NOT NULL UNIQUE,
    Contrasena TEXT NOT NULL,
    Tipo_Usuario TEXT NOT NULL CHECK (Tipo_Usuario IN ('cliente', 'empleado')),
    Estado BOOLEAN DEFAULT 1,
    Fecha_Registro TEXT DEFAULT CURRENT_TIMESTAMP,
    Ultimo_Login TEXT
);

-- ======================================
-- TABLA: Cliente
-- ======================================
CREATE TABLE IF NOT EXISTS Cliente (
    ID_Usuario INTEGER PRIMARY KEY,
    Nombre TEXT NOT NULL,
    Apellido TEXT NOT NULL,
    Direccion TEXT,
    Celular TEXT,
    Fecha_Nacimiento TEXT,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario) ON DELETE CASCADE
);

-- ======================================
-- TABLA: Empleado
-- ======================================
CREATE TABLE IF NOT EXISTS Empleado (
    ID_Usuario INTEGER PRIMARY KEY,
    Nombre TEXT NOT NULL,
    Apellido TEXT NOT NULL,
    Direccion TEXT,
    Celular TEXT,
    Cargo TEXT NOT NULL,
    Salario REAL,
    Fecha_Contratacion TEXT NOT NULL,
    Estado_Empleado TEXT DEFAULT 'activo' CHECK (Estado_Empleado IN ('activo', 'inactivo', 'vacaciones')),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario) ON DELETE CASCADE
);

-- ======================================
-- TABLA: Producto
-- ======================================
CREATE TABLE IF NOT EXISTS Producto (
    ID_Producto INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Categoria INTEGER NOT NULL,
    Nombre TEXT NOT NULL,
    Descripcion TEXT,
    Tipo_Producto TEXT,
    Precio REAL NOT NULL,
    Stock INTEGER NOT NULL,
    Estado BOOLEAN DEFAULT 1,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria)
);

-- ======================================
-- TABLA: Ventas
-- ======================================
CREATE TABLE IF NOT EXISTS Ventas (
    ID_Ventas INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Cliente INTEGER NOT NULL,
    ID_Empleado INTEGER NOT NULL,
    Fecha_Venta TEXT DEFAULT CURRENT_TIMESTAMP,
    Metodo_Pago TEXT NOT NULL CHECK (Metodo_Pago IN ('efectivo', 'tarjeta', 'transferencia')),
    Total REAL NOT NULL,
    Estado_Venta TEXT DEFAULT 'completada' CHECK (Estado_Venta IN ('pendiente', 'completada', 'cancelada')),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Usuario),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Usuario)
);

-- ======================================
-- TABLA: DetalleVenta
-- ======================================
CREATE TABLE IF NOT EXISTS DetalleVenta (
    ID_Detalle INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Producto INTEGER NOT NULL,
    ID_Ventas INTEGER NOT NULL,
    Cantidad INTEGER NOT NULL,
    Precio_Unitario REAL NOT NULL,
    Subtotal REAL NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto),
    FOREIGN KEY (ID_Ventas) REFERENCES Ventas(ID_Ventas) ON DELETE CASCADE
);

-- ======================================
-- TABLA: Cita_Tecnica
-- ======================================
CREATE TABLE IF NOT EXISTS Cita_Tecnica (
    ID_CitaTecnica INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_Cliente INTEGER NOT NULL,
    ID_Empleado INTEGER NOT NULL,
    Servicio TEXT NOT NULL,
    Estado TEXT DEFAULT 'pendiente' CHECK (Estado IN ('pendiente', 'confirmada', 'en_proceso', 'completada', 'cancelada')),
    Descripcion TEXT,
    Fecha_Programada TEXT NOT NULL,
    Fecha_Creacion TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Usuario),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleado(ID_Usuario)
);
