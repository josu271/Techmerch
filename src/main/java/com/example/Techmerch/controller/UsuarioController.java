package com.example.Techmerch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import com.example.Techmerch.usuario.Usuario;
import com.example.Techmerch.usuario.UsuarioService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    // Muestra la vista del login
    @GetMapping("/login")
    public String mostrarLogin(@RequestParam(required = false) String error, Model model) {
        if (error != null) {
            model.addAttribute("error", "Error: " + error);
        }
        return "public/login/login"; // ✅ Ruta JSP correcta: /WEB-INF/views/public/login/login.jsp
    }

    // Procesa el formulario de login
    @PostMapping("/login")
    public String procesarLogin(
            @RequestParam("correo") String correo,
            @RequestParam("contrasena") String contrasena,
            Model model,
            HttpSession session) {

        Usuario usuario = usuarioService.login(correo, contrasena);

        if (usuario != null) {
            // Guardar el usuario logueado en sesión
            session.setAttribute("usuarioLogueado", usuario);

            // Redirigir según tipo
            if ("cliente".equalsIgnoreCase(usuario.getTipoUsuario())) {
                return "redirect:/"; // Página principal del cliente
            } else if ("empleado".equalsIgnoreCase(usuario.getTipoUsuario())) {
                return "redirect:/ventas"; // Página de ventas
            } else {
                return "redirect:/login?error=tipoDesconocido";
            }

        } else {
            model.addAttribute("error", "Correo o contraseña incorrectos");
            return "public/login/login"; // Mostrar mensaje en el JSP
        }
    }

    // Cerrar sesión
    @GetMapping("/logout")
    public String cerrarSesion(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
