package com.mychu.entity;

import java.util.Date;

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
public class Movies {

	@Id
	private Long movieIdx;
	
	@Column(name = "movie_title_en")
	private String movieTitleEn;
	
	@Column(name = "movie_title_kr")
	private String movieTitleKr;
	
	@Column(name = "opend_at")
	private Date OpendAt;
	
	@Column(name = "movie_poster_url")
	private String moviePosterUrl;
	
}
