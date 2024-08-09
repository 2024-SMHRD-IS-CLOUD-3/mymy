package com.mychu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.Genres;
import com.mychu.entity.Posts;
import com.mychu.entity.UserGenre;
import com.mychu.entity.Users;
import com.mychu.mapper.GenresRepository;
import com.mychu.mapper.PostsRepository;
import com.mychu.mapper.UserGenreRepository;
import com.mychu.mapper.UsersRepository;

@Controller
public class PostsController {
	
	@Autowired
	private PostsRepository repo;
	
	
	

	
	@RequestMapping("/goWrite")
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
