package com.example.Techmerch.producto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductoServiceImpl implements ProductoService {

    private final ProductoDAO productoDAO;

    @Autowired
    public ProductoServiceImpl(ProductoDAO productoDAO) {
        this.productoDAO = productoDAO;
    }

    @Override
    public List<Producto> listarProductos() {
        return productoDAO.listarProductos();
    }

    @Override
    public Producto obtenerProductoPorId(int id) {
        return productoDAO.obtenerProductoPorId(id);
    }

    @Override
    public void crearProducto(Producto producto) {
        productoDAO.crearProducto(producto);
    }

    @Override
    public void actualizarProducto(Producto producto) {
        productoDAO.actualizarProducto(producto);
    }

    @Override
    public void eliminarProducto(int id) {
        productoDAO.eliminarProducto(id);
    }

    @Override
    public List<Producto> listarProductosPorCategoria(int idCategoria) {
        return productoDAO.listarProductosPorCategoria(idCategoria);
    }
}