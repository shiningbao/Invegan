package kr.co.invegan.member.controller;

import java.io.IOException;
import java.net.http.HttpResponse;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.invegan.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberService service;
	
	@RequestMapping(value="/")
	public String home() {
		return "/member/login";
	}
	
	//로그인
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> login(@RequestParam HashMap<String, String> params,
			HttpSession session){
		logger.info("params : "+params);
		
		HashMap<String, Object> result = service.login(params);
		logger.info("result : "+result);		
		if(result == null) {
			result = new HashMap<String, Object>();
			result.put("msg", "아이디 또는 비밀번호를 확인 하세요");
		}else {
			result.put("msg", "로그인에 성공 하였습니다.");
			session.setAttribute("user_no", result.get("user_no"));
			session.setAttribute("loginId", result.get("id"));
			//session.setAttribute("perm", result.get("perm"));
		}
		
		return result;
		
	}
	
	/*
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void login(@RequestParam String id, @RequestParam String pw,
			HttpServletResponse response , HttpSession session, Model model) {
		
		ModelAndView mav = new ModelAndView();
		boolean result = service.login(model, session);
		if(result == true) {
			mav.setViewName("main");
			mav.addObject("msg", "success");
		}else {
			mav.setViewName("home");
			mav.addObject("msg", "false");
		}
		return mav;
	}
	*/
	
	//아이디 찾기
	@RequestMapping(value = { "/member/findId" }, method = RequestMethod.GET)
	public String findId() {

		return "member/findId";
	}
	
	@RequestMapping(value = {"/member/findId"}, method = RequestMethod.POST)
	public String findId(HttpServletResponse response, 
			@RequestParam String nickname, @RequestParam String email, 
			Model model) throws Exception {
		logger.info("email : "+email);
		model.addAttribute("fid", service.findId(response, email));
		return "/member/findInfo";
	}
	
	
	@RequestMapping(value = { "/member/home2" }, method = RequestMethod.GET)
	public String home2() {

		return "member/home2";
	}
	
	//회원가입
	@RequestMapping(value = { "/member/signup" }, method = RequestMethod.GET)
	public String signup() {

		return "member/signup";
	}

	//이거 수정해야됨!!!!!!!!!!!!!!!!!
	@Autowired  
	private JavaMailSender mailSender;
	
	//이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("sm_email") String sm_email) throws Exception{
	    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    
	    String from = "rlaalswll25@naver.com";//보내는 이 메일주소
	    String to = sm_email;
	    String title = "회원가입시 필요한 인증번호 입니다.";
	    String content = "[인증번호] "+ serti +" 입니다. <br/> 인증번호 확인란에 기입해주십시오.";
	    String num = "";
	    try {
	    	MimeMessage mail = mailSender.createMimeMessage();
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
	        
	        mailHelper.setFrom(from);
	        mailHelper.setTo(to);
	        mailHelper.setSubject(title);
	        mailHelper.setText(content, true);       
	        
	        mailSender.send(mail);
	        num = Integer.toString(serti);
	        
	    } catch(Exception e) {
	        num = "error";
	    }
	    return num;
	}

	//여기!!!!!!!!!!!
	@RequestMapping(value = { "/member/mailCheck" }, method = RequestMethod.GET)
	public String mailCheck() {

		return "main";
	}
	
}
