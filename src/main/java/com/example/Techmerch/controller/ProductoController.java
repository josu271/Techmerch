package com.example.Techmerch.controller;

import com.example.Techmerch.producto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api/productos")
public class ProductoController {

    private final ProductoService productoService;

    @Autowired
    public ProductoController(ProductoService productoService) {
        this.productoService = productoService;
    }

    @GetMapping
    public List<Producto> listarProductos() {
        return productoService.listarProductos();
    }

    @PostMapping
    public void crearProducto(@RequestBody Producto producto) {
        productoService.crearProducto(producto);
    }

    // demás métodos JSON...
}
