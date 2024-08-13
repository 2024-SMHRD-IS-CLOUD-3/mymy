package com.mychu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mychu.entity.Comments;
import com.mychu.entity.Posts;
import com.mychu.entity.Users;
import com.mychu.mapper.CommentsRepository;
import com.mychu.mapper.PostsRepository;
import com.mychu.mapper.UsersRepository;

@Controller
public class CommentsController {

	@Autowired
	private CommentsRepository commnetsRepository;
	
	@Autowired
    private UsersRepository usersRepository;
	
	  @Autowired
	    private PostsRepository postsRepository;
	
	  @InitBinder
	  public void initBinder(WebDataBinder binder) {
	      binder.setDisallowedFields("userIdx");
	  }
	@RequestMapping("/commentWrite")
	public String commentWrite(Comments entity, @RequestParam("userIdx") Long userIdx,
			@RequestParam("postIdx") Long postIdx ) {
		Users user=usersRepository.findByUserIdx(userIdx);
		entity.setUserIdx(user);
		Posts post=postsRepository.findByPostIdx(postIdx);
		entity.setPostIdx(post);
		
		commnetsRepository.save(entity);
		
		return "redirect:/postDetail?idx="+post.getPostIdx();
	}
	
}
