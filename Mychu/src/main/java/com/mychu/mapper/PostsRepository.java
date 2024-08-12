package com.mychu.mapper;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.Posts;

@Repository
public interface PostsRepository extends JpaRepository<Posts, Long> {
	
	public  Optional<Posts> findByPostIdx(Long postIdx);
	
}
