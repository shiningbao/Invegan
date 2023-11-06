package kr.co.invegan.main.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.invegan.main.service.MainService;
import kr.co.invegan.member.dto.MemberDTO;

@Controller
public class MainController {
	
	@Autowired MainService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/")
	public String main() {
		logger.info("REQUEST MAIN PAGE :: TEST");

		return "main";
	}
	
	@RequestMapping(value = "/main/header")
	public String mainHeader(Model model, HttpSession session) {
		MemberDTO loginInfo = null;
		logger.info("loginInfo: "+session.getAttribute("loginInfo"));
		if(session.getAttribute("loginInfo") != null) {			
			loginInfo = (MemberDTO) session.getAttribute("loginInfo");
			logger.info("loginId : "+loginInfo.getId()+" / admin : "+loginInfo.getIs_admin());
		}else {
			logger.info("로그인 X");
		}
		
		model.addAttribute("loginInfo", loginInfo);
		
		
		/*
		if(loginInfo != null) {
			memberInfo = service.merberInfo(loginInfo.getId());			
		}
		session.setAttribute("memberInfo", memberInfo);
		session.setAttribute("id", memberInfo.getId());
		logger.info("id : "+session.getAttribute("id")); 
		 */
		return "main/header";
	}
	
	@RequestMapping(value = "/main/footer")
	public String mainFooter(Model model) {
		return "main/footer";
	}
	
}
