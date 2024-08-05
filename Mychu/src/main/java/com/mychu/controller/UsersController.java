package com.mychu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.UsersEntity;

@Controller
public class UsersController {
	
	@Autowired
	private MemberRepository repo;

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
		
		entity = repo.save;
		if(entity != null) {
			session.setAttribute("loginInfo", entity);
		}
		
		return "Join";
	}
	
	
	
	
}
