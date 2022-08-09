package com.example.demo.rest.controller;

import aj.org.objectweb.asm.TypeReference;
import com.example.demo.entity.Account;
import com.example.demo.entity.Order;
import com.example.demo.entity.OrderDetail;
import com.example.demo.entity.Product;
import com.example.demo.service.*;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/rest/order")
@PreAuthorize("hasAnyRole('ADMIN','USER')")
public class OrderRestController {
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    AccountService accountService;
    @Autowired
    ProductService productService;
    Order order;
    Optional<Account> account;
    @PostMapping("/cart")
    public Order orderInfo(@RequestBody Order or, Principal principal){
        String name=principal.getName();
        account = accountService.findById(name);
        order=or;
        order.setAccount(account.get());
        orderService.save(order);
        return order;
    }
    @PostMapping
    public JsonNode cartItems(@RequestBody JsonNode productList){
        ObjectMapper mapper=new ObjectMapper();
        OrderDetail orderDetail =null;
        for (int i=0;i<productList.size();i++){
            orderDetail = new OrderDetail();
            Product product = productService.findById(productList.get(i).get("id").asInt()).get();
            orderDetail.setOrder(order);
            orderDetail.setProduct(product);
            orderDetail.setPrice(productList.get(i).get("price").asDouble());
            orderDetail.setQuantity(productList.get(i).get("qty").asInt());
            orderDetailService.save(orderDetail);
        };
        return productList;
    }

}
