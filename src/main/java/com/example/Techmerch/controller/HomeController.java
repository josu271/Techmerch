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

    // ---------- CITAS TÉCNICAS ----------
    @GetMapping("/citastecnica")
    public String citasTecnica() {
        return "private/citas_tecnica/citastecnica";
    }

    @GetMapping("/citastecnica/agregar")
    public String citasTecnicaAgregar() {
        return "private/citas_tecnica/citastecnicaagregar";
    }

    @GetMapping("/citastecnica/editar")
    public String citasTecnicaEditar() {
        return "private/citas_tecnica/citastecnicaeditar";
    }

    // ---------- CALENDARIO ----------
    @GetMapping("/calendario")
    public String calendario() {
        return "private/calendario";
    }

    @GetMapping("/reporte")
    public String reporte() {
        return "private/reporte";
    }
}
