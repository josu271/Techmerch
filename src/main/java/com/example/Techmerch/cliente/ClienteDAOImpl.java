package com.example.Techmerch.cliente;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class ClienteDAOImpl implements ClienteDAO {

    private final JdbcTemplate jdbcTemplate;

    public ClienteDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Cliente> listarClientes() {
        String sql = """
            SELECT c.ID_Usuario, c.Nombre, c.Apellido, c.Direccion, c.Celular, c.Fecha_Nacimiento, u.DNI
            FROM Cliente c
            JOIN Usuario u ON c.ID_Usuario = u.ID_Usuario
            WHERE u.Estado = 1
            ORDER BY c.Nombre, c.Apellido
            """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> new Cliente(
                rs.getInt("ID_Usuario"),
                rs.getString("Nombre"),
                rs.getString("Apellido"),
                rs.getString("Direccion"),
                rs.getString("Celular"),
                rs.getString("Fecha_Nacimiento"),
                rs.getInt("DNI")
        ));
    }

    @Override
    public Cliente obtenerClientePorId(int id) {
        String sql = """
            SELECT c.ID_Usuario, c.Nombre, c.Apellido, c.Direccion, c.Celular, c.Fecha_Nacimiento, u.DNI
            FROM Cliente c
            JOIN Usuario u ON c.ID_Usuario = u.ID_Usuario
            WHERE c.ID_Usuario = ?
            """;

        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> new Cliente(
                rs.getInt("ID_Usuario"),
                rs.getString("Nombre"),
                rs.getString("Apellido"),
                rs.getString("Direccion"),
                rs.getString("Celular"),
                rs.getString("Fecha_Nacimiento"),
                rs.getInt("DNI")
        ), id);
    }
}