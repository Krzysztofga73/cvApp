package com.example.cvapp.service;

import com.example.cvapp.model.EducationModel;
import com.example.cvapp.repository.EducationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class EducationService {

    private final EducationRepository eduRepository;

    public List<EducationModel> getEducation(){
        return eduRepository.findAll();
    }

    public void addEducation(EducationModel education){
        eduRepository.save(education);
    }

    public EducationModel findById(Long id){
        return eduRepository.findById(id).orElse(null);
    }

    public void editEducation(EducationModel editEdu){
        eduRepository.save(editEdu);
    }

    public void removeEducation(Long id){
        eduRepository.deleteById(id);
    }




}
