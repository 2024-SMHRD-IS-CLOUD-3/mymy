package com.mychu.mapper;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.Posts;

@Repository
public interface PostsRepository extends JpaRepository<Posts, Long> {
	
	
	
}
