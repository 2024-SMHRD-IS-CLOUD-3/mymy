package com.mychu.mapper;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.Comments;

@Repository
public interface CommentsRepository extends JpaRepository<Comments, Long> {
	
}
