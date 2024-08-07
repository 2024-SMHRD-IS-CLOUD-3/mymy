package com.mychu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostLikes {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long likeIdx;
	
	@Column(name = "user_id")
	private String userId;
	
	@Column(name = "post_idx")
	private Long postIdx;
	
	@Column(columnDefinition = "datetime default now()", insertable = false, updatable = false, name = "created_at")
	private Date createdAt;
	
}
