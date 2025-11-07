package com.example.Techmerch.citatecnica;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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

            // Obtener fecha como String directamente SIN convertir
            String fechaProgramadaStr = rs.getString("Fecha_Programada");
            c.setFechaProgramada(fechaProgramadaStr); // Guardar el string original

            String fechaCreacionStr = rs.getString("Fecha_Creacion");
            if (fechaCreacionStr != null) {
                try {
                    c.setFechaCreacion(Timestamp.valueOf(fechaCreacionStr));
                } catch (Exception e) {
                    System.err.println("Error parsing creation date: " + fechaCreacionStr);
                }
            }

            c.setNombreCliente(rs.getString("nombreCliente"));
            c.setNombreEmpleado(rs.getString("nombreEmpleado"));
            return c;
        }
    };

    @Override
    public List<CitaTecnica> listarTodas() {
        // Primero, contar cuántas citas hay en total
        String countSql = "SELECT COUNT(*) FROM Cita_Tecnica";
        Integer totalCitas = jdbcTemplate.queryForObject(countSql, Integer.class);
        System.out.println("=== DEBUG: Total de citas en BD: " + totalCitas + " ===");

        // Consulta con LEFT JOIN para incluir todas las citas
        String sql = """
            SELECT ct.*, 
                   (cl.Nombre || ' ' || cl.Apellido) AS nombreCliente,
                   (emp.Nombre || ' ' || emp.Apellido) AS nombreEmpleado
            FROM Cita_Tecnica ct
            LEFT JOIN Cliente cl ON ct.ID_Cliente = cl.ID_Usuario
            LEFT JOIN Empleado emp ON ct.ID_Empleado = emp.ID_Usuario
            ORDER BY ct.Fecha_Programada DESC
        """;

        List<CitaTecnica> citas = jdbcTemplate.query(sql, mapper);
        System.out.println("=== DEBUG: Citas encontradas con JOIN: " + citas.size() + " ===");

        // Debug: mostrar información de cada cita
        for (CitaTecnica cita : citas) {
            System.out.println("Cita ID: " + cita.getIdCitaTecnica() +
                    ", Cliente: " + cita.getIdCliente() + " (" + cita.getNombreCliente() + ")" +
                    ", Empleado: " + cita.getIdEmpleado() + " (" + cita.getNombreEmpleado() + ")");
        }

        return citas;
    }

    @Override
    public CitaTecnica buscarPorId(int id) {
        String sql = """
            SELECT ct.*, 
                   (cl.Nombre || ' ' || cl.Apellido) AS nombreCliente,
                   (emp.Nombre || ' ' || emp.Apellido) AS nombreEmpleado
            FROM Cita_Tecnica ct
            LEFT JOIN Cliente cl ON ct.ID_Cliente = cl.ID_Usuario
            LEFT JOIN Empleado emp ON ct.ID_Empleado = emp.ID_Usuario
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
                cita.getFechaProgramadaAsTimestamp() != null ?
                        cita.getFechaProgramadaAsTimestamp().toString().substring(0, 19) : null);
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
                cita.getFechaProgramadaAsTimestamp() != null ?
                        cita.getFechaProgramadaAsTimestamp().toString().substring(0, 19) : null,
                cita.getIdCitaTecnica());
    }

    @Override
    public void eliminar(int id) {
        jdbcTemplate.update("DELETE FROM Cita_Tecnica WHERE ID_CitaTecnica = ?", id);
    }
}