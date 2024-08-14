package com.mychu.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mychu.entity.Movies;
import com.mychu.mapper.MoviesRepository;

@Controller
public class MoviesController {

    @Autowired
    private MoviesRepository repo;

    @RequestMapping("/goContents")
    public String Movies(@RequestParam(value = "keyword", defaultValue = "스타워즈") String keyword, Model model, HttpSession session) {
        Pageable pageable = PageRequest.of(0, 20); // 첫 10개 항목을 가져옴
        List<Movies> moviesList = repo.findByMovieTitleKrContaining(keyword, pageable).getContent();
        model.addAttribute("moviesList", moviesList);
        return "Contents";
    }
    
    @GetMapping("/autocomplete")
    @ResponseBody
    public List<String> autocomplete(@RequestParam("keyword") String keyword) {
        Pageable pageable = PageRequest.of(0, 10);
        List<Movies> moviesList = repo.findByMovieTitleKrContaining(keyword, pageable).getContent();
        return moviesList.stream()
                         .map(Movies::getMovieTitleKr)
                         .collect(Collectors.toList());
    }
}