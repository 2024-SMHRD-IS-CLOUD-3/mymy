package com.mychu.mapper;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.PostLikes;

@Repository
public interface PostLikesRepository extends JpaRepository<PostLikes, Long> {

}
