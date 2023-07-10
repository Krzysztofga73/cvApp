package com.example.cvapp.repository;

import com.example.cvapp.model.InterestModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InterestRepository extends JpaRepository<InterestModel, Long> {
}
