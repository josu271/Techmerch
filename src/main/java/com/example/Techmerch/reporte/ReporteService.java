package com.example.Techmerch.reporte;

import java.util.List;
import java.util.Map;

public interface ReporteService {
    List<Map<String, Object>> ventasPorProducto();
    List<Map<String, Object>> ventasSemanales();
    List<Map<String, Object>> top10PorCategoria();
}
