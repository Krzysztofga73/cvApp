package com.example.cvapp.service;

import com.example.cvapp.model.ExperienceModel;
import com.example.cvapp.repository.ExperienceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExperienceService {


    private final ExperienceRepository expRepository;

    public List<ExperienceModel> getExperience() {
        return expRepository.findAll();
    }

    public void addExperience(ExperienceModel experience) {
        expRepository.save(experience);
    }

    public ExperienceModel findById(Long id) {
        return expRepository.findById(id).orElse(null);
    }

    public void editExperience(ExperienceModel editExp) {
        expRepository.save(editExp);
    }

    public void removeExperience(Long id) {
        expRepository.deleteById(id);
    }


}
