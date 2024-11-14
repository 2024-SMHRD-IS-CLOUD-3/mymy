package com.mychu.mapper;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.Tickets;
import com.mychu.entity.Users;

@Repository
public interface TicketsRepository extends JpaRepository<Tickets, Long> {

	List<Tickets> findByUserIdx(Users user);
}