package com.example.Techmerch.empleado;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class EmpleadoDAOImpl implements EmpleadoDAO {

    private final JdbcTemplate jdbcTemplate;

    public EmpleadoDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Empleado> listarEmpleados() {
        String sql = """
            SELECT e.ID_Usuario, e.Nombre, e.Apellido, e.Direccion, e.Celular, 
                   e.Cargo, e.Salario, e.Fecha_Contratacion, e.Estado_Empleado, u.DNI
            FROM Empleado e
            JOIN Usuario u ON e.ID_Usuario = u.ID_Usuario
            WHERE u.Estado = 1 AND e.Estado_Empleado = 'activo'
            ORDER BY e.Nombre, e.Apellido
            """;

        return jdbcTemplate.query(sql, (rs, rowNum) -> new Empleado(
                rs.getInt("ID_Usuario"),
                rs.getString("Nombre"),
                rs.getString("Apellido"),
                rs.getString("Direccion"),
                rs.getString("Celular"),
                rs.getString("Cargo"),
                rs.getDouble("Salario"),
                rs.getString("Fecha_Contratacion"),
                rs.getString("Estado_Empleado")
        ));
    }

    @Override
    public Empleado obtenerEmpleadoPorId(int id) {
        String sql = """
            SELECT e.ID_Usuario, e.Nombre, e.Apellido, e.Direccion, e.Celular, 
                   e.Cargo, e.Salario, e.Fecha_Contratacion, e.Estado_Empleado, u.DNI
            FROM Empleado e
            JOIN Usuario u ON e.ID_Usuario = u.ID_Usuario
            WHERE e.ID_Usuario = ?
            """;

        return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> new Empleado(
                rs.getInt("ID_Usuario"),
                rs.getString("Nombre"),
                rs.getString("Apellido"),
                rs.getString("Direccion"),
                rs.getString("Celular"),
                rs.getString("Cargo"),
                rs.getDouble("Salario"),
                rs.getString("Fecha_Contratacion"),
                rs.getString("Estado_Empleado")
        ), id);
    }
}