package com.k8s.springdeployement.controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.io.InputStreamReader;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello() throws IOException {
        // Load and return the contents of the "index.html" file from the "static" directory
        Resource resource = new ClassPathResource("static/index.html");
        InputStreamReader reader = new InputStreamReader(resource.getInputStream());
        char[] charArray = new char[1024];
        StringBuilder stringBuilder = new StringBuilder();
        int bytesRead;
        while ((bytesRead = reader.read(charArray)) != -1) {
            stringBuilder.append(charArray, 0, bytesRead);
        }
        return stringBuilder.toString();
    }
}
