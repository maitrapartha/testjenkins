package com.partha.helloservice.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/greeting")
    public ResponseEntity<String> greetUser(){
        return ResponseEntity.ok().body("welcome");
    }
}
