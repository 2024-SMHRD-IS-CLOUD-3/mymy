package com.mychu.mapper;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.mychu.entity.Movies;

@Repository
public interface MoviesRepository extends JpaRepository<Movies, Long> {
    Page<Movies> findByMovieTitleKrContaining(String keyword, Pageable pageable);
   
	
    Movies findByMovieTitleKr(String title);


	List<Movies> findAllByMovieTitleKr(String title);
}

