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

    // 🔹 Listar todos los productos
    @GetMapping
    public List<Producto> listarProductos() {
        return productoService.listarProductos();
    }

    // 🔹 Crear un nuevo producto (JSON)
    @PostMapping
    public void crearProducto(@RequestBody Producto producto) {
        productoService.crearProducto(producto);
    }

    // 🔹 Obtener producto por ID
    @GetMapping("/{id}")
    public Producto obtenerProducto(@PathVariable int id) {
        return productoService.obtenerProductoPorId(id);
    }

    // 🔹 Actualizar producto
    @PutMapping("/{id}")
    public void actualizarProducto(@PathVariable int id, @RequestBody Producto producto) {
        producto.setIdProducto(id);
        productoService.actualizarProducto(producto);
    }

    // 🔹 Eliminar producto
    @DeleteMapping("/{id}")
    public void eliminarProducto(@PathVariable int id) {
        productoService.eliminarProducto(id);
    }

    // 🔹 Listar productos por categoría
    @GetMapping("/categoria/{idCategoria}")
    public List<Producto> listarProductosPorCategoria(@PathVariable int idCategoria) {
        return productoService.listarProductosPorCategoria(idCategoria);
    }
}
