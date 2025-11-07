package com.example.Techmerch.cliente;

import java.util.List;

public interface ClienteDAO {
    List<Cliente> listarClientes();
    Cliente obtenerClientePorId(int id);
}