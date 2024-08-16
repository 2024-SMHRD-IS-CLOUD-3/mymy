package com.mychu.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mychu.entity.Comments;
import com.mychu.entity.Movies;
import com.mychu.entity.PostLikes;
import com.mychu.entity.Posts;
import com.mychu.entity.Users;
import com.mychu.mapper.CommentsRepository;
import com.mychu.mapper.MoviesRepository;
import com.mychu.mapper.PostLikesRepository;
import com.mychu.mapper.PostsRepository;
import com.mychu.mapper.UsersRepository;


@Controller
public class PostsController {

    @Autowired
    private PostsRepository postsRepository;

    @Autowired
    private UsersRepository usersRepository;
    
    @Autowired
    private MoviesRepository moviesRepository;  // MoviesRepository 주입
    
    @Autowired
    private PostLikesRepository postlikesRepository;

    @Autowired
    private CommentsRepository commentsRepository;
    
    @RequestMapping("/goWrite")
    public String goWrite(Long idx, Model model) {
        return "PostWrite";
    }

    @RequestMapping("/postWrite")
    public String postWrite(Posts entity, @RequestParam("userId") String userId, @RequestParam("movieTitleKr") String movieTitleKr) {
    	System.out.println(movieTitleKr);
        Users user = usersRepository.findByUserId(userId);
        entity.setUserIdx(user);
        Movies movie = moviesRepository.findByMovieTitleKr(movieTitleKr);
        entity.setMovieIdx(movie);
        postsRepository.save(entity);
        return "redirect:/main";
    }

    @RequestMapping("/postDelete")
    @Transactional
    public String postDelete(@RequestParam("id") Long postIdx) {
    	
    	
        postsRepository.deleteById(postIdx);
        return "redirect:/gomy_Page";
    	
    	
    }

    @GetMapping("/getPosterUrl")
    @ResponseBody
    public Map<String, String> getPosterUrl(@RequestParam("title") String title) {
        // 영화 제목으로 영화 정보를 가져옴
        Movies movie = moviesRepository.findByMovieTitleKr(title);

        // 반환할 데이터 준비
        Map<String, String> response = new HashMap<>();
        if (movie != null) {
            response.put("posterUrl", movie.getMoviePosterUrl());
            response.put("movieIdx", movie.getMovieIdx().toString()); // movieIdx를 반환
        } else {
            response.put("posterUrl", ""); // 영화가 없을 경우 빈 값을 반환
            response.put("movieIdx", "");
        }

        return response;
    }
    
    @RequestMapping("/postEdit")
    public String postEdit() {
    	return "PostEdit";
    }
    
    @RequestMapping("/postDetail")
    public String postDetail(@RequestParam("idx") Long postIdx,Model model,HttpSession session) {
    	Posts post = postsRepository.findByPostIdx(postIdx);
    	post.setPostViews(post.getPostViews() + 1);
    	postsRepository.save(post);
    	model.addAttribute("post",post);
    	System.out.println(post);
    	
    	ArrayList<Comments> comment =(ArrayList<Comments>) commentsRepository.findAll();
    	model.addAttribute("comment" ,comment);
    	System.out.println(comment);
    	return "PostDetail";
    }
    
    
    
    
	
    
    
    
    
    
    
    
    
}