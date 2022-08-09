package com.example.demo.service;

import com.example.demo.entity.Authority;
import com.example.demo.repository.AuthorityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AuthorityService {
    @Autowired
    AuthorityRepository authorityRepository;
    public Authority save(Authority Authority){
        return authorityRepository.save(Authority);
    }

    public Optional<Authority> findById(Integer authority){
        return authorityRepository.findById(authority);
    }
}
