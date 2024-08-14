package com.mychu.mapper;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mychu.entity.PostLikes;
import com.mychu.entity.Posts;
import com.mychu.entity.Users;

@Repository
public interface PostLikesRepository extends JpaRepository<PostLikes, Long> {

    // 특정 게시글에 대한 좋아요 수 카운트
    @Query("SELECT COUNT(pl) FROM PostLikes pl WHERE pl.postIdx.postIdx = :postIdx")
    Long countByPostIdx(@Param("postIdx") Long postIdx);

    // 특정 게시글과 사용자에 대한 좋아요 존재 여부 확인
    @Query("SELECT pl FROM PostLikes pl WHERE pl.postIdx = :postIdx AND pl.userIdx = :userIdx")
    PostLikes findByPostIdxAndUserIdx(@Param("postIdx") Posts postIdx, @Param("userIdx") Users userIdx);

  
}
