package com.example.Techmerch.empleado;

import java.time.LocalDate;

public class Empleado {

    private Integer idUsuario;
    private String nombre;
    private String apellido;
    private String direccion;
    private String celular;
    private String cargo;
    private Double salario;
    private LocalDate fechaContratacion;
    private String estadoEmpleado;

    public Empleado() {
    }

    public Empleado(Integer idUsuario, String nombre, String apellido, String direccion, String celular,
                    String cargo, Double salario, LocalDate fechaContratacion, String estadoEmpleado) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.celular = celular;
        this.cargo = cargo;
        this.salario = salario;
        this.fechaContratacion = fechaContratacion;
        this.estadoEmpleado = estadoEmpleado;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public Double getSalario() {
        return salario;
    }

    public void setSalario(Double salario) {
        this.salario = salario;
    }

    public LocalDate getFechaContratacion() {
        return fechaContratacion;
    }

    public void setFechaContratacion(LocalDate fechaContratacion) {
        this.fechaContratacion = fechaContratacion;
    }

    public String getEstadoEmpleado() {
        return estadoEmpleado;
    }

    public void setEstadoEmpleado(String estadoEmpleado) {
        this.estadoEmpleado = estadoEmpleado;
    }
}
