package com.example.demo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.example.demo.service.UserService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class AuthConfig extends WebSecurityConfigurerAdapter{
	//ma hoa pass
	@Bean
	public BCryptPasswordEncoder getBCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Autowired
	UserService userService;
	//quan ly du lieu nguoi su dung
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// CSRF, CORS
		http.csrf().disable().cors().disable();
		// phan quyền sử dụng
		//dieu khien lỗi truy cập ko đúng vai trò
		http.exceptionHandling()
			.accessDeniedPage("/auth/denied");
			//giao dien dang nhap
		http.formLogin() 
			.loginPage("/auth/login/form")
			.loginProcessingUrl("/auth/login")
			// if page==login > successs
			.defaultSuccessUrl("/home/index",false)
			.failureUrl("/auth/login/error")
			.usernameParameter("username")
			.passwordParameter("password");
		http.rememberMe().rememberMeParameter("remember");
		// logout
		http.logout().logoutUrl("/auth/logoff")
			.logoutSuccessUrl("/auth/logoff/success");
	}
}
