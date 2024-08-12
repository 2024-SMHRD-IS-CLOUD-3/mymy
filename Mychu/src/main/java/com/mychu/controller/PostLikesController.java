package com.mychu.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mychu.entity.PostLikes;
import com.mychu.entity.Posts;
import com.mychu.entity.Users;
import com.mychu.mapper.PostLikesRepository;
import com.mychu.mapper.PostsRepository;
import com.mychu.mapper.UsersRepository;

@Controller
public class PostLikesController {
	@Autowired
	private UsersRepository usersRepository;
	
	@Autowired
	private PostsRepository postsRepository;
	
	@Autowired
	private PostLikesRepository postLikesRepository;
	
	@Transactional
	@RequestMapping("/toggleLike")
	@ResponseBody
    public int toggleLike(@RequestParam Long postIdx, @RequestParam Long userIdx) {
    	  Users user = usersRepository.findByUserIdx(userIdx);
    	  Optional<Posts> postOptional = postsRepository.findByPostIdx(postIdx);
    	  System.out.println("뭔데" + postIdx);
    	  if (postOptional.isPresent()) {  // Optional에서 값이 있는지 확인
    	        Posts post = postOptional.get();
    	       
    	      if (postLikesRepository.existsByUserIdxAndPostIdx(user, post)) {
    	    	  postLikesRepository.deleteByUserIdxAndPostIdx(user, post);
    	    	  System.out.println("t살려줘");
              return 0;
    	        } else {
    	        	System.out.println("왜 안해주?"+user);
    	        	  PostLikes postLike = new PostLikes();
    	              postLike.setUserIdx(user);
    	              postLike.setPostIdx(post);
    	              postLikesRepository.save(postLike);
    	       return 1;
    	       }
    	        }  else {
    	        	System.out.println("?");
    	            throw new RuntimeException("Post not found with ID: " + postIdx);
    	        }

    	  }
    
}

