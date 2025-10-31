package com.example.Techmerch.citatecnica;

import java.sql.Timestamp;

public class CitaTecnica {

    private Integer idCitaTecnica;
    private Integer idCliente;
    private Integer idEmpleado;
    private String servicio;
    private String estado;
    private String descripcion;
    private Timestamp fechaProgramada;
    private Timestamp fechaCreacion;

    // --- Atributos adicionales opcionales (para mostrar nombres) ---
    private String nombreCliente;
    private String nombreEmpleado;

    // --- Getters y Setters ---
    public Integer getIdCitaTecnica() { return idCitaTecnica; }
    public void setIdCitaTecnica(Integer idCitaTecnica) { this.idCitaTecnica = idCitaTecnica; }

    public Integer getIdCliente() { return idCliente; }
    public void setIdCliente(Integer idCliente) { this.idCliente = idCliente; }

    public Integer getIdEmpleado() { return idEmpleado; }
    public void setIdEmpleado(Integer idEmpleado) { this.idEmpleado = idEmpleado; }

    public String getServicio() { return servicio; }
    public void setServicio(String servicio) { this.servicio = servicio; }

    public String getEstado() { return estado; }
    public void setEstado(String estado) { this.estado = estado; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public Timestamp getFechaProgramada() { return fechaProgramada; }
    public void setFechaProgramada(Timestamp fechaProgramada) { this.fechaProgramada = fechaProgramada; }

    public Timestamp getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(Timestamp fechaCreacion) { this.fechaCreacion = fechaCreacion; }

    public String getNombreCliente() { return nombreCliente; }
    public void setNombreCliente(String nombreCliente) { this.nombreCliente = nombreCliente; }

    public String getNombreEmpleado() { return nombreEmpleado; }
    public void setNombreEmpleado(String nombreEmpleado) { this.nombreEmpleado = nombreEmpleado; }
}
