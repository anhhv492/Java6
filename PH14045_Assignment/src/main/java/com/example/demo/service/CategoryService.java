package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Category;
import com.example.demo.repository.CategoryRepository;

@Service
public class CategoryService {
	@Autowired
	CategoryRepository categoryRepository;
	
	public Category save(Category category){
		return categoryRepository.save(category);
	}

	public Category update(Category p) {
		Integer id = p.getId();
		if (id != null) {
			Optional<Category> towelUpdate = categoryRepository.findById(id);
			if (towelUpdate.isPresent()) {
				return categoryRepository.save(p);
			}
		}
		return null;
	}
	public Optional<Category> findByName(String name){
		return categoryRepository.findByName(name);
	}
	public Optional<Category> findById(Integer id){
		return categoryRepository.findById(id);
	}
	
	public void deleteById(Integer id) {
		categoryRepository.deleteById(id);
	}
	
	public List<Category> findAll(){
		return categoryRepository.findAll();
	}
}
