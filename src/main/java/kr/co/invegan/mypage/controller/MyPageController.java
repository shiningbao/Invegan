package kr.co.invegan.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.invegan.member.dto.MemberDTO;
import kr.co.invegan.mypage.dto.MyPageDTO;
import kr.co.invegan.mypage.service.MyPageService;

@Controller
public class MyPageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MyPageService service;
	
	MyPageDTO dto = new MyPageDTO();
	
	@RequestMapping(value="/myPage/info.go")
	public String infoGo(Model model, HttpSession session) {

		int user_no = ((MemberDTO) session.getAttribute("loginInfo")).getUser_no();
		
	    if (user_no != 0) {
	        MyPageDTO dto = service.userInfo(user_no);
	        model.addAttribute("dto", dto);
	        logger.info("dto:"+dto);
	        return "myPage/mypage";
	    } else {
	    	return "redirect:/login"; 
	    }
	}
	
	@RequestMapping(value="/myPage/listCall")
	@ResponseBody
	public HashMap<String, Object> listCall(@RequestParam String boardType, @RequestParam String tabType, @RequestParam Integer user_no, @RequestParam String page) {
		
	    HashMap<String, Object> result = new HashMap<String, Object>();
	    
	    switch (boardType) {
        case "요청":
            if ("작성한 글 모아보기".equals(tabType)) {
                result.put("list", service.requestBoardList(user_no,page)); 
            }
            break;
		/*
		 * case "레시피": if ("작성한 글 모아보기".equals(tabType)) { result =
		 * service.recipeBoardList(user_no,page); } else if ("댓글 모아보기".equals(tabType))
		 * { result = service.recipeComments(user_no,page); } else if
		 * ("나의 스크랩".equals(tabType)) { result = service.recipeFavorite(user_no,page); }
		 * break;
		 */
		/*
		 * case "자유게시판": if ("작성한 글 모아보기".equals(tabType)) { list =
		 * service.freeBoardList(user_no); } else if ("댓글 모아보기".equals(tabType)) { list
		 * = service.freeComments(user_no); } break; case "피드": if
		 * ("작성한 글 모아보기".equals(tabType)) { list = service.feedList(user_no); } else if
		 * ("댓글 모아보기".equals(tabType)) { list = service.feedComments(user_no); } break;
		 * case "식당": if ("댓글 모아보기".equals(tabType)) { list =
		 * service.restaurantComments(user_no); } else if ("나의 스크랩".equals(tabType)) {
		 * list = service.restaurantFavorite(user_no); } break;
		 */
        default:
        	
            break;
    }
	    result.put("user_no", user_no);
	    result.put("page", page);

	    logger.info("user_no:" + user_no);
	    logger.info("보여줄 페이지 : " + page);
	    logger.info("user_no:"+user_no);
	    logger.info("보여줄 페이지 : "+page);
	    
	    return result;
	}

	
	@RequestMapping(value="/myPage/delUser")
	public String deleteInfo(@RequestParam int user_no) {
		service.delUser(user_no);
		logger.info("user_no:"+user_no);
		return "redirect:/";
	}
	
	@RequestMapping(value="/myPage/overlay")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String nickname){
		boolean use = service.overlay(nickname);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("use", use);
		return map;
	}
	
	@RequestMapping(value="/myPage/updateNickname")
	@ResponseBody
	public HashMap<String, Object> updateNickname(@RequestParam String nickname, @RequestParam Integer user_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info(nickname+"/"+user_no);
		
		if(service.updateNickname(nickname,user_no)>0) {
			logger.info("닉네임 변경 완료");
		}
		int cnt = service.updateNickname(nickname, user_no);
		map.put("cnt", cnt);
		
		return map;
	}
	
	@RequestMapping(value="/myPage/pwConfirm")
	@ResponseBody
	public HashMap<String, Object> pwConfirm(@RequestParam String pw, @RequestParam Integer user_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info(pw+"/"+user_no);
		
		String crPw = service.pwConfirm(pw,user_no);
		logger.info(crPw);
		map.put("crPw", crPw);
		
		return map;
		
	}
	
	@RequestMapping(value="/myPage/completePw")
	@ResponseBody
	public HashMap<String, Object> completePw(@RequestParam Map<String, Object> params){
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info(params.get("user_no")+"/"+params.get("pw")+"/"+params.get("updatePw")+"/"+params.get("updatePwConfirm"));
		
		if(params.get("updatePw").equals(params.get("updatePwConfirm"))) {
			int completePw = service.completePw(params);
			logger.info("수정여부:"+completePw);
			map.put("completePw", completePw);
		}
		return map;
	}
	
	@RequestMapping(value="/myPage/save")
	@ResponseBody
	public HashMap<String, Object> save(@RequestParam Map<String, Object> params){
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info(params.get("user_no")+"/"+params.get("interests")+"/"+params.get("vegan_type")+"/"+params.get("vegan_purpose"));
		
		int cnt = service.save(params);
		logger.info("수정 여부:"+cnt);
		map.put("cnt", cnt);
	
		return map;
	}
	
	
	/*
	 * @RequestMapping(value="/myPage/imgUpload",method=RequestMethod.POST)
	 * 
	 * @ResponseBody public String imgUpload(@RequestParam("photos") MultipartFile
	 * photos, @RequestParam Integer user_no) throws IOException {
	 * logger.info("file :"+photos.getOriginalFilename()+"/user_no : "+user_no);
	 * 
	 * service.imgUpload(photos,user_no);
	 * 
	 * return "update 성공"; }
	 */
	
}
