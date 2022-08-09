package com.example.demo.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Category;
import com.example.demo.entity.Product;
import com.example.demo.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	ProductRepository productRepository;
	
	public Product save(Product product){
		return productRepository.save(product);
	}
	
	public Product update(Product p) {
		Integer id = p.getId();
		if (id != null) {
			Optional<Product> towelUpdate = productRepository.findById(id);
			if (towelUpdate.isPresent()) {
				Date now = new Date();
				p.setCreateDate(now);
				return productRepository.save(p);
			}
		}
		return null;
	}
	
	public Optional<Product> findById(Integer id){
		return productRepository.findById(id);
	}
	
	public void deleteById(Integer id) {
		productRepository.deleteById(id);
	}
	
	public List<Product> findAll(){
		return productRepository.findAll();
	}

	public List<Product> findByCategory(Category cate){
		return productRepository.findByCategory(cate);
	}
	public Page<Product> findPagination(Pageable p){
		Page<Product> list = productRepository.findAll(p);
		return list;
	}
}
