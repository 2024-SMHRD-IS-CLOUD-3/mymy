package com.mychu.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mychu.mapper.UserGenreRepository;



@Controller
public class UserGenreController {

	@Autowired
	private UserGenreRepository repo;
}
	
	
	