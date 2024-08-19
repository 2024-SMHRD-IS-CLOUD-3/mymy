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
public class Comments {

	// 댓글 식별키
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cmtIdx;

	// 게시글 식별키
	@ManyToOne
	@JoinColumn(name= "post_idx")
	private Posts postIdx;
	
	// 댓글 내용
	@Column(name = "cmt_content")
	private String cmtContent;

	// 댓글 등록일
	@Column(columnDefinition = "datetime default now()", insertable = false, updatable = false, name = "created_at")
	private Date createdAt;
	
	// 댓글올린 사용자 식별키
	@ManyToOne
	@JoinColumn(name= "user_idx")
	private Users userIdx;
	
}
