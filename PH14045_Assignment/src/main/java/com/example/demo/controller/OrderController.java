package com.example.demo.controller;

import com.example.demo.entity.Account;
import com.example.demo.entity.Order;
import com.example.demo.entity.OrderDetail;
import com.example.demo.service.AccountService;
import com.example.demo.service.OrderDetailService;
import com.example.demo.service.OrderService;
import com.example.demo.service.ProductService;
import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/order")
@PreAuthorize("hasAnyRole('ADMIN','USER')")
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderDetailService;
	@Autowired
	AccountService accountService;
	@Autowired
	ProductService productService;
	Optional<Account> account;
	@RequestMapping("check")
	public String view() {
		return "order/check";
	}
	@RequestMapping("list")
	public String list(Model model, Principal principal) {
		account=accountService.findById(principal.getName());
		List<Order> orders = orderService.findByAccount(account.get());
		model.addAttribute("orders",orders);
		return "order/list";
	}
	@RequestMapping("detail/{id}")
	public String detail(Model model, @ModelAttribute("id") Integer id) {
		Order order = orderService.findById(id).get();
		List<OrderDetail> orderDetails = orderDetailService.findByOrder(order);
		model.addAttribute("orderDetails",orderDetails);
		return "order/detail";
	}
}
