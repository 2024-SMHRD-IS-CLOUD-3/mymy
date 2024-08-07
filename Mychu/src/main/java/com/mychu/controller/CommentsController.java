package com.mychu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.Comments;
import com.mychu.mapper.CommentsRepository;

@Controller
public class CommentsController {

	@Autowired
	private CommentsRepository repo;
	
	@RequestMapping("/commentWrite")
	public String commentWrite(Comments entity) {
		
		repo.save(entity);
		
		return "redirect:/postWrite";
	}
	
}
