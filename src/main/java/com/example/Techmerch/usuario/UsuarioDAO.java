package com.example.Techmerch.usuario;

public interface UsuarioDAO {
    Usuario buscarPorCorreoYContrasena(String correo, String contrasena);
    void actualizarUltimoLogin(int idUsuario);
}
