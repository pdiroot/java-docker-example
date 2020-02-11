package com.dataart.example.back.service;

import com.dataart.example.back.repository.ExampleRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;

@Service
public class HealthCheckService {

    private final ExampleRepository repository;

    public HealthCheckService(ExampleRepository repository) {
        this.repository = repository;
    }

    public HttpStatus testDataBaseConnection() {
        return repository.testDataBaseConnection();
    }
}
