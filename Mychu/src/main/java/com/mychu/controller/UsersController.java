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
	public String login(Users entity, HttpSession session) {
		
		entity = repo.findByUserIdAndUserPw(entity.getUserId(), entity.getUserPw());
		if(entity != null) {
			session.setAttribute("loginInfo", entity);
			return "Main";
		} else {
			return "Login";
		}
	}
	
	@RequestMapping("/join")
	public String join(Users entity, HttpSession session) {
		
		entity = repo.save(entity);
		if(entity != null) {
			session.setAttribute("JoinInfo", entity);
			System.out.println("회원가입 성공");
		}
		
		return "Login";
	}
	
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) {
		
		session.removeAttribute("loginInfo");
		return "Main";
	}
	
	@RequestMapping("/gomy_Page")
	public String gomy_Page() {
		
		return "Main";
	}
	
	
}
