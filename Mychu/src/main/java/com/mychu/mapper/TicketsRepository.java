package com.mychu.mapper;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mychu.entity.Tickets;

@Repository
public interface TicketsRepository extends JpaRepository<Tickets, Long> {

}