package com.example.cvapp.service;

import com.example.cvapp.model.PersonModel;
import com.example.cvapp.repository.PersonRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class PersonService {
    private final PersonRepository personRepository;

    public List<PersonModel> getPerson(){
        return personRepository.findAll();
    }

}
