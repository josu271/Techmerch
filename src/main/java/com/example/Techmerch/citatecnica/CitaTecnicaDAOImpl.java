package com.example.Techmerch.citatecnica;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CitaTecnicaDAOImpl implements CitaTecnicaDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<CitaTecnica> mapper = new RowMapper<CitaTecnica>() {
        @Override
        public CitaTecnica mapRow(ResultSet rs, int rowNum) throws SQLException {
            CitaTecnica c = new CitaTecnica();
            c.setIdCitaTecnica(rs.getInt("ID_CitaTecnica"));
            c.setIdCliente(rs.getInt("ID_Cliente"));
            c.setIdEmpleado(rs.getInt("ID_Empleado"));
            c.setServicio(rs.getString("Servicio"));
            c.setEstado(rs.getString("Estado"));
            c.setDescripcion(rs.getString("Descripcion"));
            c.setFechaProgramada(rs.getTimestamp("Fecha_Programada"));
            c.setFechaCreacion(rs.getTimestamp("Fecha_Creacion"));

            // Para H2 usar CONCAT en lugar de ||
            c.setNombreCliente(rs.getString("nombreCliente"));
            c.setNombreEmpleado(rs.getString("nombreEmpleado"));
            return c;
        }
    };

    @Override
    public List<CitaTecnica> listarTodas() {
        String sql = """
            SELECT ct.*, 
                   CONCAT(cl.Nombre, ' ', cl.Apellido) AS nombreCliente,
                   CONCAT(emp.Nombre, ' ', emp.Apellido) AS nombreEmpleado
            FROM Cita_Tecnica ct
            INNER JOIN Cliente cl ON ct.ID_Cliente = cl.ID_Usuario
            INNER JOIN Empleado emp ON ct.ID_Empleado = emp.ID_Usuario
            ORDER BY ct.Fecha_Programada DESC
        """;
        return jdbcTemplate.query(sql, mapper);
    }

    @Override
    public CitaTecnica buscarPorId(int id) {
        String sql = """
            SELECT ct.*, 
                   CONCAT(cl.Nombre, ' ', cl.Apellido) AS nombreCliente,
                   CONCAT(emp.Nombre, ' ', emp.Apellido) AS nombreEmpleado
            FROM Cita_Tecnica ct
            INNER JOIN Cliente cl ON ct.ID_Cliente = cl.ID_Usuario
            INNER JOIN Empleado emp ON ct.ID_Empleado = emp.ID_Usuario
            WHERE ct.ID_CitaTecnica = ?
        """;
        return jdbcTemplate.queryForObject(sql, mapper, id);
    }

    @Override
    public void agregar(CitaTecnica cita) {
        String sql = """
            INSERT INTO Cita_Tecnica (ID_Cliente, ID_Empleado, Servicio, Estado, Descripcion, Fecha_Programada)
            VALUES (?, ?, ?, ?, ?, ?)
        """;
        jdbcTemplate.update(sql,
                cita.getIdCliente(),
                cita.getIdEmpleado(),
                cita.getServicio(),
                cita.getEstado(),
                cita.getDescripcion(),
                cita.getFechaProgramada());
    }

    @Override
    public void actualizar(CitaTecnica cita) {
        String sql = """
            UPDATE Cita_Tecnica
            SET ID_Cliente=?, ID_Empleado=?, Servicio=?, Estado=?, Descripcion=?, Fecha_Programada=?
            WHERE ID_CitaTecnica=?
        """;
        jdbcTemplate.update(sql,
                cita.getIdCliente(),
                cita.getIdEmpleado(),
                cita.getServicio(),
                cita.getEstado(),
                cita.getDescripcion(),
                cita.getFechaProgramada(),
                cita.getIdCitaTecnica());
    }

    @Override
    public void eliminar(int id) {
        jdbcTemplate.update("DELETE FROM Cita_Tecnica WHERE ID_CitaTecnica = ?", id);
    }
}