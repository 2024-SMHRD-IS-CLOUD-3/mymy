package com.mychu.mapper;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mychu.entity.Users;

public interface UsersRepository extends JpaRepository<Users, String> {

	public Users findByUserIdAndUserPw(String userId, String userPw);
	
}
