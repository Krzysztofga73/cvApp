package com.example.cvapp.service;

import com.example.cvapp.model.ExperienceModel;
import com.example.cvapp.model.SkillsModel;
import com.example.cvapp.repository.ExperienceRepository;
import com.example.cvapp.repository.SkillsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class SkillsService {
    private final SkillsRepository skillsRepository;

    public List<SkillsModel> getSkills() {
        return skillsRepository.findAll();
    }

    public void addSkills(SkillsModel skills) {
        skillsRepository.save(skills);
    }

    public SkillsModel findById(Long id) {
        return skillsRepository.findById(id).orElse(null);
    }

    public void editSkills(SkillsModel editSkill) {
        skillsRepository.save(editSkill);
    }

    public void removeSkills(Long id) {
        skillsRepository.deleteById(id);
    }

}
