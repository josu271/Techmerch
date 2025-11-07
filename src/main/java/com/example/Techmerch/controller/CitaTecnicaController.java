package com.example.Techmerch.controller;

import com.example.Techmerch.citatecnica.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String guardar(@ModelAttribute CitaTecnica cita, RedirectAttributes redirectAttributes) {
        citaTecnicaService.agregar(cita);
        redirectAttributes.addFlashAttribute("message", "Cita técnica agregada exitosamente");
        return "redirect:/citastecnica";
    }

    @GetMapping("/editar/{id}")
    public String mostrarFormularioEditar(@PathVariable int id, Model model) {
        CitaTecnica cita = citaTecnicaService.buscarPorId(id);
        model.addAttribute("cita", cita);
        return "private/citas_tecnica/citastecnicaeditar";
    }

    @PostMapping("/editar")
    public String actualizar(@ModelAttribute CitaTecnica cita, RedirectAttributes redirectAttributes) {
        citaTecnicaService.actualizar(cita);
        redirectAttributes.addFlashAttribute("message", "Cita técnica actualizada exitosamente");
        return "redirect:/citastecnica";
    }

    @GetMapping("/eliminar/{id}")
    public String eliminar(@PathVariable int id, RedirectAttributes redirectAttributes) {
        citaTecnicaService.eliminar(id);
        redirectAttributes.addFlashAttribute("message", "Cita técnica eliminada exitosamente");
        return "redirect:/citastecnica";
    }
}