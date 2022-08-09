package com.example.demo.service;

import com.example.demo.entity.Account;
import com.example.demo.entity.Product;
import com.example.demo.repository.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AccountService {
    @Autowired
    AccountRepository accountRepository;

    public Account save(Account account){
        return accountRepository.save(account);
    }
    public Account update(Account account) {
        String id = account.getUsername();
        if (id != null) {
            Optional<Account> towelUpdate = accountRepository.findById(id);
            if (towelUpdate.isPresent()) {
                return accountRepository.save(account);
            }
        }
        return null;
    }
    public void deleteById(String username){
        accountRepository.deleteById(username);
    }
    public List<Account> findAll(){
        return accountRepository.findAll();
    }
    public Optional<Account> findById(String username){
        return accountRepository.findById(username);
    }
}
