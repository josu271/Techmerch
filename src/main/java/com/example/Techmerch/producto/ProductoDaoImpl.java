package com.example.Techmerch.producto;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ProductoDaoImpl implements ProductoDAO {

    private final JdbcTemplate jdbcTemplate;

    public ProductoDaoImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private static final class ProductoRowMapper implements RowMapper<Producto> {
        @Override
        public Producto mapRow(ResultSet rs, int rowNum) throws SQLException {
            Producto producto = new Producto();
            producto.setIdProducto(rs.getInt("ID_Producto"));
            producto.setIdCategoria(rs.getInt("ID_Categoria"));
            producto.setNombre(rs.getString("Nombre"));
            producto.setDescripcion(rs.getString("Descripcion"));
            producto.setTipoProducto(rs.getString("Tipo_Producto"));
            producto.setPrecio(rs.getBigDecimal("Precio"));
            producto.setStock(rs.getInt("Stock"));
            producto.setEstado(rs.getBoolean("Estado"));
            return producto;
        }
    }

    @Override
    public List<Producto> listarProductos() {
        String sql = "SELECT * FROM Producto WHERE Estado = true";
        return jdbcTemplate.query(sql, new ProductoRowMapper());
    }

    @Override
    public Producto obtenerProductoPorId(int id) {
        String sql = "SELECT * FROM Producto WHERE ID_Producto = ?";
        return jdbcTemplate.queryForObject(sql, new ProductoRowMapper(), id);
    }

    @Override
    public void crearProducto(Producto producto) {
        String sql = "INSERT INTO Producto (ID_Categoria, Nombre, Descripcion, Tipo_Producto, Precio, Stock, Estado) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                producto.getIdCategoria(),
                producto.getNombre(),
                producto.getDescripcion(),
                producto.getTipoProducto(),
                producto.getPrecio(),
                producto.getStock(),
                producto.getEstado());
    }

    @Override
    public void actualizarProducto(Producto producto) {
        String sql = "UPDATE Producto SET ID_Categoria = ?, Nombre = ?, Descripcion = ?, " +
                "Tipo_Producto = ?, Precio = ?, Stock = ?, Estado = ? WHERE ID_Producto = ?";
        jdbcTemplate.update(sql,
                producto.getIdCategoria(),
                producto.getNombre(),
                producto.getDescripcion(),
                producto.getTipoProducto(),
                producto.getPrecio(),
                producto.getStock(),
                producto.getEstado(),
                producto.getIdProducto());
    }

    @Override
    public void eliminarProducto(int id) {
        String sql = "UPDATE Producto SET Estado = false WHERE ID_Producto = ?";
        jdbcTemplate.update(sql, id);
    }

    @Override
    public List<Producto> listarProductosPorCategoria(int idCategoria) {
        String sql = "SELECT * FROM Producto WHERE ID_Categoria = ? AND Estado = true";
        return jdbcTemplate.query(sql, new ProductoRowMapper(), idCategoria);
    }
}