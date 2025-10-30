package com.example.Techmerch.usuario;
import java.sql.Timestamp;


public class Usuario {

    private Integer idUsuario;
    private Integer dni;
    private String correo;
    private String contrasena;
    private String tipoUsuario; // cliente o empleado
    private Boolean estado;
    private Timestamp fechaRegistro;
    private Timestamp ultimoLogin;

    // --- Getters y Setters ---
    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public Integer getDni() {
        return dni;
    }

    public void setDni(Integer dni) {
        this.dni = dni;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getTipoUsuario() {
        return tipoUsuario;
    }

    public void setTipoUsuario(String tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Timestamp fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public Timestamp getUltimoLogin() {
        return ultimoLogin;
    }

    public void setUltimoLogin(Timestamp ultimoLogin) {
        this.ultimoLogin = ultimoLogin;
    }
}