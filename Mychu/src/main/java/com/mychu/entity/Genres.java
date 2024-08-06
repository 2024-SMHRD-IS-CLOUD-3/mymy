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

	@Id
	private Long genreIdx;
	
	@Column(name = "genre_name")
	private String genreName;
	
	
}
