package com.example.demo.rest.controller;

import com.example.demo.entity.Account;
import com.example.demo.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rest/admin/account")
public class AdminAccountRestController {
    @Autowired
    AccountService accountService;

    @GetMapping
    public List<Account> finAllAccount() {
        return accountService.findAll();
    }

    @PostMapping
    public Account insert(@RequestBody Account account) {
//		Category category = categoryService.findById(product.getCategory().getId());
        return accountService.save(account);
    }

    @PutMapping
    public Account update(@RequestBody Account account) {
        return accountService.update(account);
    }

    @DeleteMapping("{id}")
    public void delete(Model model, @PathVariable("id") String id) {
        accountService.deleteById(id);
    }
}
