package com.mychu.controller;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.entity.Genres;
import com.mychu.mapper.GenresRepository;

@Controller
public class GenresController {

	@Autowired
	private GenresRepository repo;

	
	
	
}
