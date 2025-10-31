package com.example.Techmerch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // --- PÚBLICAS ---
    @GetMapping("/")
    public String home() {
        return "public/index";
    }

    @GetMapping("/productos")
    public String productos() {
        return "public/productos";
    }

    @GetMapping("/contacto")
    public String contacto() {
        return "public/contacto";
    }

    @GetMapping("/serviciotecnico")
    public String servicioTecnico() {
        return "public/serviciotecnico";
    }

    // --- PRIVADAS ---
    @GetMapping("/panel")
    public String panel() {
        return "private/panel";
    }



    // ---------- VENTAS ----------



    @GetMapping("/ventas/editar")
    public String ventasEditar() {
        return "private/venta/ventaseditar";
    }



    // ---------- CALENDARIO ----------
    @GetMapping("/calendario")
    public String calendario() {
        return "private/calendario";
    }

}
