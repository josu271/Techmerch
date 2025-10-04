package com.example.Techmerch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "index"; // busca en /WEB-INF/views/index.jsp

    }
    @GetMapping("/productos")
    public String productos() {
        return "productos"; // busca en /WEB-INF/views/productos.jsp
    }
    @GetMapping("/contacto")
    public String contacto() {
        return "contacto"; // Busca en /WEB-INF/views/contacto.jsp
    }
    @GetMapping("/login")
    public String login() {
        return "login"; // Busca en /WEB-INF/views/contacto.jsp
    }
    @GetMapping("/serviciotecnico")
    public String serviciotecnico() {
        return "serviciotecnico"; // Busca en /WEB-INF/views/contacto.jsp
    }
    @GetMapping("/panel")
    public String panel() {
        return "panel"; // busca en /WEB-INF/views/panel.jsp
    }

}