package kr.co.invegan.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
	public String infoGo(Model model) {
		ArrayList<MyPageDTO> info = service.userInfo();
		model.addAttribute("info",info);
		return "mypage";
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
	public HashMap<String, Object> listCall(@RequestParam String boardType, @RequestParam String tabType) {
		
	    HashMap<String, Object> result = new HashMap<String, Object>();
	    ArrayList<MyPageDTO> list = null;

	    if ("요청".equals(boardType)) {
	        list = service.requestBoardList();
	    } else if("레시피".equals(boardType)){
	        list = service.recipeBoardList();
	    } else if("자유게시판".equals(boardType)) {
	    	list = service.freeBoardList();
	    }
	    
	    result.put("list", list);
	    logger.info("list:" + list);


	    return result;
	}
	
}
