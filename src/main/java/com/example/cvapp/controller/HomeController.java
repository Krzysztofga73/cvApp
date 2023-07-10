package com.example.cvapp.controller;

import com.example.cvapp.model.PersonModel;
import com.example.cvapp.service.EducationService;
import com.example.cvapp.service.PersonService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final PersonService personService;

    @GetMapping("/")
    public String getHome(Model model){
        List<PersonModel> persons = personService.getPerson();
        model.addAttribute("personModel", persons);
        return "index";
    }

}
