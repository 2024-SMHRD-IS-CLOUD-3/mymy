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
	
	@RequestMapping("/checkLogin")
	@ResponseBody
	public String checkLogin(@RequestParam("checkId") String checkId, @RequestParam("checkPw") String checkPw) {
		
		Users user = usersRepository.findByUserIdAndUserPw(checkId, checkPw);
		
		if (user != null) {
			// 로그인 성공
			return "Login";
		} else {
			// 로그인 실패
			return "1";
		}
	}
}
