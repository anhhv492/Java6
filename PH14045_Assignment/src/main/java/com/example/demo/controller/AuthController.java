package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import com.example.demo.entity.Authority;
import com.example.demo.entity.Role;
import com.example.demo.service.AccountService;
import com.example.demo.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import com.example.demo.entity.Account;

import java.util.Optional;

@Controller
@RequestMapping("/auth/")
public class AuthController {
	@Autowired
	HttpSession session;
	@Autowired
	AccountService accountService;
	@Autowired
	AuthorityService authorityService;
	//
	@RequestMapping("login/form")
	public String loginForm(Model model, @ModelAttribute("account") Account account) {
		return "auth/login";
	}
	@PostMapping("login")
	public String login(Model model, @Validated @ModelAttribute("account") Account account, Errors error) {
		session.setAttribute("account",account);
		return "auth/login";
	}
	@RequestMapping("login/success")
	public String loginSuccess(Model model) {

		return "forward:/home/index";
	}
	@RequestMapping("login/error")
	public String loginError(Model model,@Validated @ModelAttribute("account") Account account, Errors error) {
		if(error.hasErrors()) {
			model.addAttribute("mess","Tài khoản hoặc mật khẩu không đúng");
			return "auth/login";
		}
		return "auth/login";
	}
	@RequestMapping("signup/form")
	public String signupForm(Model model) {
		return "auth/signup";
	}
	@RequestMapping("signup")
	@ResponseBody
	public Account signup(Model model, @RequestBody Account account) {
		Optional<Account> newAcc = accountService.findById(account.getUsername());
		try{
			if(newAcc.isEmpty()){
				accountService.save(account);
				System.out.println("ok");
				Authority au=new Authority();
				Role role = new Role();
				role.setName("USER");
				role.setId("USER");
				au.setAccount(account);
				au.setRole(role);
				authorityService.save(au);
				return account;
			}else {
				System.out.println("not");
				return null;
			}
		}catch (Exception e){
			throw new RuntimeException();
		}
	}
	@RequestMapping("denied")
	public String denied(Model model) {
		model.addAttribute("mess","Bạn không có quyền truy cập!");
		return "forward:/auth/login/form";
	}
	@RequestMapping("logoff")
	public void logoff(Model model) {
	}
	@RequestMapping("logoff/success")
	public String logoffSuccess(Model model) {
		model.addAttribute("logoff","Đăng xuất thành công!");
		return "forward:/auth/login/form";
	}
}
