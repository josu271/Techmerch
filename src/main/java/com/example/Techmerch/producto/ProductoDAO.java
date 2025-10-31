package com.example.Techmerch.producto;

import java.util.List;

public interface ProductoDAO {
    List<Producto> listarProductos();
    Producto obtenerProductoPorId(int id);
    void crearProducto(Producto producto);
    void actualizarProducto(Producto producto);
    void eliminarProducto(int id);
    List<Producto> listarProductosPorCategoria(int idCategoria);
}