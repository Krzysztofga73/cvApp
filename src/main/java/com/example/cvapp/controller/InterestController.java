package com.example.cvapp.controller;

import com.example.cvapp.model.EducationModel;
import com.example.cvapp.model.InterestModel;
import com.example.cvapp.service.EducationService;
import com.example.cvapp.service.InterestService;
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
public class InterestController {

    private final InterestService interestService;

    @GetMapping("/interest")
    public String getInterest(Model model){
        List<InterestModel> intList = interestService.getInterest();
        model.addAttribute("interestModel", intList);
        return "cv/interests";
    }

    @PostMapping("/interest")
    public RedirectView addInterest(InterestModel model){
        interestService.addInterest(model);
        return new RedirectView("/interest");
    }

    @GetMapping ("/editInterest/{id}")
    public String getEditEducation(@PathVariable("id") Long id, Model model){
        InterestModel interestModel = interestService.findById(id);
        model.addAttribute("interestModel", interestModel);
        return "cv/editInterests";
    }
    @PostMapping("/editInterest/{id}")
    public RedirectView editInterest(InterestModel intModel){
        interestService.editInterest(intModel);
        return new RedirectView("/interest");
    }

    @PostMapping("/delInt/{id}")
    public RedirectView delInterest(@PathVariable("id") Long id){
        interestService.removeInterest(id);
        return new RedirectView("/interest");
    }


}
