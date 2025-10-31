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

    @GetMapping("/{id}")
    public Producto obtenerProducto(@PathVariable int id) {
        return productoService.obtenerProductoPorId(id);
    }

    @PostMapping
    public void crearProducto(@RequestBody Producto producto) {
        productoService.crearProducto(producto);
    }

    @PutMapping("/{id}")
    public void actualizarProducto(@PathVariable int id, @RequestBody Producto producto) {
        producto.setIdProducto(id);
        productoService.actualizarProducto(producto);
    }

    @DeleteMapping("/{id}")
    public void eliminarProducto(@PathVariable int id) {
        productoService.eliminarProducto(id);
    }

    @GetMapping("/categoria/{idCategoria}")
    public List<Producto> listarProductosPorCategoria(@PathVariable int idCategoria) {
        return productoService.listarProductosPorCategoria(idCategoria);
    }
}