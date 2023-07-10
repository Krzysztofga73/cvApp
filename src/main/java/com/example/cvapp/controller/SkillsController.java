package com.example.cvapp.controller;

import com.example.cvapp.model.SkillsModel;
import com.example.cvapp.service.SkillsService;
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
public class SkillsController {

    private final SkillsService skillsService;

    @GetMapping("/skills")
    public String getSkills(Model model) {
        List<SkillsModel> skillsList = skillsService.getSkills();
        model.addAttribute("skillsModel", skillsList);
        return "cv/skills";
    }

    @PostMapping("/skills")
    public RedirectView addSkills(SkillsModel model) {
        skillsService.addSkills(model);
        return new RedirectView("/skills");
    }

    @GetMapping("/editSkills/{id}")
    public String getEditSkills(@PathVariable("id") Long id, Model model) {
        SkillsModel skillsModel = skillsService.findById(id);
        model.addAttribute("skillsModel", skillsModel);
        return "cv/editSkills";
    }

    @PostMapping("/editSkill/{id}")
    public RedirectView editSkills(SkillsModel model) {
        skillsService.editSkills(model);
        return new RedirectView("/skills");
    }

    @PostMapping("/delSkill/{id}")
    public RedirectView delExperience(@PathVariable("id") Long id) {
        skillsService.removeSkills(id);
        return new RedirectView("/skills");
    }

}
