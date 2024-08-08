package com.mychu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostLikes {

	// 좋아요 식별키
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long likeIdx;
	
	// 좋아요 하는 사용자 식별키
	@ManyToOne
	@JoinColumn(name= "user_idx")
	private Users userIdx;
	
	// 좋아요 받는 게시글 식별키
	@ManyToOne
	@JoinColumn(name= "post_idx")
	private Posts postIdx;
	
	// 좋아요 등록 시간
	@Column(columnDefinition = "datetime default now()", insertable = false, updatable = false, name = "created_at")
	private Date createdAt;
	
}
