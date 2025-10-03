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
}