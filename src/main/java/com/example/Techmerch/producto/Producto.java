package com.example.Techmerch.producto;

import java.math.BigDecimal;

public class Producto {
    private Integer idProducto;
    private Integer idCategoria;
    private String nombre;
    private String descripcion;
    private String tipoProducto;
    private BigDecimal precio;
    private Integer stock;
    private Boolean estado;

    // Constructores
    public Producto() {}

    public Producto(Integer idProducto, Integer idCategoria, String nombre,
                    String descripcion, String tipoProducto, BigDecimal precio,
                    Integer stock, Boolean estado) {
        this.idProducto = idProducto;
        this.idCategoria = idCategoria;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.tipoProducto = tipoProducto;
        this.precio = precio;
        this.stock = stock;
        this.estado = estado;
    }

    // Getters y Setters
    public Integer getIdProducto() { return idProducto; }
    public void setIdProducto(Integer idProducto) { this.idProducto = idProducto; }

    public Integer getIdCategoria() { return idCategoria; }
    public void setIdCategoria(Integer idCategoria) { this.idCategoria = idCategoria; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getTipoProducto() { return tipoProducto; }
    public void setTipoProducto(String tipoProducto) { this.tipoProducto = tipoProducto; }

    public BigDecimal getPrecio() { return precio; }
    public void setPrecio(BigDecimal precio) { this.precio = precio; }

    public Integer getStock() { return stock; }
    public void setStock(Integer stock) { this.stock = stock; }

    public Boolean getEstado() { return estado; }
    public void setEstado(Boolean estado) { this.estado = estado; }
}