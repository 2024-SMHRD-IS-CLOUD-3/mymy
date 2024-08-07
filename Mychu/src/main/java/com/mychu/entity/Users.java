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
public class Users {

	// 사용자 아이디
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long userIdx;
	
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

}
