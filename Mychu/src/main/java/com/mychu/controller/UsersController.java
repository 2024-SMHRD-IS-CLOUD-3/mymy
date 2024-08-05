package com.mychu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {

	@RequestMapping("/")
	public String Main() {
		return "Main";
	}
	
	
	
	
}
