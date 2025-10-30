package com.example.Techmerch.venta;

import java.time.LocalDateTime;

public class Venta {
    private int idVenta;  // Campo en minúsculas (convención Java)
    private int idCliente;
    private int idEmpleado;
    private LocalDateTime fechaVenta;
    private String metodoPago;
    private double total;
    private String estadoVenta;

    // Constructor
    public Venta(int idVenta, int idCliente, int idEmpleado, LocalDateTime fechaVenta,
                 String metodoPago, double total, String estadoVenta) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
        this.fechaVenta = fechaVenta;
        this.metodoPago = metodoPago;
        this.total = total;
        this.estadoVenta = estadoVenta;
    }

    // Getters y Setters (IMPORTANTES)
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public LocalDateTime getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(LocalDateTime fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstadoVenta() {
        return estadoVenta;
    }

    public void setEstadoVenta(String estadoVenta) {
        this.estadoVenta = estadoVenta;
    }
}