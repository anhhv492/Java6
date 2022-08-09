package com.example.demo.service;

import com.example.demo.entity.Account;
import com.example.demo.entity.Order;
import com.example.demo.entity.OrderDetail;
import com.example.demo.repository.AccountRepository;
import com.example.demo.repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderDetailService {
    @Autowired
    OrderDetailRepository orderDetailRepository;

    public OrderDetail save(OrderDetail orderDetail){
        return orderDetailRepository.save(orderDetail);
    }

    public List<OrderDetail> saveAll(List<OrderDetail> orderDetail){
        return orderDetailRepository.saveAll(orderDetail);
    }
    public Optional<OrderDetail> findById(Integer id){

        return orderDetailRepository.findById(id);
    }
    public List<OrderDetail> findByOrder(Order order){
        return orderDetailRepository.findByOrder(order);
    }
}
