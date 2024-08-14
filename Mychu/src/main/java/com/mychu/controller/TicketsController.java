package com.mychu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.mychu.entity.Movies;
import com.mychu.entity.Tickets;
import com.mychu.entity.Users;
import com.mychu.mapper.MoviesRepository;
import com.mychu.mapper.TicketsRepository;
import com.mychu.mapper.UsersRepository;

@Controller
public class TicketsController {
	
	@Autowired
	private TicketsRepository ticketsRepository;
	
	@Autowired
    private UsersRepository usersRepository;
    
    @Autowired
    private MoviesRepository moviesRepository;
	
	@RequestMapping("/goSaveTicket")
	public String goSaveTicket() {
		return "TicketSave";
	}
	
	@RequestMapping("saveTicket")
	public String saveTicket(Tickets entity, @RequestParam("userId") String userId, @RequestParam("movieTitleKr") String movieTitleKr) {
		RestTemplate restTemplate = new RestTemplate();
		Users user = usersRepository.findByUserId(userId);	
		entity.setUserIdx(user);
		Movies movie = moviesRepository.findByMovieTitleKr(movieTitleKr);
		entity.setMovieIdx(movie);
		String generatorURL = "http://localhost:5000/generator/" + entity.getMovieIdx().getMovieIdx();
		System.out.println(generatorURL);
		ResponseEntity<String> response = restTemplate.getForEntity(generatorURL, String.class);
		
		String responseBody = response.getBody();
		System.out.println(responseBody);
		ticketsRepository.save(entity);
		return "redirect:/gomy_Page";
	}

}