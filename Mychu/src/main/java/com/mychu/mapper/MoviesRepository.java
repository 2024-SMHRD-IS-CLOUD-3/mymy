package com.mychu.mapper;


import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.Movies;

@Repository
public interface MoviesRepository extends JpaRepository<Movies, Long> {

	public Movies findByMovieIdxAndMovieTitleKrAndMoviePosterUrlAndOpenedAt(Long movieIdx, String movieTitleKr, String moviePosterUrl, Date openedAt);
	
}
