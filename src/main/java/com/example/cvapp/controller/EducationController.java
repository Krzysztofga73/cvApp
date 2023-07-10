package com.example.cvapp.controller;

import com.example.cvapp.model.EducationModel;
import com.example.cvapp.service.EducationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class EducationController {
    private final EducationService educationService;

    @GetMapping("/education")
    public String getEducation(Model model){
        List<EducationModel> eduList = educationService.getEducation();
        model.addAttribute("educationModel", eduList);
        return "cv/education";
    }

    @PostMapping("/education")
    public RedirectView addEducation(EducationModel eduModel){
        educationService.addEducation(eduModel);
        return new RedirectView("/education");
    }

    @GetMapping ("/editEducation/{id}")
    public String getEditEducation(@PathVariable("id") Long id, Model model){
        EducationModel educationModel = educationService.findById(id);
        model.addAttribute("educationModel", educationModel);
        return "cv/editEducation";
    }
    @PostMapping("/edit/{id}")
    public RedirectView editEducation(EducationModel eduModel){
        educationService.editEducation(eduModel);
        return new RedirectView("/education");
    }

    @PostMapping("/del/{id}")
    public RedirectView delEducation(@PathVariable("id") Long id){
        educationService.removeEducation(id);
        return new RedirectView("/education");
    }





}
