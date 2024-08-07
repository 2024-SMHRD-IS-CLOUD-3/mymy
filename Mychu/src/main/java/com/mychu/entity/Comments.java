package com.mychu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comments {

	@Id
	private Long cmtIdx;

	@Column(name = "post_idx")
	private Long postIdx;

	@Column(name = "cmt_content")
	private String cmtContent;

	@Column(columnDefinition = "datetime default now()", insertable = false, updatable = false, name = "created_at")
	private Date createdAt;
	
	@Column(columnDefinition = "int default 0", insertable = false, name = "cmt_likes")
	private Long cmtLikes;
	
	@Column(name = "user_id")
	private String userId;
}
