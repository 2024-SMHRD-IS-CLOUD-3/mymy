package com.mychu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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

	@RequestMapping("/list")
		public String Main(Model model) {
			ArrayList<Genres> list = (ArrayList<Genres>) repo.findAll();
			model.addAttribute("list", list);
			
			
			return "Main";
		}
}
