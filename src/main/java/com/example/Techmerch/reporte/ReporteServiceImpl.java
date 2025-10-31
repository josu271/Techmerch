package com.example.Techmerch.reporte;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class ReporteServiceImpl implements ReporteService {

    @Autowired
    private ReporteDAO reporteDAO;

    @Override
    public List<Map<String, Object>> ventasPorProducto() {
        return reporteDAO.obtenerVentasPorProducto();
    }

    @Override
    public List<Map<String, Object>> ventasSemanales() {
        return reporteDAO.obtenerVentasSemanales();
    }

    @Override
    public List<Map<String, Object>> top10PorCategoria() {
        return reporteDAO.obtenerTop10PorCategoria();
    }
}
