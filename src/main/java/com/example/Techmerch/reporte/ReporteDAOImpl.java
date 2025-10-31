package com.example.Techmerch.reporte;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public class ReporteDAOImpl implements ReporteDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 📊 Ventas por producto (Top 10)
    @Override
    public List<Map<String, Object>> obtenerVentasPorProducto() {
        String sql = """
            SELECT p.Nombre AS nombre, SUM(dv.Subtotal) AS total
            FROM DetalleVenta dv
            INNER JOIN Producto p ON dv.ID_Producto = p.ID_Producto
            INNER JOIN Ventas v ON dv.ID_Ventas = v.ID_Ventas
            WHERE v.Estado_Venta = 'completada'
            GROUP BY p.Nombre
            ORDER BY total DESC
            LIMIT 10
        """;
        return jdbcTemplate.queryForList(sql);
    }

    // 📈 Ventas diarias/semanales (últimos 14 días)
    @Override
    public List<Map<String, Object>> obtenerVentasSemanales() {
        String sql = """
            SELECT CAST(v.Fecha_Venta AS DATE) AS fecha, SUM(v.Total) AS total
            FROM Ventas v
            WHERE v.Estado_Venta = 'completada'
            GROUP BY CAST(v.Fecha_Venta AS DATE)
            ORDER BY fecha ASC
            LIMIT 14
        """;
        return jdbcTemplate.queryForList(sql);
    }

    // 🍩 Top 10 productos por categoría
    @Override
    public List<Map<String, Object>> obtenerTop10PorCategoria() {
        String sql = """
            SELECT c.Nombre AS categoria, p.Nombre AS producto, SUM(dv.Cantidad) AS total
            FROM DetalleVenta dv
            INNER JOIN Producto p ON dv.ID_Producto = p.ID_Producto
            INNER JOIN Categorias c ON p.ID_Categoria = c.ID_Categoria
            GROUP BY c.Nombre, p.Nombre
            ORDER BY c.Nombre, total DESC
            LIMIT 10
        """;
        return jdbcTemplate.queryForList(sql);
    }
}
