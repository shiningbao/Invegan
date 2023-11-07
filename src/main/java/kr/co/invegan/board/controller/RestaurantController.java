package kr.co.invegan.board.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.Session;
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

import kr.co.invegan.board.dto.RestaurantDTO;
import kr.co.invegan.board.service.RestaurantService;
import kr.co.invegan.member.dto.MemberDTO;

@Controller
public class RestaurantController {
	
	
	@Autowired RestaurantService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 리스트보여주는 요청
	@RequestMapping(value = "/restaurant/list")
	public String restaurantList(HttpSession session, Model model) {
		
		String page = "restaurant/restaurantList";
		
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		ArrayList<RestaurantDTO> restaurantList = service.restaurantList();
		model.addAttribute("restaurantList", restaurantList);
		if(loginInfo == null) {
			// 비회원 내용
		}else if(loginInfo.getIs_admin() == 0){
			// 일반회원 내용
		}else if(loginInfo.getIs_admin() == 1) {
			// 관리자 내용
		}else {
			page = "/";
		}
		return page;
	}

	// 작성 페이지 이동 요청
	@RequestMapping(value = "/restaurant/write.go")
	public String restaurantWriteGo(Model model, HttpSession session) {
		String page = "/";
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		if(loginInfo.getIs_admin() == 1) {
			page = "restaurant/restaurantWrite";
		}
		return page;
	}
	
	// 작성 요청
	@RequestMapping(value = "/restaurant/write.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> restaurantWrite(MultipartFile[] uploadImages, @RequestParam HashMap<String, Object> param, HttpSession session) throws Exception {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		String user_no = ""+loginInfo.getUser_no();
		logger.info("param : "+param);
		logger.info("uploadImages : "+uploadImages);
		
		service.restaurantWrite(user_no,uploadImages, param);
		result.put("결과", "식당 작성 성공");
		return result;
	}
	
	// 상세보기 요청
	@RequestMapping(value = "/restaurant/detail")
	public String restaurantDetail(@RequestParam int post_id, Model model, HttpSession session) {
		
		model.addAttribute("restaurantDetail", service.restaurantDetail(post_id));
		model.addAttribute("menuDetail", service.menuDetail(post_id));
		model.addAttribute("photoList", service.photoList(post_id));

		return "restaurant/restaurantDetail";
	}
	
	// 수정 요청
	@RequestMapping(value = "/restaurant/update")
	public String restaurantUpdate(HttpSession session, Model model, @RequestParam int post_id) {
		
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		model.addAttribute("restaurant", service.restaurantDetail(post_id));
		model.addAttribute("men", service.menuDetail(post_id));
		model.addAttribute("photo", service.photoList(post_id));	
		
		String page = "restaurant/restaurantUpdate";
		return page;
	}
	
	
	
	
	
	
	
	
	
}
