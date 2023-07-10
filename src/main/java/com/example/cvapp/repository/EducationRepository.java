package com.example.cvapp.repository;

import com.example.cvapp.model.EducationModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EducationRepository extends JpaRepository<EducationModel, Long> {
}
