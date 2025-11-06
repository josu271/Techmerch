    package com.example.Techmerch.usuario;

    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    @Service
    public class UsuarioServiceImpl implements UsuarioService {

        @Autowired
        private UsuarioDAO usuarioDAO;

        @Override
        public Usuario login(String correo, String contrasena) {
            Usuario usuario = usuarioDAO.buscarPorCorreoYContrasena(correo, contrasena);

            if (usuario != null) {
                usuarioDAO.actualizarUltimoLogin(usuario.getIdUsuario());
            }

            return usuario;
        }
    }