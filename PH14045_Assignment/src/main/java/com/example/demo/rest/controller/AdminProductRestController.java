package com.example.demo.rest.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.Product;
import com.example.demo.service.CategoryService;
import com.example.demo.service.ProductService;

@RestController
@PreAuthorize("hasRole('ADMIN')")
@RequestMapping("/rest/admin/product")
public class AdminProductRestController {
	@Autowired
	ProductService productService;
	@Autowired
	CategoryService categoryService;

	@GetMapping("/page/{page}")
	public List<Product> product(@PathVariable("page")Optional<Integer> page) {
		Pageable pageable = PageRequest.of(page.get(), 7);
		Page<Product> pagePro = productService.findPagination(pageable);
		List<Product> listPro = pagePro.getContent();
		return listPro;
	}
	
	@PostMapping
	public Product insert(@RequestBody Product product) {
		System.out.println(product.getCategory());
		System.out.println(product.getImage());
//		Category category = categoryService.findById(product.getCategory().getId());
		return productService.save(product);
	}

	@PutMapping
	public Product update(@RequestBody Product product) {
		return productService.update(product);
	}
	
	@GetMapping("{id}")
	public Product getById(Model model,@PathVariable("id") Integer id) {
		return productService.findById(id).get();
	}

	@DeleteMapping("{id}")
	public void delete(Model model,@PathVariable("id") Integer id) {
		productService.deleteById(id);

	}
	
}
