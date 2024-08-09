package com.mychu.mapper;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.mychu.entity.Movies;

@Repository
public interface MoviesRepository extends JpaRepository<Movies, Long> {
    Page<Movies> findByMovieTitleKrContaining(String keyword, Pageable pageable);
}