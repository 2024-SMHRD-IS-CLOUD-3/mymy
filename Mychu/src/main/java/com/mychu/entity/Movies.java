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

	// 영화 식별키
	@Id
	private Long movieIdx;
	
	// 영화 영문제목
	@Column(name = "movie_title_en")
	private String movieTitleEn;
	
	// 영화 한글제목
	@Column(name = "movie_title_kr")
	private String movieTitleKr;
	
	// 영화 개봉일
	@Column(name = "opened_at")
	private Date openedAt;
	
	// 영화 포스터 이미지
	@Column(name = "movie_poster_url")
	private String moviePosterUrl;
	
}
