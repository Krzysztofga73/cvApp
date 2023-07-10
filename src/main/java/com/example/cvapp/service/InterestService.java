package com.example.cvapp.service;

import com.example.cvapp.model.EducationModel;
import com.example.cvapp.model.InterestModel;
import com.example.cvapp.repository.EducationRepository;
import com.example.cvapp.repository.InterestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class InterestService {
    private final InterestRepository interestRepository;

    public List<InterestModel> getInterest(){
        return interestRepository.findAll();
    }

    public void addInterest(InterestModel model){
        interestRepository.save(model);
    }

    public InterestModel findById(Long id){
        return interestRepository.findById(id).orElse(null);
    }

    public void editInterest(InterestModel editInterest){
        interestRepository.save(editInterest);
    }

    public void removeInterest(Long id){
        interestRepository.deleteById(id);
    }
}
