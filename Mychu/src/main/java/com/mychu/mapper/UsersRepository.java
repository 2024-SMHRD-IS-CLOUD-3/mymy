package com.mychu.mapper;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mychu.entity.UsersEntity;

public interface UsersRepository extends JpaRepository<UsersEntity, String> {

	public UsersEntity findByUserIdAndPw(String user_id, String user_pw);
	
}