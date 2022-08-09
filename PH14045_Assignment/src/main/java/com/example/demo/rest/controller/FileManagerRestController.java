package com.example.demo.rest.controller;

import java.io.File;
import java.util.List;
import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.entity.Category;
import com.example.demo.entity.Product;
import com.example.demo.service.CategoryService;
import com.example.demo.service.FileManagerService;
import com.example.demo.service.ProductService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

@RestController
@PreAuthorize("hasRole('ADMIN')")
@RequestMapping("/rest/files")
public class FileManagerRestController {
	@Autowired
	FileManagerService fileService;
	@GetMapping("{folder}/{file}")
	public byte[] download(@PathVariable("folder") String folder,@PathVariable("file") String file) {
		return fileService.read(folder,file);
	}
	@PostMapping("/{folder}")
	public JsonNode upload(@PathVariable("folder") String folder,@PathParam("file") MultipartFile file) {
		System.out.println(file.getOriginalFilename());
		File saveFile = fileService.save(file, folder);
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode node = mapper.createObjectNode();
		node.put("name", saveFile.getName());
		node.put("size", saveFile.length());
		
		return node;
	}
	@DeleteMapping("{folder}/{file}")
	public void delete(@PathVariable("folder") String folder,@PathVariable("file") String file) {
		fileService.delete(folder,file);
	}
	@GetMapping("{folder}")
	public List<String> list(@PathVariable("folder") String folder){
		return fileService.list(folder);
	}
}
