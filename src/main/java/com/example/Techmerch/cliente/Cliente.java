package com.example.Techmerch.cliente;

public class Cliente {
    private int idUsuario;
    private String nombre;
    private String apellido;
    private String direccion;
    private String celular;
    private String fechaNacimiento;
    private int dni;

    // Constructor por defecto
    public Cliente() {}

    // Constructor
    public Cliente(int idUsuario, String nombre, String apellido, String direccion,
                   String celular, String fechaNacimiento, int dni) {
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.celular = celular;
        this.fechaNacimiento = fechaNacimiento;
        this.dni = dni;
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
    public String getFechaNacimiento() { return fechaNacimiento; }
    public void setFechaNacimiento(String fechaNacimiento) { this.fechaNacimiento = fechaNacimiento; }
    public int getDni() { return dni; }
    public void setDni(int dni) { this.dni = dni; }
}