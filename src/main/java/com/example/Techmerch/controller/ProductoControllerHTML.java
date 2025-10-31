package com.example.Techmerch.controller;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable; // ✅ IMPORTACIÓN FALTANTE
import java.util.List;
import java.util.Map;

@Controller
public class ProductoControllerHTML {

    private final JdbcTemplate jdbcTemplate;

    public ProductoControllerHTML(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @GetMapping("/articulo")
    public String listarProductos(Model model) {
        List<Map<String, Object>> productos = jdbcTemplate.queryForList(
                "SELECT p.*, c.Nombre as CategoriaNombre FROM Producto p " +
                        "LEFT JOIN Categorias c ON p.ID_Categoria = c.ID_Categoria " +
                        "WHERE p.Estado = true"
        );
        model.addAttribute("productos", productos);
        return "private/producto/articulo";
    }

    @GetMapping("/articulo/agregar")
    public String mostrarFormularioAgregar(Model model) {
        // Obtener categorías para el dropdown
        List<Map<String, Object>> categorias = jdbcTemplate.queryForList(
                "SELECT * FROM Categorias WHERE Estado = true"
        );
        model.addAttribute("categorias", categorias);
        model.addAttribute("producto", new Object());
        return "private/producto/articuloagregar";
    }

    @GetMapping("/articulo/editar/{id}")
    public String mostrarFormularioEditar(@PathVariable int id, Model model) { // ✅ @PathVariable ahora importado
        try {
            Map<String, Object> producto = jdbcTemplate.queryForMap(
                    "SELECT * FROM Producto WHERE ID_Producto = ?", id
            );

            List<Map<String, Object>> categorias = jdbcTemplate.queryForList(
                    "SELECT * FROM Categorias WHERE Estado = true"
            );

            model.addAttribute("producto", producto);
            model.addAttribute("categorias", categorias);
            return "private/producto/varticuloeditar";
        } catch (Exception e) {
            // Manejar error si el producto no existe
            return "redirect:/articulo";
        }
    }
}