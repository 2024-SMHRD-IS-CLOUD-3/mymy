package com.mychu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.Users;
import com.mychu.mapper.UsersRepository;

@Controller
public class UsersController {
	
	@Autowired
	private UsersRepository repo;

	@RequestMapping("/")
	public String Main() {
		return "redirect:/main";
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
			return "redirect:/";
		} else {
			return "Login";
		}
	}
	
	@RequestMapping("/join")
	public String join(Users entity, HttpSession session) {
		
		if(repo.findByUserId(entity.getUserId()) != null) {
			System.out.println("실패");
			return "redirect:/";
		}
		entity = repo.save(entity);
		if(entity!=null) {
		session.setAttribute("JoinInfo", entity);
		}
		return "Login";
	}
	
	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) {
		
		session.removeAttribute("loginInfo");
		return "redirect:/";
	}
	
	@RequestMapping("/gomy_Page")
	public String gomy_Page() {
		
		return "Main";
	}
	
	
}
