package com.mychu.mapper;

import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mychu.entity.PostLikes;
import com.mychu.entity.Posts;
import com.mychu.entity.Users;

@Repository
public interface PostLikesRepository extends JpaRepository<PostLikes, Long> {

	
	@Query("SELECT COUNT(pl) FROM PostLikes pl WHERE pl.postIdx.postIdx = :postIdx")
    Long countByPostIdx(@Param("postIdx") Long postIdx);
	
	 boolean existsByUserIdxAndPostIdx(Users userIdx, Posts postIdx);
	 
	 
	 void deleteByUserIdxAndPostIdx(Users userIdx, Posts postIdx);
}
