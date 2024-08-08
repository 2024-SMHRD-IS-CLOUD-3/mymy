package com.mychu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.Genres;
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
	
	@RequestMapping("/goMain")
	public String goMain() {
		return "redirect:/main";
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
			return "redirect:/goLogin";
		}
		if(repo.findByUserName(entity.getUserName()) !=null) {
			System.out.println("실패");
			return "redirect:/goLogin";
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
	
	@RequestMapping("/goContents")
	public String goContents() {
		return "Contents";
	}
	
	
}
