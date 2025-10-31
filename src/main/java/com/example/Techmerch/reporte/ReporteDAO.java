package com.example.Techmerch.reporte;

import java.util.List;
import java.util.Map;

public interface ReporteDAO {
    List<Map<String, Object>> obtenerVentasPorProducto();
    List<Map<String, Object>> obtenerVentasSemanales();
    List<Map<String, Object>> obtenerTop10PorCategoria();
}
