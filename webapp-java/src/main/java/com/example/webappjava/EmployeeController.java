package com.example.webappjava;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class EmployeeController {
    
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/users")
    public List<String> getUserNames() {
        return jdbcTemplate.queryForList("SELECT ENAME FROM EMP", String.class);
    }
}
