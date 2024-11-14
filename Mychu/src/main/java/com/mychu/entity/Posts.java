package com.mychu.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Posts {

	// 게시글 식별키
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long postIdx;
	
	
	// 게시글 내용
	@Column(name = "post_content")
	private String postContent;
	
	// 게시글 등록날짜
	@Column(columnDefinition = "datetime default now()", insertable = false, updatable = false, name = "created_at")
	private Date createdAt;
	
	// 게시글 조회수
	@Column(columnDefinition = "int default 0", insertable = false, name = "post_views")
	private Long postViews;
	
	// 게시글 등록 사용자 아이디
	@ManyToOne
	@JoinColumn(name = "user_idx")
	private Users userIdx;
	
	
	@Column(name="like_count")
	private int likeCount;
	
	@ManyToOne
	@JoinColumn(name="movie_idx")
	private Movies movieIdx;
	
	 @OneToMany(mappedBy = "postIdx", cascade = CascadeType.ALL, orphanRemoval = true)
	 @ToString.Exclude
	    private List<PostLikes> postLikes;

	// Comments와의 연관 관계
	 @OneToMany(mappedBy = "postIdx", cascade = CascadeType.ALL, orphanRemoval = true)
	 @ToString.Exclude
	  @JsonManagedReference
	 private List<Comments> comments;
	 
	 @Column(name="post_ott")
	 private String postOtt;
	
	
	 
}
