package com.mychu.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.Posts;
import com.mychu.mapper.PostsRepository;

@Controller
public class PostsController {
	
	@Autowired
	private PostsRepository repo;
	
	@RequestMapping("/list")
	public String PostMain(Model model) {
		
		ArrayList<Posts> list = (ArrayList<Posts>) repo.findAll();
		model.addAttribute("list", list);
		
		return "redirect:/main";
	}
	
	@RequestMapping("goWrite")
	public String goWrite() {
		return "PostWrite";
	}
	
	@RequestMapping("/postWrite")
	public String postWrite(Posts entity) {
		
		repo.save(entity);
		
		return "redirect:/main";
	}
	
	@RequestMapping("/postDetail")
	public String postDetail(Long idx, Model model) {
		
		Posts entity = repo.findById(idx).get();
		model.addAttribute("post", entity);
		
		return "PostDetail";
	}
	

}
