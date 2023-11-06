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
		String user_no = (String) session.getAttribute("user_no");
		logger.info("user_no : "+user_no);
		user_no = "1";
		MemberDTO memberInfo = null;
		if(user_no != null) {
			memberInfo = service.merberInfo(user_no);			
		}
		model.addAttribute("memberInfo", memberInfo);
		session.setAttribute("memberInfo", memberInfo);
		session.setAttribute("id", memberInfo.getId());
		logger.info("memberInfo : "+session.getAttribute("memberInfo"));
		logger.info("id : "+session.getAttribute("id"));
		return "main/header";
	}
	
	@RequestMapping(value = "/main/footer")
	public String mainFooter(Model model) {
		return "main/footer";
	}
	
}
