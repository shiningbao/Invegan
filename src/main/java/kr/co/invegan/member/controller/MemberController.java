package kr.co.invegan.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.invegan.member.dto.MemberDTO;
import kr.co.invegan.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MemberService service;
	
	@RequestMapping(value="/member/login.go")
	public String loginPage() {
		return "member/login";
	}	
	
	//로그인
	@RequestMapping(value="/member/login", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> login(@RequestParam HashMap<String, String> params,
			HttpSession session){
		logger.info("params : "+params);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		MemberDTO loginInfo = service.login(params);
		logger.info("loginInfo : "+ loginInfo);		
		if(loginInfo == null) {
			//result = new MemberDTO();
			result.put("msg", "아이디 또는 비밀번호를 확인 하세요");
		}else {
			result.put("msg", "로그인에 성공 하였습니다.");
			result.put("loginInfo", loginInfo);
			if(loginInfo.getProfile_img() == null) {
				loginInfo.setProfile_img("profile.jpg");
			}
			session.setAttribute("loginInfo", loginInfo);
			logger.info("로그인 id :"+loginInfo.getId()+" 관리자 여부 : "+loginInfo.getIs_admin());
		}
		return result;	
	}
	
	@RequestMapping(value = "/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/";
	}

	
	//아이디 찾기
	@RequestMapping(value = { "/member/findId" }, method = RequestMethod.GET)
	public String findId() {

		return "member/findId";
	}

	
	
	@RequestMapping(value = {"/member/findId2"}, method = RequestMethod.POST)
	public String findId(HttpServletResponse response, 
			@RequestParam String email, 
			Model model) throws Exception {
		logger.info("email : "+email);
		model.addAttribute("fid", service.findId(response, email));
		return "member/findId";
	}
	
	
	//회원가입
	@RequestMapping(value = { "/member/signup" }, method = RequestMethod.GET)
	public String signupPage() {

		return "member/signup";
	}

		
	@RequestMapping(value = "/member/signup2", method = RequestMethod.POST)
	public String signup(Model model, @RequestParam HashMap<String, String> params, @RequestParam String[] interests) {
		
		// "interests" 배열을 쉼표로 구분된 하나의 문자열로 결합
	    String combinedInterests = String.join(",", interests);
	    logger.info("Combined interests: " + combinedInterests);
	    //HashMap에서 값을 집어 넣을 때 put 사용
	    //combinedInterests 값을 interests라는 이름으로 집어넣음
	    params.put("inetersts", combinedInterests);
	    logger.info("params : "+params);
		String msg = service.signup(params);
		model.addAttribute("msg", msg);
		
		return "main";
	}
		
	/*
	@GetMapping("/signup")
	public String signup(@RequestParam List<String> interests){
	    for (String interest : interests) {
	        service.signup(interest);
	    }
	    return "main";
	}
	*/

	
	
	//이거 수정해야됨!!!!!!!!!!!!!!!!!
	@Autowired  
	private JavaMailSender mailSender;
	
	//이메일 인증
	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("sm_email") String sm_email) throws Exception{
	    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    
	    //JavaMailSenderImpl mailSender = null;
	    mailSender = null;
	    
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
