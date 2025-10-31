package com.example.Techmerch.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;
import com.example.Techmerch.reporte.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/reporte")
public class ReporteController {

    @Autowired
    private ReporteService reporteService;

    @GetMapping
    public String mostrarReporte(Model model) {
        List<Map<String, Object>> ventasPorProducto = reporteService.ventasPorProducto();
        List<Map<String, Object>> ventasSemanales = reporteService.ventasSemanales();
        List<Map<String, Object>> topPorCategoria = reporteService.top10PorCategoria();

        model.addAttribute("ventasPorProducto", ventasPorProducto);
        model.addAttribute("ventasSemanales", ventasSemanales);
        model.addAttribute("topPorCategoria", topPorCategoria);

        return "private/reporte";
    }
}
