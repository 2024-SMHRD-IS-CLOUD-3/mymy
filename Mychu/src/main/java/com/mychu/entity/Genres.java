package com.mychu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Genres {

	// 장르 식별키
	@Id
	private Long genreIdx;
	
	// 장르
	@Column(name = "genre_name")
	private String genreName;
	
	
}
