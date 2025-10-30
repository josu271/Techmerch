package com.example.Techmerch.controller;

import com.example.Techmerch.venta.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/ventas")
public class VentaController {

    @Autowired
    private VentaService ventaService;

    // ✅ Mostrar la lista de ventas en el JSP
    @GetMapping
    public String listarVentasHTML(Model model) {
        List<Venta> ventas = ventaService.listarVentas();
        model.addAttribute("ventas", ventas);
        return "private/venta/ventas"; // JSP en /WEB-INF/views/pages/ventas/ventas.jsp
    }

    // ✅ API REST para obtener todas las ventas (si necesitas JSON)
    @ResponseBody
    @GetMapping("/listar")
    public List<Venta> listarVentas() {
        return ventaService.listarVentas();
    }

    // ✅ API REST para obtener una venta por ID
    @ResponseBody
    @GetMapping("/get/{id}")
    public Venta obtenerVenta(@PathVariable int id) {
        return ventaService.obtenerVentaPorId(id);
    }

    // ✅ API REST para registrar nueva venta (JSON)
    @ResponseBody
    @PostMapping("/crear")
    public String crearVenta(@RequestBody Venta venta) {
        ventaService.crearVenta(venta);
        return "Venta registrada correctamente.";
    }

    // (Opcional) vista para el formulario de agregar venta
    @GetMapping("/agregar")
    public String mostrarFormularioVenta() {
        return "private/venta/ventasagregar"; // si luego agregas un JSP para esto
    }
}
