package com.mychu.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mychu.entity.Comments;
import com.mychu.entity.Movies;
import com.mychu.entity.PostLikes;
import com.mychu.entity.Posts;
import com.mychu.entity.Tickets;
import com.mychu.entity.UserGenre;
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
       
        List<Movies> movies= moviesRepository.findAllByMovieTitleKr(title);
        // 반환할 데이터 준비
        Map<String, String> response = new HashMap<>();
        if (movies != null) {
        	Movies movie=movies.get(0);
            response.put("posterUrl", movie.getMoviePosterUrl());
            response.put("movieIdx", movie.getMovieIdx().toString()); // movieIdx를 반환
        } else {
            response.put("posterUrl", ""); // 영화가 없을 경우 빈 값을 반환
            response.put("movieIdx", "");
        }

        return response;
    }
    
    @RequestMapping("/postEdit")
    public String postEdit(@RequestParam("idx") Long idx, Model model, HttpSession session) {
    	Posts post =postsRepository.findByPostIdx(idx);
    	
    	session.setAttribute("post", post);
    	
    	
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
    
    
    
    
    @PostMapping("/postUpdate")
    public String updatePost(@RequestParam("postIdx") Long postIdx,
                             @RequestParam("postContent") String postContent,
                             @RequestParam("postOtt") String postOtt,
                             Model model) {
        // 기존 게시글을 DB에서 가져옴
        Posts post = postsRepository.findById(postIdx).orElse(null);

        if (post != null) {
            // 게시글 내용과 OTT 플랫폼을 수정
            post.setPostContent(postContent);
            post.setPostOtt(postOtt);

            // 수정된 정보를 저장
            postsRepository.save(post);

            // 수정된 게시글을 모델에 추가
            model.addAttribute("post", post);

            // 게시글 수정 완료 후 상세 페이지로 이동
            return "redirect:/postDetail?idx=" + postIdx;
        }

        // 게시글을 찾을 수 없을 경우, 에러 페이지로 리디렉션
        return "error";
    }
    
	
    
    
    
    
    
    
    
    
}