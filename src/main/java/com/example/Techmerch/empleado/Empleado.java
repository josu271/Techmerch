package com.example.Techmerch.empleado;

public class Empleado {
    private int idUsuario;
    private String nombre;
    private String apellido;
    private String direccion;
    private String celular;
    private String cargo;
    private Double salario;
    private String fechaContratacion;
    private String estadoEmpleado;

    // Constructor por defecto
    public Empleado() {}

    // Constructor
    public Empleado(int idUsuario, String nombre, String apellido, String direccion,
                    String celular, String cargo, Double salario, String fechaContratacion,
                    String estadoEmpleado) {
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

    // Getters y Setters
    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }
    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }
    public String getCelular() { return celular; }
    public void setCelular(String celular) { this.celular = celular; }
    public String getCargo() { return cargo; }
    public void setCargo(String cargo) { this.cargo = cargo; }
    public Double getSalario() { return salario; }
    public void setSalario(Double salario) { this.salario = salario; }
    public String getFechaContratacion() { return fechaContratacion; }
    public void setFechaContratacion(String fechaContratacion) { this.fechaContratacion = fechaContratacion; }
    public String getEstadoEmpleado() { return estadoEmpleado; }
    public void setEstadoEmpleado(String estadoEmpleado) { this.estadoEmpleado = estadoEmpleado; }
}