package kr.co.invegan.board.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.service.RestaurantService;

@Controller
public class RestaurantController {
	
	
	@Autowired RestaurantService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 리스트보여주는 요청
	@RequestMapping(value = "/restaurant/list")
	public String restaurantList(HttpSession session) {
		String user_no = (String) session.getAttribute("user_no");
		if(user_no == "") {
			//로그인 사용자 보여줄 내용
		}else {
			//그냥 보여줄 내용
		}
		return "restaurant/restaurantList";
	}

	// 작성 페이지 이동 요청
	@RequestMapping(value = "/restaurant/write.go")
	public String restaurantWriteGo() {
		return "restaurant/restaurantWrite";
	}
	
	// 작성 요청
	@RequestMapping(value = "/restaurant/write.do", method = RequestMethod.POST)
	@ResponseBody
	public String restaurantWrite(MultipartFile[] uploadImages, @RequestParam HashMap<String, Object> param, HttpSession session) throws Exception {
		
		// 로그인이 대체할려고 만든 부분
		String user = "1";
		session.setAttribute("user_no", user);
		
		String user_no = (String) session.getAttribute("user_no");
		logger.info("param : "+param);
		logger.info("uploadImages : "+uploadImages);
		
		service.restaurantWrite(user_no,uploadImages, param);
		
		return "redirect:/restaurant/list";
	}
	
	// 상세보기 요청
	@RequestMapping(value = "/restaurant/detail")
	public String restaurantDetail(@RequestParam int post_id, Model model, HttpSession session) {
		String user_no = (String) session.getAttribute("user_no");
		String is_adimin = (String) session.getAttribute("is_admin");
		
		model.addAttribute("restaurantDetail", service.restaurantDetail(post_id));
		model.addAttribute("menuDetail", service.menuDetail(post_id));
		model.addAttribute("photoList", service.photoList(post_id));
		
		return "restaurant/restaurantDetail";
	}
	
	
	
	
	
	
	
	
	
	
}
