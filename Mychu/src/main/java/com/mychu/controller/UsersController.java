package com.mychu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.Users;
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
	public String login(Users entity) {
		
		entity = repo.findByUserIdAndUserPw(entity.getUserId(), entity.getUserPw());
		if(entity != null) {
			System.out.println("로그인 성공");
			System.out.println("로그인 info :" + entity.toString());
			return "Main";
		} else {
			return "Login";
		}
	}
	
	@RequestMapping("/join")
	public String join(Users entity, HttpSession session) {
		
		entity = repo.save(entity);
		if(entity != null) {
			session.setAttribute("loginInfo", entity);
			System.out.println("회원가입 성공");
		}
		
		return "Login";
	}
	
	
	
	
}
