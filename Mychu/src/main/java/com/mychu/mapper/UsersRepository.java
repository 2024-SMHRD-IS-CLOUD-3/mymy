package com.mychu.mapper;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.Users;

@Repository
public interface UsersRepository extends JpaRepository<Users, String> {

	public Users findByUserIdAndUserPw(String userId, String userPw);
	
	
	public Users findByUserId(String userId);
	
	public Users findByUserName(String userName);
}
