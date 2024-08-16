package com.mychu.controller;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mychu.entity.Genres;
import com.mychu.entity.PostLikes;
import com.mychu.entity.Posts;
import com.mychu.entity.Tickets;
import com.mychu.entity.UserGenre;
import com.mychu.entity.Users;
import com.mychu.mapper.GenresRepository;
import com.mychu.mapper.PostLikesRepository;
import com.mychu.mapper.PostsRepository;
import com.mychu.mapper.TicketsRepository;
import com.mychu.mapper.UserGenreRepository;
import com.mychu.mapper.UsersRepository;

@Controller
public class UsersController {

	@Value("${save.path}")
	private String savePath;

	@Autowired
	private PostsRepository P_repo;

	@Autowired
	private GenresRepository G_repo;

	@Autowired
	private UserGenreRepository UG_repo;

	@Autowired
	private UsersRepository repo;

	@Autowired
	private PostLikesRepository PL_repo;
	
	@Autowired
	private TicketsRepository T_repo;

	@RequestMapping("/")
	public String main() {

		return "redirect:/main";
	}

	@RequestMapping("/main")
	public String Main(Model model) {

		// 전체 포스트를 가져오기
		ArrayList<Posts> list = (ArrayList<Posts>) P_repo.findAll();

		for (Posts post : list) {
			Long likeCount = PL_repo.countByPostIdx(post.getPostIdx());
			post.setLikeCount(likeCount.intValue()); // 좋아요 수 설정
			P_repo.save(post);
		}

		list = (ArrayList<Posts>) P_repo.findAll();
		Collections.reverse(list);
		model.addAttribute("posts", list);

		ArrayList<PostLikes> PLList = (ArrayList<PostLikes>) PL_repo.findAll();
		model.addAttribute("postLikes", PLList);

		return "Main";
	}

	@RequestMapping("/goMain")
	public String goMain() {

		return "redirect:/main";
	}

	@RequestMapping("/goLogin")
	public String goLogin() {
		return "Login";
	}

	@RequestMapping("/login")
	public String login(@ModelAttribute Users entity, HttpSession session, Model model1, Model model2, Model model3, Model model4) {

		// 사용자 정보 확인
		Users user = repo.findByUserIdAndUserPw(entity.getUserId(), entity.getUserPw());
		System.out.println("Fetched User Entity: " + user);

		if (user != null) {
			Long userIdx = user.getUserIdx();
			System.out.println("Fetched User ID: " + userIdx);

			// UserGenre 존재 여부 확인
			List<UserGenre> userGenres = UG_repo.findByUser(user);
			if (!userGenres.isEmpty()) {
				System.out.println("UserGenre information: " + userGenres);

				// 전체 포스트를 가져오기
				ArrayList<Posts> list = (ArrayList<Posts>) P_repo.findAll();

				Collections.reverse(list);

				model1.addAttribute("posts", list);

				// 전체 장르를 가져오기
				ArrayList<Genres> lists = (ArrayList<Genres>) G_repo.findAll();
				model2.addAttribute("genres", lists);

				// postLike 가져오기
				ArrayList<PostLikes> PLList = (ArrayList<PostLikes>) PL_repo.findAll();
				model3.addAttribute("postLikes", PLList);
				
				

				session.setAttribute("loginInfo", user);
				session.setAttribute("userGenres", userGenres);
				session.setAttribute("postLikes", PLList);
				return "redirect:/main";
			} else {
				System.out.println("UserGenre " + userGenres);
				System.out.println("No UserGenre found for user ID: " + userIdx);
				// 전체 포스트를 가져오기
				ArrayList<Posts> list = (ArrayList<Posts>) P_repo.findAll();

				Collections.reverse(list);

				model1.addAttribute("posts", list);

				// 전체 장르를 가져오기
				ArrayList<Genres> lists = (ArrayList<Genres>) G_repo.findAll();
				model2.addAttribute("genres", lists);

				session.setAttribute("userGenres", userGenres);
				session.setAttribute("loginInfo", user);
				return "GenreChoice"; // UserGenre가 없는 경우 로그인 페이지로 리다이렉트
			}
		} else {
			System.out.println("User not found for provided credentials.");
			return "Login"; // 사용자 정보가 없는 경우 로그인 페이지로 리다이렉트
		}
	}

	@Transactional
	@RequestMapping("/join")
	public String join(Users entity, HttpSession session) {

		if (repo.findByUserId(entity.getUserId()) != null) {
			System.out.println("실패");
			return "redirect:/goLogin";
		}
		if (repo.findByUserName(entity.getUserName()) != null) {
			System.out.println("실패");
			return "redirect:/goLogin";
		}
		entity = repo.save(entity);
		if (entity != null) {
			session.setAttribute("JoinInfo", entity);
		}
		return "Login";
	}

	@RequestMapping("/userLogout")
	public String userLogout(HttpSession session) {

		session.removeAttribute("loginInfo");
		return "redirect:/";
	}

	@RequestMapping("/gomy_Page")
	public String gomy_Page(HttpSession session, Model model) {
		
		ArrayList<Posts> list = (ArrayList<Posts>) P_repo.findAll();
		Collections.reverse(list);
		model.addAttribute("posts", list);
		
		
		ArrayList<Tickets> TList = (ArrayList<Tickets>) T_repo.findAll();
		model.addAttribute("tickets", TList);
		session.setAttribute("tickets", TList);
		
		return "MyPage";
	}

	@RequestMapping("/profileEdit")
	public String profileEdit(@RequestParam("file") MultipartFile file, @RequestParam("userId") String userId, HttpSession session) {

		Users user = repo.findByUserId(userId);
		
		String uuid = UUID.randomUUID().toString();

		String filename = uuid + "_" + file.getOriginalFilename();

		Path path = Paths.get(savePath + filename);
		System.out.println("1번"+user);
		try {

			file.transferTo(path);
			user.setProfile(filename);
			System.out.println("2qjs "+user);
			repo.save(user);
			session.setAttribute("loginInfo", user);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/gomy_Page";
	}
	
	@RequestMapping("/goYourPage")
	public String goYourPage(Long idx, Model model, HttpSession session) {
		
		ArrayList<Posts> list = (ArrayList<Posts>) P_repo.findAll();
		Collections.reverse(list);
		model.addAttribute("posts", list);
		
		Users entity = repo.findByUserIdx(idx);
		model.addAttribute("userInfo", entity);
		
		List<UserGenre> userGenres = UG_repo.findByUser(entity);
		model.addAttribute("userGenre", userGenres);
		session.setAttribute("userGenres", userGenres);
		
		List<Tickets> ticket = T_repo.findByUserIdx(entity);
		model.addAttribute("tickets", ticket);
		
		return "YourPage";
	}

}
