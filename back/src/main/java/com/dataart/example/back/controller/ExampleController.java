package com.dataart.example.back.controller;

import com.dataart.example.back.entity.FromTo;
import com.dataart.example.back.service.ExampleService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.net.http.HttpRequest;

@RestController
public class ExampleController {

    private final ExampleService service;

    public ExampleController(ExampleService service) {
        this.service = service;
    }

    @PostMapping("generate")
    public int generate(HttpServletRequest request, @RequestBody FromTo fromTo) {
        return service.generate(request, fromTo);
    }
}
