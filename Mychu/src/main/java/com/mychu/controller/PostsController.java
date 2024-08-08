package com.mychu.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.Genres;
import com.mychu.entity.Posts;
import com.mychu.entity.Users;
import com.mychu.mapper.PostsRepository;
import com.mychu.mapper.UsersRepository;

@Controller
public class PostsController {
	
	@Autowired
	private PostsRepository repo;
	
	@Autowired
	private UsersRepository user_repo;
	
	@RequestMapping("/main")
	public String PostMain(Model model1, Model model2, Users user) {
		
		ArrayList<Posts> list = (ArrayList<Posts>) repo.findAll();
		model1.addAttribute("posts", list);
		
		ArrayList<Users> user_list = (ArrayList<Users>) user_repo.findAll();
		model2.addAttribute("users", user_list);
		
		
		return "Main";
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
