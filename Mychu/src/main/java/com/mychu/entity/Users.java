package com.mychu.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Users {

	// 사용자 식별키
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userIdx;
	
	// 사용자 아이디
	@Column(unique = true , name="user_id")
	private String userId;

	// 사용자 비밀번호
	@Column(nullable = false, name = "user_pw")
	private String userPw;

	// 사용자 이름
	@Column(nullable = false, name = "user_name")
	private String userName;

	// 사용자 가입일자
	@Column(columnDefinition = "datetime default now()", insertable = false, updatable = false)
	private Date joined_at;
	
	@Column(name = "profile")
	private String profile;

	
	 @OneToMany(mappedBy = "userIdx", cascade = CascadeType.ALL, orphanRemoval = true)
	 @ToString.Exclude
	 private List<PostLikes> postLikes;
	 
	 @OneToMany(mappedBy = "userIdx", cascade = CascadeType.ALL, orphanRemoval = true)
	 @ToString.Exclude
	 private List<Comments> comments;
	 
	 @OneToMany(mappedBy = "userIdx", cascade = CascadeType.ALL, orphanRemoval = true)
	 @ToString.Exclude
	 private List<Posts> posts;
	
	 @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
	 @ToString.Exclude
	 private List<UserGenre> userGenre;
	 
	 
	 @OneToMany(mappedBy = "userIdx", cascade = CascadeType.ALL, orphanRemoval = true)
	 @ToString.Exclude
	 private List<Tickets> ticket;
	 
}
