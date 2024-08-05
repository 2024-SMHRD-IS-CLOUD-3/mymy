package com.mychu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.UsersEntity;
import com.mychu.mapper.UsersRepository;

@Controller
public class UsersController {
	
	@Autowired
	private UsersRepository repo;

	@RequestMapping("/")
	public String Main() {
		return "Main";
	}
	
	@RequestMapping("/goLogin")
	public String goLogin() {
		return "Login";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "Main";
	}
	
	@RequestMapping("/join")
	public String join(UsersEntity entity, HttpSession session) {
		
		entity = repo.save(entity);
		if(entity != null) {
			session.setAttribute("loginInfo", entity);
			System.out.println("회원가입 성공");
		}
		
		return "Login";
	}
	
	
	
	
}
