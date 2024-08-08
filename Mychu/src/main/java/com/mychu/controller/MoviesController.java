package com.mychu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mychu.mapper.MoviesRepository;
import com.mychu.entity.Movies;
import com.mychu.entity.Users;

@Controller
public class MoviesController {

	@Autowired
	private MoviesRepository repo;

	@RequestMapping("/goContents")
	public String Movies(Movies entity, HttpSession session) {

		entity = repo.findByMovieIdxAndMovieTitleKrAndMoviePosterUrlAndOpenedAt(entity.getMovieIdx(),
				entity.getMovieTitleKr(), entity.getMoviePosterUrl(), entity.getOpenedAt());
		System.out.println(entity);
		if (entity != null) {
			session.setAttribute("MovieInfo", entity);
			return "Contents";
		} else {
			return "Contents";
		}
	}

}
