package com.example.demo.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.NotFound;
import org.springframework.validation.annotation.Validated;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NonNull;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Accounts")
@NoArgsConstructor
@AllArgsConstructor
public class Account  implements Serializable{
	@Id
	@NotBlank(message = "Không để trống username!")
	String username;
	@NotBlank(message = "Không để trống password!")
	String password;
	@NotBlank(message = "Không để trống tên!")
	String fullname;
	@NotBlank(message = "Không để trống email!")
	@Email(message = "Vui lòng điền đúng định dạng email!")
	String email;
	String photo;
	@JsonIgnore
	@OneToMany(mappedBy = "account")
	List<Order> orders;
	
	@JsonIgnore
	@OneToMany(mappedBy = "account", fetch = FetchType.EAGER)
	List<Authority> authorities;
}
