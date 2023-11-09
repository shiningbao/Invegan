package kr.co.invegan.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.invegan.board.service.RequestService;
import kr.co.invegan.member.dto.MemberDTO;

@Controller
public class RequestController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired RequestService service;
	
	MemberDTO loginInfo = null;
	
	@RequestMapping(value="*/requestList.go")
	public String requestgo(HttpSession session, RedirectAttributes reAttr) {
		logger.info("요청 게시판 이동");
		String page = "redirect:member/login.go";
		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		
		if (loginInfo != null) {
			logger.info("User_no : " + loginInfo.getUser_no());
			page = "myRecipe/MyRecipeList";
		} else {
			logger.info("로그인 x");
			reAttr.addFlashAttribute("msg", "로그인 후 이용 가능한 서비스입니다.");
		}
		
		return page;
	}
	
	@RequestMapping(value="*/requestList.do")
	public HashMap<String, Object> requestdo(HttpSession session, @RequestParam HashMap<String, Object> params) {

		loginInfo = (MemberDTO) session.getAttribute("loginInfo");
		logger.info("요청 게시판 리스트 출력");
		logger.info("params : "+params);
		logger.info("User_no : "+loginInfo.getUser_no());

		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> requestdo = service.requestdo(params);
		return result;
	}
}
