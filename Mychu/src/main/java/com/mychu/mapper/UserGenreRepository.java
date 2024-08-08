package com.mychu.mapper;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.mychu.entity.UserGenre;
import com.mychu.entity.Users;

public interface UserGenreRepository extends JpaRepository<UserGenre, Long> {
    List<UserGenre> findByUser(Users user);;
}