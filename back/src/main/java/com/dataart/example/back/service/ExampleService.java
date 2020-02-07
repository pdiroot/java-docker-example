package com.dataart.example.back.service;

import com.dataart.example.back.entity.FromTo;
import com.dataart.example.back.repository.ExampleRepository;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.concurrent.ThreadLocalRandom;

@Service
public class ExampleService {

    private final ExampleRepository repository;
    private final RequestParser parser;

    public ExampleService(ExampleRepository repository, RequestParser parser) {
        this.repository = repository;
        this.parser = parser;
    }

    public int generate(HttpServletRequest request, FromTo fromTo) {
        String ipAddress = parser.getIPAddressFromRequest(request);
        int result = ThreadLocalRandom.current().nextInt(fromTo.getFrom(), fromTo.getTo());
        repository.writeResult(ipAddress, result);
        return result;
    }
}
