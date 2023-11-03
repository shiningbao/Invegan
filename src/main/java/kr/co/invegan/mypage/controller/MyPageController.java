package kr.co.invegan.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.invegan.mypage.dto.MyPageDTO;
import kr.co.invegan.mypage.service.MyPageService;

@Controller
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService service;
	
	@RequestMapping(value="/myPage/info.go")
	public String infoGo(Model model, HttpSession session) {
	    String loginId = (String) session.getAttribute("loginId");
	    if (loginId != null) {
	        ArrayList<MyPageDTO> info = service.userInfo(loginId);
	        model.addAttribute("info", info);
	        return "mypage";
	    } else {
	       
	       return "redirect:/login"; 
	    }
	}
	
	@RequestMapping(value="/myPage/overlay")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String nickname){
		boolean use = service.overlay(nickname);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use", use);
		return map;
	}
	
	@RequestMapping(value="/myPage/listCall")
	@ResponseBody
	public HashMap<String, Object> listCall(@RequestParam String boardType, @RequestParam Integer user_no) {
		
	    HashMap<String, Object> result = new HashMap<String, Object>();
	    ArrayList<MyPageDTO> list = null;
	    
	    if ("요청".equals(boardType)) {
	        list = service.requestBoardList(user_no);
	    } else if ("레시피".equals(boardType)) {
	        list = service.recipeBoardList(user_no);
	    } else if ("자유게시판".equals(boardType)) {
	        list = service.freeBoardList(user_no);
	    } else if ("피드".equals(boardType)) {
	    	list = service.feedList(user_no);
	    }
	    
	    result.put("list", list);
	    logger.info("list:"+list);
	    logger.info("user_no:"+user_no);
	    return result;
	}
	
}
