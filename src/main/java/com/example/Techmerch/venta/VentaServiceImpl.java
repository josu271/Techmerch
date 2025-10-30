package com.example.Techmerch.venta;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class VentaServiceImpl implements VentaService {

    @Autowired
    private VentaDAO ventaDAO;

    @Override
    public List<Venta> listarVentas() {
        return ventaDAO.listarVentas();
    }

    @Override
    public Venta obtenerVentaPorId(int id) {
        return ventaDAO.obtenerVentaPorId(id);
    }

    @Override
    public void crearVenta(Venta venta) {
        ventaDAO.crearVenta(venta);
    }
}
