package com.mychu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mychu.entity.Posts;
import com.mychu.entity.Users;
import com.mychu.mapper.PostsRepository;
import com.mychu.mapper.UsersRepository;

@Controller
public class PostsController {

    @Autowired
    private PostsRepository postsRepository;

    @Autowired
    private UsersRepository usersRepository;

    @RequestMapping("/goWrite")
    public String goWrite(Long idx, Model model) {
        return "PostWrite";
    }

    @RequestMapping("/postWrite")
    public String postWrite(Posts entity, @RequestParam("userId") String userId) {
        Users user = usersRepository.findByUserId(userId);
        entity.setUserIdx(user);
        postsRepository.save(entity);
        return "redirect:/main";
    }

    @RequestMapping("/postDelete")
    public String postDelete(@RequestParam("id") Long postIdx) {
        postsRepository.deleteById(postIdx);
        return "redirect:/main";
    }
}
