package com.mychu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		Users user = usersRepository.findByUserId(userId);
		entity.setUserIdx(user);
		Movies movie = moviesRepository.findByMovieTitleKr(movieTitleKr);
		entity.setMovieIdx(movie);
		
		movie.getMovieIdx();
		
		ticketsRepository.save(entity);
		return "redirect:/gomy_Page";
	}

}