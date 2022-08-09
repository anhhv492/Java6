package com.example.demo.rest.controller;

import com.example.demo.entity.Product;
import com.example.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest/product")
public class ProductRestController {
    @Autowired
    ProductService productService;
    //add cart
    @GetMapping("add/{id}")
    public Product add(@PathVariable("id") Integer id){
        return productService.findById(id).get();
    }
}
