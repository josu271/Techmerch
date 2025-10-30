package com.example.Techmerch.venta;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class VentaDAOImpl implements VentaDAO {

    private final JdbcTemplate jdbcTemplate;

    public VentaDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Venta> listarVentas() {
        String sql = "SELECT * FROM Ventas";
        return jdbcTemplate.query(sql, (rs, rowNum) -> new Venta(
                rs.getInt("ID_Ventas"),
                rs.getInt("ID_Cliente"),
                rs.getInt("ID_Empleado"),
                rs.getTimestamp("Fecha_Venta").toLocalDateTime(),
                rs.getString("Metodo_Pago"),
                rs.getDouble("Total"),
                rs.getString("Estado_Venta")
        ));
    }

    @Override
    public Venta obtenerVentaPorId(int id) {
        String sql = "SELECT * FROM Ventas WHERE ID_Ventas = ?";
        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> new Venta(
                rs.getInt("ID_Ventas"),
                rs.getInt("ID_Cliente"),
                rs.getInt("ID_Empleado"),
                rs.getTimestamp("Fecha_Venta").toLocalDateTime(),
                rs.getString("Metodo_Pago"),
                rs.getDouble("Total"),
                rs.getString("Estado_Venta")
        ), id);
    }

    @Override
    public void crearVenta(Venta venta) {
        String sql = "INSERT INTO Ventas (ID_Cliente, ID_Empleado, Fecha_Venta, Metodo_Pago, Total, Estado_Venta) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                venta.getIdCliente(),
                venta.getIdEmpleado(),
                venta.getFechaVenta(),
                venta.getMetodoPago(),
                venta.getTotal(),
                venta.getEstadoVenta()
        );
    }
}
