package com.example.Techmerch.venta;

import com.example.Techmerch.cliente.Cliente;
import com.example.Techmerch.empleado.Empleado;
import java.time.LocalDateTime;

public class Venta {
    private int idVenta;
    private int idCliente;
    private int idEmpleado;
    private LocalDateTime fechaVenta;
    private String metodoPago;
    private double total;
    private String estadoVenta;

    private Cliente cliente;
    private Empleado empleado;

    // Constructor por defecto (IMPORTANTE para Spring)
    public Venta() {}

    // Constructor original (para compatibilidad)
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

    // Constructor con objetos completos
    public Venta(int idVenta, int idCliente, int idEmpleado, LocalDateTime fechaVenta,
                 String metodoPago, double total, String estadoVenta,
                 Cliente cliente, Empleado empleado) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
        this.fechaVenta = fechaVenta;
        this.metodoPago = metodoPago;
        this.total = total;
        this.estadoVenta = estadoVenta;
        this.cliente = cliente;
        this.empleado = empleado;
    }

    // Getters y Setters
    public int getIdVenta() { return idVenta; }
    public void setIdVenta(int idVenta) { this.idVenta = idVenta; }
    public int getIdCliente() { return idCliente; }
    public void setIdCliente(int idCliente) { this.idCliente = idCliente; }
    public int getIdEmpleado() { return idEmpleado; }
    public void setIdEmpleado(int idEmpleado) { this.idEmpleado = idEmpleado; }
    public LocalDateTime getFechaVenta() { return fechaVenta; }
    public void setFechaVenta(LocalDateTime fechaVenta) { this.fechaVenta = fechaVenta; }
    public String getMetodoPago() { return metodoPago; }
    public void setMetodoPago(String metodoPago) { this.metodoPago = metodoPago; }
    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }
    public String getEstadoVenta() { return estadoVenta; }
    public void setEstadoVenta(String estadoVenta) { this.estadoVenta = estadoVenta; }

    public Cliente getCliente() { return cliente; }
    public void setCliente(Cliente cliente) { this.cliente = cliente; }
    public Empleado getEmpleado() { return empleado; }
    public void setEmpleado(Empleado empleado) { this.empleado = empleado; }
}