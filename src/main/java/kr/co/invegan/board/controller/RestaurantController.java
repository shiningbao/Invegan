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

	// 작성 페이지 이동
	@RequestMapping(value = "/restaurant/write.go")
	public String restaurantWriteGo(Model model, HttpSession session) {
		String page = "/";
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		if(loginInfo.getIs_admin() == 1) {
			page = "restaurant/restaurantWrite";
		}else {
			page = "restaurant/list";
		}
		return page;
	}
	
	// 작성 요청
	@RequestMapping(value = "/restaurant/write.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> restaurantWrite(
			MultipartFile[] uploadImages, @RequestParam HashMap<String, Object> param, HttpSession session)
			throws Exception {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		int user_no = loginInfo.getUser_no();
		logger.info("param : "+param);
		logger.info("uploadImages : "+uploadImages);
		
		service.restaurantWrite(user_no,uploadImages, param);
		result.put("결과", "식당 작성 성공");
		return result;
	}
	
	// 상세보기 페이지 이동
	@RequestMapping(value = "/restaurant/detail", method = RequestMethod.GET)
	public String restaurantDetail(@RequestParam int post_id, Model model, HttpSession session) {
		logger.info("restaurant/detail 접근");
		model.addAttribute("restaurantDetail", service.restaurantDetail(post_id));
		model.addAttribute("menuDetail", service.menuDetail(post_id));
		model.addAttribute("photoList", service.photoList(post_id));
		return "restaurant/restaurantDetail";
	}
	
	// 수정 페이지 이동
	@RequestMapping(value = "/restaurant/update.go", method = RequestMethod.GET)
	public String restaurantUpdate(HttpSession session, Model model, @RequestParam int post_id) {
		logger.info("restaurant/update.go 접근");
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		logger.info("input post_id : "+post_id);
		RestaurantDTO output = service.restaurantDetail(post_id);
		logger.info("output post_id: "+ output.getPost_id());
		
		model.addAttribute("restaurant", service.restaurantDetail(post_id));
		model.addAttribute("menu", service.menuDetail(post_id));
		model.addAttribute("photo", service.photoList(post_id));	
		logger.info("페이지에 데이터 전송 및 이동");
		String page = "restaurant/restaurantUpdate";
		return page;
	}
	
	// 수정 요청
	@RequestMapping(value = "/restaurant/update.do")
	@ResponseBody
	public HashMap<String, Object> restaurantUpdate(
			MultipartFile[] uploadImages, @RequestParam HashMap<String, Object> param, HttpSession session)
			throws Exception {
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		int user_no = loginInfo.getUser_no();
		
		// logger.info("param : "+param);
		// logger.info("uploadImages : "+uploadImages);
		
		String msg = service.restaurantUpdate(user_no,uploadImages, param);
		result.put("결과", "수정 완료");
		
		return result;
	}
	
	@RequestMapping(value = "/restaurant/reviewWrite")
	@ResponseBody
	public HashMap<String, String> reviewWrite(@RequestParam HashMap<String, String> param) {
		
		HashMap<String, String> result = new HashMap<String, String>();
		
		logger.info("param commemt_text : "+param.get("comment_text"));
		int success = service.reviewWrite(param);
		return result;
		
		
	}
	
	
	
	
	
	
	
	
}
