package com.example.Techmerch.controller;

import com.example.Techmerch.venta.*;
import com.example.Techmerch.cliente.*;
import com.example.Techmerch.empleado.*;
import com.example.Techmerch.producto.*;
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

    @Autowired
    private ClienteDAO clienteDAO;

    @Autowired
    private EmpleadoDAO empleadoDAO;

    @Autowired
    private ProductoDAO productoDAO; // Usa tu ProductoDAO existente

    // ✅ Mostrar la lista de ventas en el JSP
    @GetMapping
    public String listarVentasHTML(Model model) {
        List<Venta> ventas = ventaService.listarVentas();
        model.addAttribute("ventas", ventas);
        return "private/venta/ventas";
    }

    // ✅ Vista para el formulario de agregar venta
    @GetMapping("/agregar")
    public String mostrarFormularioVenta(Model model) {
        model.addAttribute("clientes", clienteDAO.listarClientes());
        model.addAttribute("empleados", empleadoDAO.listarEmpleados());
        model.addAttribute("productos", productoDAO.listarProductos()); // Usa tu método existente
        return "private/venta/ventasagregar";
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

    // ✅ Método para procesar el formulario de venta
    @PostMapping("/guardar")
    public String guardarVenta(@RequestParam int idCliente,
                               @RequestParam int idEmpleado,
                               @RequestParam String metodoPago,
                               @RequestParam double total,
                               @RequestParam String estadoVenta) {

        Venta venta = new Venta();
        venta.setIdCliente(idCliente);
        venta.setIdEmpleado(idEmpleado);
        venta.setMetodoPago(metodoPago);
        venta.setTotal(total);
        venta.setEstadoVenta(estadoVenta);
        venta.setFechaVenta(java.time.LocalDateTime.now());

        ventaService.crearVenta(venta);

        return "redirect:/ventas";
    }
}