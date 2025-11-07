package com.example.Techmerch.controller;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Controller
public class ProductoControllerHTML {

    private final JdbcTemplate jdbcTemplate;

    public ProductoControllerHTML(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    // ✅ LISTAR PRODUCTOS
    @GetMapping("/articulo")
    public String listarProductos(Model model) {
        List<Map<String, Object>> productos = jdbcTemplate.queryForList(
                "SELECT p.*, c.Nombre AS CategoriaNombre " +
                        "FROM Producto p " +
                        "LEFT JOIN Categorias c ON p.ID_Categoria = c.ID_Categoria " +
                        "WHERE p.Estado = 1"
        );
        model.addAttribute("productos", productos);
        return "private/producto/articulo"; // archivo JSP
    }

    // ✅ MOSTRAR FORMULARIO DE AGREGAR
    @GetMapping("/articulo/agregar")
    public String mostrarFormularioAgregar(Model model) {
        List<Map<String, Object>> categorias = jdbcTemplate.queryForList(
                "SELECT * FROM Categorias WHERE Estado = 1"
        );
        model.addAttribute("categorias", categorias);
        return "private/producto/articuloagregar"; // archivo JSP
    }

    // ✅ GUARDAR NUEVO PRODUCTO (desde formulario JSP)
    @PostMapping("/articulo/guardar")
    public String guardarProducto(
            @RequestParam("idCategoria") int idCategoria,
            @RequestParam("nombre") String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("tipoProducto") String tipoProducto,
            @RequestParam("precio") BigDecimal precio,
            @RequestParam("stock") int stock
    ) {
        jdbcTemplate.update(
                "INSERT INTO Producto (ID_Categoria, Nombre, Descripcion, Tipo_Producto, Precio, Stock, Estado) " +
                        "VALUES (?, ?, ?, ?, ?, ?, 1)",
                idCategoria, nombre, descripcion, tipoProducto, precio, stock
        );
        return "redirect:/articulo";
    }

    // ✅ MOSTRAR FORMULARIO DE EDICIÓN
    @GetMapping("/articulo/editar/{id}")
    public String mostrarFormularioEditar(@PathVariable int id, Model model) {
        Map<String, Object> producto = jdbcTemplate.queryForMap(
                "SELECT * FROM Producto WHERE ID_Producto = ?", id
        );
        List<Map<String, Object>> categorias = jdbcTemplate.queryForList(
                "SELECT * FROM Categorias WHERE Estado = 1"
        );

        model.addAttribute("producto", producto);
        model.addAttribute("categorias", categorias);
        return "private/producto/articuloeditar";
    }

    // ✅ ACTUALIZAR PRODUCTO EXISTENTE
    @PostMapping("/articulo/actualizar")
    public String actualizarProducto(
            @RequestParam("idProducto") int idProducto,
            @RequestParam("idCategoria") int idCategoria,
            @RequestParam("nombre") String nombre,
            @RequestParam("descripcion") String descripcion,
            @RequestParam("tipoProducto") String tipoProducto,
            @RequestParam("precio") BigDecimal precio,
            @RequestParam("stock") int stock
    ) {
        jdbcTemplate.update(
                "UPDATE Producto SET ID_Categoria=?, Nombre=?, Descripcion=?, Tipo_Producto=?, Precio=?, Stock=? WHERE ID_Producto=?",
                idCategoria, nombre, descripcion, tipoProducto, precio, stock, idProducto
        );
        return "redirect:/articulo";
    }
}
