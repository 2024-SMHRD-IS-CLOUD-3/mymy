package com.mychu.mapper;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.Posts;
import com.mychu.entity.Users;

@Repository
public interface PostsRepository extends JpaRepository<Posts, Long> {
	
	public Posts findByPostIdx(Long postIdx);
	
	List<Posts> findByPostOtt(String postOtt); 
	
}
