package com.example.Techmerch.controller;

import com.example.Techmerch.citatecnica.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/citastecnica")
public class CitaTecnicaController {

    @Autowired
    private CitaTecnicaService citaTecnicaService;

    @GetMapping
    public String listar(Model model) {
        model.addAttribute("citas", citaTecnicaService.listarTodas());
        return "private/citas_tecnica/citastecnica";
    }

    @GetMapping("/agregar")
    public String mostrarFormularioAgregar(Model model) {
        model.addAttribute("cita", new CitaTecnica());
        return "private/citas_tecnica/citastecnicaagregar";
    }

    @PostMapping("/agregar")
    public String guardar(@ModelAttribute CitaTecnica cita) {
        citaTecnicaService.agregar(cita);
        return "redirect:/citastecnica";
    }

    @GetMapping("/editar/{id}")
    public String mostrarFormularioEditar(@PathVariable int id, Model model) {
        model.addAttribute("cita", citaTecnicaService.buscarPorId(id));
        return "private/citas_tecnica/citastecnicaeditar";
    }

    @PostMapping("/editar")
    public String actualizar(@ModelAttribute CitaTecnica cita) {
        citaTecnicaService.actualizar(cita);
        return "redirect:/citastecnica";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable int id) {
        citaTecnicaService.eliminar(id);
        return "redirect:/citastecnica";
    }
}
