package com.mychu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mychu.entity.Users;
import com.mychu.mapper.UsersRepository;

@Controller
public class UsersRestController {

	@Autowired
	private UsersRepository usersRepository;
	
	@RequestMapping("/checkId")
	@ResponseBody
	public int checkId(@RequestParam("inputId") String inputId) {
		
		
		Users user = usersRepository.findByUserId(inputId);
		
		
		if (user == null) {
			return 1;
		} else {
			return 0;
		}
		
	}
}
