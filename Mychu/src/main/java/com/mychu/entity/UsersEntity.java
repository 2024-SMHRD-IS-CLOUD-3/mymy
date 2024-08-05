package com.mychu.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsersEntity {

	 // 사용자 아이디 
	@Id
    private String user_id;

    // 사용자 비밀번호 
	@Column
    private String user_pw;


    // 사용자 이름 
	@Column
    private String user_name;

	@Column(columnDefinition = "datetime default now()" , insertable=false,updatable=false)
	private Date joined_at; 
    // 사용자 가입일자 
    
	
	
}

