package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Category;
import com.example.demo.repository.CategoryRepository;

@Controller
public class HomeController {
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	HttpSession session;

	@RequestMapping("/home/index")
	public String index(Model model) {
		List<Category> categories = categoryRepository.findAll();
		session.setAttribute("categories", categories);
		return "layout/home";
	}
	@PreAuthorize("hasRole('ADMIN')")
	@RequestMapping({"admin","/admin/product/index"})
	public String list() {
		return "redirect:/admin/index.html";
	}
}
