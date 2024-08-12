package com.mychu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.mychu.entity.PostLikes;
import com.mychu.entity.Posts;
import com.mychu.entity.Users;
import com.mychu.mapper.PostLikesRepository;
import com.mychu.mapper.PostsRepository;
import com.mychu.mapper.UsersRepository;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@RestController
public class PostLikesController {

    @Autowired
    private PostLikesRepository postLikesRepository;

    @Autowired
    private PostsRepository postsRepository;

    @Autowired
    private UsersRepository usersRepository;

    @GetMapping("/toggleLike")
    public Map<String, Object> toggleLike(@RequestParam Long postIdx, HttpSession session) {
        Users user = (Users) session.getAttribute("loginInfo");

        if (user == null) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "로그인 필요");
            return response;
        }

        Posts post = postsRepository.findById(postIdx).orElse(null);
        if (post == null) {
            Map<String, Object> response = new HashMap<>();
            response.put("success", false);
            response.put("message", "게시글을 찾을 수 없습니다.");
            return response;
        }

        PostLikes existingLike = postLikesRepository.findByPostIdxAndUserIdx(post, user);

        Map<String, Object> response = new HashMap<>();
        if (existingLike != null) {
            // 좋아요가 이미 존재하면 삭제
            postLikesRepository.delete(existingLike);
            response.put("success", true);
            response.put("liked", false);
        } else {
            // 좋아요가 존재하지 않으면 추가
            PostLikes newLike = new PostLikes();
            newLike.setPostIdx(post);
            newLike.setUserIdx(user);
            postLikesRepository.save(newLike);
            response.put("success", true);
            response.put("liked", true);
        }
        return response;
    }
}
