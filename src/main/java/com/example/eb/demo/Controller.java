package com.example.eb.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping("/")
    public String index() {
        return "Hello Elastic Beanstalk V4 (Clone env)!";
    }
}
