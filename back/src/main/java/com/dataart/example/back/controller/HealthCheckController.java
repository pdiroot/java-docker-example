package com.dataart.example.back.controller;

import com.dataart.example.back.service.HealthCheckService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HealthCheckController {

    private final HealthCheckService service;

    public HealthCheckController(HealthCheckService service) {
        this.service = service;
    }

    @GetMapping("health/live")
    public HttpStatus live() {
        return HttpStatus.OK;
    }

    @GetMapping("health/ready")
    public HttpStatus ready() {
        return service.testDataBaseConnection();
    }
}
