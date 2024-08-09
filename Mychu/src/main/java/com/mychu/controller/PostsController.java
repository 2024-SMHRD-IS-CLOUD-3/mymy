package com.mychu.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	@Value("${save.path}")
	private String savePath;
	
	@Autowired
	private PostsRepository repo;
	
	@Autowired
	private UsersRepository usersRepository;

	@RequestMapping("/goWrite")
	public String goWrite(Long idx, Model model) {
		
		return "PostWrite";
	}
	
	@RequestMapping("/postWrite")
	public String postWrite(Posts entity, @RequestParam("userId") String userId) {
		
		Users user = usersRepository.findByUserId(userId);
		entity.setUserIdx(user);
		entity = repo.save(entity);
		
		return "redirect:/main";
	}
	
	@RequestMapping("/postDelete")
	public String postDelete(@RequestParam("id") Long postIdx) {
		
		repo.deleteById(postIdx);
		return "redirect:/main";
	}
	

}
