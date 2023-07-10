package com.example.cvapp.repository;

import com.example.cvapp.model.EducationModel;
import com.example.cvapp.model.ExperienceModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExperienceRepository extends JpaRepository<ExperienceModel, Long> {
}
