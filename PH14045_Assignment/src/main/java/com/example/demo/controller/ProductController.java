package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.Category;
import com.example.demo.entity.Product;
import com.example.demo.service.CategoryService;
import com.example.demo.service.ProductService;

@Controller
@RequestMapping("/product/")
public class ProductController {
	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;
	
	Integer idPr;
	@RequestMapping("list")
	public String list(Model model) {
		List<Product> products=productService.findAll();
		model.addAttribute("products",products);
		return "product/list";
	}
	@RequestMapping("list/{id}")
	public String viewByIdCate(Model model,@PathVariable("id") Integer id) {
		Optional<Category> cate = categoryService.findById(id);
		List<Product> products=productService.findByCategory(cate.get());
		for (Product p:products) {
			if(p.getCount()<=0) {
				products.remove(p);
			}
		}
		if(products.isEmpty()) {
			products=null;
		}
		model.addAttribute("products",products);
		return "product/view";
	}
	@RequestMapping("detail/{id}")
	public String detail(Model model,@PathVariable("id") Integer id) {
		Optional<Product> product = productService.findById(id);
		model.addAttribute("detail",product.get());
		return "product/detail";
	}
	
	
}
