package com.example.Techmerch.venta;

import com.example.Techmerch.cliente.Cliente;
import com.example.Techmerch.empleado.Empleado;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Repository
public class VentaDAOImpl implements VentaDAO {

    private final JdbcTemplate jdbcTemplate;

    public VentaDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Venta> listarVentas() {
        String sql = """
            SELECT v.ID_Ventas, v.ID_Cliente, v.ID_Empleado, v.Fecha_Venta, 
                   v.Metodo_Pago, v.Total, v.Estado_Venta,
                   c.Nombre as cliente_nombre, c.Apellido as cliente_apellido, u1.DNI as cliente_dni,
                   e.Nombre as empleado_nombre, e.Apellido as empleado_apellido, e.Cargo as empleado_cargo, u2.DNI as empleado_dni
            FROM Ventas v
            LEFT JOIN Cliente c ON v.ID_Cliente = c.ID_Usuario
            LEFT JOIN Usuario u1 ON c.ID_Usuario = u1.ID_Usuario
            LEFT JOIN Empleado e ON v.ID_Empleado = e.ID_Usuario
            LEFT JOIN Usuario u2 ON e.ID_Usuario = u2.ID_Usuario
            ORDER BY v.Fecha_Venta DESC
            """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> {
            Venta venta = new Venta();
            venta.setIdVenta(rs.getInt("ID_Ventas"));
            venta.setIdCliente(rs.getInt("ID_Cliente"));
            venta.setIdEmpleado(rs.getInt("ID_Empleado"));

            // Manejar la fecha correctamente para SQLite
            String fechaStr = rs.getString("Fecha_Venta");
            LocalDateTime fechaVenta = parseFechaSQLite(fechaStr);
            venta.setFechaVenta(fechaVenta);

            venta.setMetodoPago(rs.getString("Metodo_Pago"));
            venta.setTotal(rs.getDouble("Total"));
            venta.setEstadoVenta(rs.getString("Estado_Venta"));

            // Crear y asignar objeto Cliente
            Cliente cliente = new Cliente(
                    rs.getInt("ID_Cliente"),
                    rs.getString("cliente_nombre"),
                    rs.getString("cliente_apellido"),
                    null, null, null,
                    rs.getInt("cliente_dni")
            );
            venta.setCliente(cliente);

            // Crear y asignar objeto Empleado
            Empleado empleado = new Empleado(
                    rs.getInt("ID_Empleado"),
                    rs.getString("empleado_nombre"),
                    rs.getString("empleado_apellido"),
                    null, null,
                    rs.getString("empleado_cargo"),
                    null, null, null
            );
            venta.setEmpleado(empleado);

            return venta;
        });
    }

    @Override
    public Venta obtenerVentaPorId(int id) {
        String sql = """
            SELECT v.ID_Ventas, v.ID_Cliente, v.ID_Empleado, v.Fecha_Venta, 
                   v.Metodo_Pago, v.Total, v.Estado_Venta,
                   c.Nombre as cliente_nombre, c.Apellido as cliente_apellido, u1.DNI as cliente_dni,
                   e.Nombre as empleado_nombre, e.Apellido as empleado_apellido, e.Cargo as empleado_cargo, u2.DNI as empleado_dni
            FROM Ventas v
            LEFT JOIN Cliente c ON v.ID_Cliente = c.ID_Usuario
            LEFT JOIN Usuario u1 ON c.ID_Usuario = u1.ID_Usuario
            LEFT JOIN Empleado e ON v.ID_Empleado = e.ID_Usuario
            LEFT JOIN Usuario u2 ON e.ID_Usuario = u2.ID_Usuario
            WHERE v.ID_Ventas = ?
            """;

        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
            Venta venta = new Venta();
            venta.setIdVenta(rs.getInt("ID_Ventas"));
            venta.setIdCliente(rs.getInt("ID_Cliente"));
            venta.setIdEmpleado(rs.getInt("ID_Empleado"));

            // Manejar la fecha correctamente para SQLite
            String fechaStr = rs.getString("Fecha_Venta");
            LocalDateTime fechaVenta = parseFechaSQLite(fechaStr);
            venta.setFechaVenta(fechaVenta);

            venta.setMetodoPago(rs.getString("Metodo_Pago"));
            venta.setTotal(rs.getDouble("Total"));
            venta.setEstadoVenta(rs.getString("Estado_Venta"));

            Cliente cliente = new Cliente(
                    rs.getInt("ID_Cliente"),
                    rs.getString("cliente_nombre"),
                    rs.getString("cliente_apellido"),
                    null, null, null,
                    rs.getInt("cliente_dni")
            );
            venta.setCliente(cliente);

            Empleado empleado = new Empleado(
                    rs.getInt("ID_Empleado"),
                    rs.getString("empleado_nombre"),
                    rs.getString("empleado_apellido"),
                    null, null,
                    rs.getString("empleado_cargo"),
                    null, null, null
            );
            venta.setEmpleado(empleado);

            return venta;
        }, id);
    }

    @Override
    public void crearVenta(Venta venta) {
        String sql = "INSERT INTO Ventas (ID_Cliente, ID_Empleado, Fecha_Venta, Metodo_Pago, Total, Estado_Venta) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                venta.getIdCliente(),
                venta.getIdEmpleado(),
                venta.getFechaVenta().toString(), // Guardar como string
                venta.getMetodoPago(),
                venta.getTotal(),
                venta.getEstadoVenta()
        );
    }

    // Método para parsear fechas de SQLite
    private LocalDateTime parseFechaSQLite(String fechaStr) {
        try {
            // Intentar diferentes formatos de fecha
            if (fechaStr.contains("T")) {
                // Formato ISO: "2025-11-06T23:33:59.211837700"
                return LocalDateTime.parse(fechaStr.replace(" ", "T"));
            } else {
                // Formato tradicional: "2025-11-06 23:33:59"
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                return LocalDateTime.parse(fechaStr, formatter);
            }
        } catch (Exception e) {
            // Si falla, retornar fecha actual
            return LocalDateTime.now();
        }
    }
}