package com.example.cvapp.controller;

import com.example.cvapp.model.ExperienceModel;
import com.example.cvapp.service.ExperienceService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ExperienceController {

    private final ExperienceService experienceService;

    @GetMapping("/experience")
    public String getExperience(Model model) {
        List<ExperienceModel> expList = experienceService.getExperience();
        model.addAttribute("experienceModel", expList);
        return "cv/experience";
    }

    @PostMapping("/experience")
    public RedirectView addExperience(ExperienceModel expModel) {
        experienceService.addExperience(expModel);
        return new RedirectView("/experience");
    }

    @GetMapping("/editExperience/{id}")
    public String getEditExperience(@PathVariable("id") Long id, Model model) {
        ExperienceModel expModel = experienceService.findById(id);
        model.addAttribute("experienceModel", expModel);
        return "cv/editExperience";
    }

    @PostMapping("/editExp/{id}")
    public RedirectView editExperience(ExperienceModel expModel) {
        experienceService.editExperience(expModel);
        return new RedirectView("/experience");
    }

    @PostMapping("/delExp/{id}")
    public RedirectView delExperience(@PathVariable("id") Long id) {
        experienceService.removeExperience(id);
        return new RedirectView("/experience");
    }

}
