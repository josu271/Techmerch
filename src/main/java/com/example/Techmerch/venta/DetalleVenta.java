package com.example.Techmerch.venta;

public class DetalleVenta {

    private Integer idDetalle;
    private Integer idProducto;
    private Integer idVentas;
    private Integer cantidad;
    private Double precioUnitario;
    private Double subtotal;

    public DetalleVenta() {
    }

    public DetalleVenta(Integer idDetalle, Integer idProducto, Integer idVentas,
                        Integer cantidad, Double precioUnitario, Double subtotal) {
        this.idDetalle = idDetalle;
        this.idProducto = idProducto;
        this.idVentas = idVentas;
        this.cantidad = cantidad;
        this.precioUnitario = precioUnitario;
        this.subtotal = subtotal;
    }

    public Integer getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(Integer idDetalle) {
        this.idDetalle = idDetalle;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public Integer getIdVentas() {
        return idVentas;
    }

    public void setIdVentas(Integer idVentas) {
        this.idVentas = idVentas;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public Double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(Double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public Double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }
}
