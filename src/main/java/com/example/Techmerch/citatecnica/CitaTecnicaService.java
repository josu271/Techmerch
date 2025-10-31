package com.example.Techmerch.citatecnica;

import java.util.List;

public interface CitaTecnicaService {
    List<CitaTecnica> listarTodas();
    CitaTecnica buscarPorId(int id);
    void agregar(CitaTecnica cita);
    void actualizar(CitaTecnica cita);
    void eliminar(int id);
}
