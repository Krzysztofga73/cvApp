package com.example.cvapp.repository;

import com.example.cvapp.model.EducationModel;
import com.example.cvapp.model.SkillsModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SkillsRepository extends JpaRepository<SkillsModel, Long> {
}
