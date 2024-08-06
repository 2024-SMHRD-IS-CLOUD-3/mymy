package com.mychu.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class PostsController {
	
	@RequestMapping("/bootReset")
	public String bootReset() {
		
		
		return "Main";
	}

}
