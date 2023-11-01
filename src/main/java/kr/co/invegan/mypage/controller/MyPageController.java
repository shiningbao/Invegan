package kr.co.invegan.mypage.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value="/myPage/update.go")
	public String updateGo(Model model) {
		return "";
	}
	
	
}
