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
public class Posts {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long postIdx;
	
	@Column(name = "post_content")
	private String postContent;
	
	@Column(columnDefinition = "datetime default now()", insertable = false, updatable = false, name = "created_at")
	private Date createdAt;
	
	@Column(columnDefinition = "int default 0", insertable = false, name = "post_views")
	private Long postViews;
	
	@Column(name = "user_idx")
	private Long userIdx;
	
}
