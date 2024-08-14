package com.mychu.controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mychu.entity.Genres;
import com.mychu.entity.UserGenre;
import com.mychu.entity.Users;
import com.mychu.mapper.GenresRepository;
import com.mychu.mapper.UserGenreRepository;
import com.mychu.mapper.UsersRepository;

@Controller
public class UserGenreController {

	@Autowired
	private UserGenreRepository repo;

	@Autowired
	private UsersRepository usersRepository;

	@Autowired
	private GenresRepository genresRepository;
	
	@Autowired
	private UserGenreRepository UG_repo;

	@RequestMapping("/saveGenres")
	public String saveGenres(@RequestParam("userId") String userId, @RequestParam("genreIds") List<Long> genreIds, HttpSession session) {
		// userId로 사용자 찾기
		Users user = usersRepository.findByUserId(userId);
		System.out.println("대체 왜 안되는데 " + user);
		// .orElseThrow(() -> new IllegalArgumentException("Invalid user ID: " +
		// userId));
		
		
		
		if (user != null) {
			// 선택된 장르 ID로 각 장르를 찾아서 UserGenre로 저장
			for (Long genreId : genreIds) {
				Genres genre = genresRepository.findById(genreId).orElse(null);
//                    .orElseThrow(() -> new IllegalArgumentException("Invalid genre ID: " + genreId));
				if (genre != null) {
					UserGenre userGenre = new UserGenre();
					userGenre.setUser(user);
					userGenre.setGenre(genre);
					repo.save(userGenre);
					
				}
			}
		}
		
		List<UserGenre> userGenres = UG_repo.findByUser(user);
		session.setAttribute("userGenres", userGenres);
		return "redirect:/";
	}

}
