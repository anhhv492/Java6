package com.example.demo.service;

import com.example.demo.entity.Account;
import com.example.demo.entity.Order;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderService {
    @Autowired
    OrderRepository orderRepository;

    public List<Order> findByAccount(Account account){
        return orderRepository.findByAccount(account);
    }
    public Order save(Order order){
        return orderRepository.save(order);
    }

    public Optional<Order> findById(Integer id){
        return orderRepository.findById(id);
    }
}
