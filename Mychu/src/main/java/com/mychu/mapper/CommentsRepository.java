package com.mychu.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mychu.entity.Comments;
import com.mychu.entity.Posts;

@Repository
public interface CommentsRepository extends JpaRepository<Comments, Long> {
	
	
	
}
