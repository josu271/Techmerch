package com.example.Techmerch.citatecnica;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class CitaTecnicaServiceImpl implements CitaTecnicaService {

    @Autowired
    private CitaTecnicaDAO citaTecnicaDAO;

    private static final Logger logger = LoggerFactory.getLogger(CitaTecnicaServiceImpl.class);

    @Override
    public List<CitaTecnica> listarTodas() {
        List<CitaTecnica> citas = citaTecnicaDAO.listarTodas();
        logger.info("Número de citas encontradas: {}", citas.size());
        if (citas.isEmpty()) {
            logger.warn("No se encontraron citas técnicas en la base de datos");
        }
        return citas;
    }

    @Override
    public CitaTecnica buscarPorId(int id) {
        return citaTecnicaDAO.buscarPorId(id);
    }

    @Override
    public void agregar(CitaTecnica cita) {
        citaTecnicaDAO.agregar(cita);
    }

    @Override
    public void actualizar(CitaTecnica cita) {
        citaTecnicaDAO.actualizar(cita);
    }

    @Override
    public void eliminar(int id) {
        citaTecnicaDAO.eliminar(id);
    }
}
