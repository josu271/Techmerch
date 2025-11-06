package com.example.Techmerch.usuario;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
@Repository

public class UsuarioDAOImpl implements UsuarioDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<Usuario> usuarioMapper = new RowMapper<Usuario>() {
        @Override
        public Usuario mapRow(ResultSet rs, int rowNum) throws SQLException {
            Usuario u = new Usuario();
            u.setIdUsuario(rs.getInt("ID_Usuario"));
            u.setDni(rs.getInt("DNI"));
            u.setCorreo(rs.getString("Correo"));
            u.setContrasena(rs.getString("Contrasena"));
            u.setTipoUsuario(rs.getString("Tipo_Usuario"));
            u.setEstado(rs.getBoolean("Estado"));
            u.setFechaRegistro(rs.getTimestamp("Fecha_Registro"));
            u.setUltimoLogin(rs.getTimestamp("Ultimo_Login"));
            return u;
        }
    };

    @Override
    public Usuario buscarPorCorreoYContrasena(String correo, String contrasena) {
        String sql = "SELECT * FROM Usuario WHERE Correo = ? AND Contrasena = ? AND Estado = TRUE";
        try {
            return jdbcTemplate.queryForObject(sql, usuarioMapper, correo, contrasena);
        } catch (Exception e) {
            return null; // Si no encuentra usuario
        }
    }

    @Override
    public void actualizarUltimoLogin(int idUsuario) {
        jdbcTemplate.update("UPDATE Usuario SET Ultimo_Login = CURRENT_TIMESTAMP WHERE ID_Usuario = ?", idUsuario);
    }

}