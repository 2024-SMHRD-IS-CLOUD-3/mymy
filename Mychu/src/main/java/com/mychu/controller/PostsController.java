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

	@RequestMapping("/goWrite")
	public String goWrite(Long idx, Model model) {
		
		return "PostWrite";
	}
	
	@RequestMapping("/postWrite")
	public String postWrite(Posts entity, MultipartFile file) {
		
		String uuid = UUID.randomUUID().toString();
		System.out.println("uuid 확인용 : " + uuid);
		
		String filename = uuid + "_" + file.getOriginalFilename();
		System.out.println("수정된 filename : " + filename);
		
		Path path = Paths.get(savePath + filename);
		
		try {
			
			file.transferTo(path);
			entity.setPostFile(filename);
			repo.save(entity);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/main";
	}
	
	@RequestMapping("/postDetail")
	public String postDetail(Long idx, Model model) {
		
		Posts entity = repo.findById(idx).get();
		model.addAttribute("post", entity);
		
		return "PostDetail";
	}
	

}
