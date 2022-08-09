package com.example.demo.rest.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.demo.entity.Category;
import com.example.demo.service.CategoryService;

@RestController
@PreAuthorize("hasRole('ADMIN')")
@RequestMapping("/rest/admin/category")
public class AdminCategoryRestController {
	@Autowired
	CategoryService categoryService;
	//data of admin product
	@GetMapping
	public List<Category> categories() {
		return categoryService.findAll();
	}

	@PostMapping
	public Category insert(@RequestBody Category category) {
		Optional<Category> cate = categoryService.findByName(category.getName());
		if(cate.isEmpty()){
			return categoryService.save(category);
		}else{
			return null;
		}
	}

	@PutMapping
	public Category update(@RequestBody Category category) {
		return categoryService.update(category);
	}

	@GetMapping("{id}")
	public Category getById(Model model,@PathVariable("id") Integer id) {
		return categoryService.findById(id).get();
	}

	@DeleteMapping("{id}")
	public void delete(Model model,@PathVariable("id") Integer id) {
		categoryService.deleteById(id);
	}

//	@GetMapping("add/{id}")
//	public Category add(Model model,@PathVariable("id") Integer id) {
//		return categoryService.findById(id).get();
//	}
}
