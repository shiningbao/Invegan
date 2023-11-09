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
		
		if(loginInfo == null) {// 비로그인
			logger.info("비로그인 loginInfo: "+loginInfo);

		}else if(loginInfo.getIs_admin() == 0){// 일반 회원
			logger.info("일반회원 ID: "+loginInfo.getId());

		}else { // 관리자
			logger.info("관리자 ID: "+loginInfo.getId()+ " / admin: "+loginInfo.getIs_admin());
			
		}
		ArrayList<RestaurantDTO> restaurantList = service.restaurantList();
		model.addAttribute("restaurantList", restaurantList);
		return page;
	}

	// 작성 페이지 이동
	@RequestMapping(value = "/restaurant/write.go")
	public String restaurantWriteGo(Model model, HttpSession session) {
		logger.info("식당 작성 페이지 이동 요청");
		String page = "redirect:/main";
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		if(loginInfo == null) {// 비로그인
			logger.info("비로그인 loginInfo: "+loginInfo);
			page = "redirect:list";
		}else if(loginInfo.getIs_admin() == 0){// 일반 회원
			logger.info("일반회원 ID: "+loginInfo.getId());
			page = "redirect:list";
		}else { // 관리자
			logger.info("관리자 ID: "+loginInfo.getId()+ " / admin: "+loginInfo.getIs_admin());
			page = "restaurant/restaurantWrite";
		}
		return page;
	}
	
	// 작성 요청
	@RequestMapping(value = "/restaurant/write.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> restaurantWrite(
			MultipartFile[] uploadImages, @RequestParam HashMap<String, Object> param, HttpSession session)
			throws Exception {
		logger.info("식당 작성 요청");
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		if(loginInfo == null) { // 비로그인
			logger.info("비로그인 loginInfo: "+loginInfo);
			result.put("result", "권한없음");
		}else if(loginInfo.getIs_admin() == 0){ // 일반 회원
			logger.info("일반회원 ID: "+loginInfo.getId());
			result.put("result", "권한없음");
		}else {// 관리자
			logger.info("관리자 ID: "+loginInfo.getId()+ " / admin: "+loginInfo.getIs_admin());
			int user_no = loginInfo.getUser_no();
			logger.info("param : "+param);
			logger.info("uploadImages : "+uploadImages);
			
			String msg = service.restaurantWrite(user_no,uploadImages, param);
			result.put("result", msg);
		}
		return result;
	}
	
	// 상세보기 페이지 이동
	@RequestMapping(value = "/restaurant/detail", method = RequestMethod.GET)
	public String restaurantDetail(@RequestParam int post_id, Model model, HttpSession session) {
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		logger.info("식당 상세보기 이동 요청");
		model.addAttribute("restaurantDetail", service.restaurantDetail(post_id));
		model.addAttribute("menuDetail", service.menuDetail(post_id));
		model.addAttribute("photoList", service.photoList(post_id));
		if(loginInfo != null) {
			model.addAttribute("favoriteChk",service.favoriteChk(loginInfo.getUser_no(), post_id));
		}else {
			model.addAttribute("favoriteChk","0");
		}
		return "restaurant/restaurantDetail";
	}
	
	// 수정 페이지 이동
	@RequestMapping(value = "/restaurant/update.go", method = RequestMethod.GET)
	public String restaurantUpdate(HttpSession session, Model model, @RequestParam int post_id) {
		logger.info("식당 수정 페이지 요청");
		String page = "redirect:/main";
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		if(loginInfo == null) {// 비로그인
			logger.info("비로그인 loginInfo: "+loginInfo);
			page = "redirect:list";
		}else if(loginInfo.getIs_admin() == 0){// 일반 회원
			logger.info("일반회원 ID: "+loginInfo.getId());
			page = "redirect:list";
		}else { // 관리자
			logger.info("관리자 ID: "+loginInfo.getId()+ " / admin: "+loginInfo.getIs_admin()+" / 수정할 post_id: "+post_id);
			model.addAttribute("restaurant", service.restaurantDetail(post_id));
			model.addAttribute("menu", service.menuDetail(post_id));
			model.addAttribute("photo", service.photoList(post_id));	
			logger.info("페이지에 데이터 전송 및 이동");
			page = "restaurant/restaurantUpdate";
		}
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
		
		if(loginInfo == null) {// 비로그인
			logger.info("비로그인 loginInfo: "+loginInfo);
			result.put("result", "권한없음");
		}else if(loginInfo.getIs_admin() == 0){// 일반 회원
			logger.info("일반회원 ID: "+loginInfo.getId());
			result.put("result", "권한없음");
		}else { // 관리자
			logger.info("관리자 ID: "+loginInfo.getId()+ " / admin: "+loginInfo.getIs_admin()+" / 수정할 post_id: "+param.get("post_id"));
			int user_no = loginInfo.getUser_no();
			String msg = service.restaurantUpdate(user_no,uploadImages, param);
			result.put("결과", msg);
		}
		return result;
	}
	
	// 숨김 요청
	@RequestMapping(value = "/restaurant/hidden")
	public String hidden(HttpSession session, @RequestParam int post_id) {
		logger.info("식당 숨김 요청");
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		String page = "redirect:/main";
		
		if(loginInfo == null) {// 비로그인
			logger.info("비로그인 loginInfo: "+loginInfo);
			page = "redirect:list";
		}else if(loginInfo.getIs_admin() == 0){// 일반 회원
			logger.info("일반회원 ID: "+loginInfo.getId());
			page = "redirect:list";
		}else { // 관리자
			logger.info("관리자 ID: "+loginInfo.getId()+ " / admin: "+loginInfo.getIs_admin()+" / 숨길 post_id: "+post_id);
			String result = service.hidden(post_id);
			logger.info("post_id : "+post_id+" "+result);
			page = "redirect:/restaurant/detail?post_id="+post_id;
		}
		return page;
	}
	
	@RequestMapping(value = "/restaurant/favorite")
	@ResponseBody
	public HashMap<String, String> favorite(@RequestParam HashMap<String, String> param) {
		
		HashMap<String, String> result = new HashMap<String, String>();
		
		logger.info("param commemt_text : "+param.get("comment_text"));
		String success = service.favorite(param);
		result.put("result", success);
		return result;
		
		
	}
	
	
	
	
	@RequestMapping(value = "/restaurant/reviewWrite")
	@ResponseBody
	public HashMap<String, String> reviewWrite(@RequestParam HashMap<String, String> param, HttpSession session) {
		logger.info("식당 즐겨찾기 요청");
		MemberDTO loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		HashMap<String, String> result = new HashMap<String, String>();
		
		if(loginInfo == null) {// 비로그인
			logger.info("비로그인 loginInfo: "+loginInfo);
		}else{// 일반 회원
			logger.info("요청 ID: "+loginInfo.getId());
			int success = service.reviewWrite(param);
			
		}
		return result;
		
	}
	
	
	
	
	
}
