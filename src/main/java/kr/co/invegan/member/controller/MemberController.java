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

	//아이디 비밀번호 찾기
		@RequestMapping(value = { "/member/find" }, method = RequestMethod.GET)
		public String find() {

			return "member/find";
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
		model.addAttribute("id", service.findId(response, email));
		
		return "member/findId";
	}
	

	//비밀번호 찾기
	@RequestMapping(value = { "/member/findPw" }, method = RequestMethod.GET)
	public String findPw() {

		return "member/findPw";
	}
	
	@RequestMapping(value = {"/member/findPw2"}, method = RequestMethod.POST)
	public String findPw(HttpServletResponse response, 
	        @RequestParam String id, @RequestParam String email, 
	        Model model) throws Exception {
	    logger.info("id : " + id);
	    logger.info("email : " + email);
	    
	    String pw = service.findPw(response, id, email);
	    logger.info("service.findPw(id, email)을 실행해서 pw변수에 담음");
	    if (pw != null) {
	        model.addAttribute("pw", pw);
	    }
	    
	    return "member/findPw"; 
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
	    params.put("interests", combinedInterests);
	    logger.info("params : "+params);
		String msg = service.signup(params);
		model.addAttribute("msg", msg);
		
		return "redirect:/main";
	}
	
		@RequestMapping(value = "/member/idTrueFalse")
		@ResponseBody
		public HashMap<String, Object> idTrueFalse(@RequestParam String idTrueFalse) {
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			logger.info("id 값 :"+idTrueFalse);
			String row =service.idTrueFalse(idTrueFalse);
			logger.info("row =="+row);
			String msg ="0";
				if(row.equals("0")) {
					 result.put("success", msg);
				}else {
					 msg ="1";
					 result.put("success", msg);
				}
				return result;
		}
		
	
}
