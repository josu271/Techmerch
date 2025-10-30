package com.example.Techmerch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import com.example.Techmerch.usuario.*;

@Controller
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @GetMapping("/login")
    public String mostrarLogin() {
        return "public/login/login"; // ✅ ruta del JSP
    }

    @PostMapping("/login")
    public String procesarLogin(@RequestParam String correo,
                                @RequestParam String contrasena,
                                Model model) {

        Usuario usuario = usuarioService.login(correo, contrasena);

        if (usuario != null) {
            model.addAttribute("usuario", usuario);

            if (usuario.getTipoUsuario().equalsIgnoreCase("cliente")) {
                return "redirect:/ventas";
            } else if (usuario.getTipoUsuario().equalsIgnoreCase("empleado")) {
                return "redirect:/empleado/dashboard";
            } else {
                return "redirect:/login?error=tipoDesconocido";
            }

        } else {
            model.addAttribute("error", "Correo o contraseña incorrectos");
            return "public/login/login"; // ✅ corregido
        }
    }
}
