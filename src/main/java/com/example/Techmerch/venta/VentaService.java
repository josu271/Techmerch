package com.example.Techmerch.venta;

import java.util.List;

public interface VentaService {
    List<Venta> listarVentas();
    Venta obtenerVentaPorId(int id);
    void crearVenta(Venta venta);
}
