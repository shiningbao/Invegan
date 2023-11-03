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
	        logger.info("info:"+info);
	        return "myPage/mypage";
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
	public HashMap<String, Object> listCall(@RequestParam String boardType, @RequestParam String tabType, @RequestParam Integer user_no) {
		
	    HashMap<String, Object> result = new HashMap<String, Object>();
	    ArrayList<MyPageDTO> list = null;
	    
	    switch (boardType) {
        case "요청":
            if ("작성한 글 모아보기".equals(tabType)) {
                list = service.requestBoardList(user_no);
            }
            break;
        case "레시피":
            if ("작성한 글 모아보기".equals(tabType)) {
                list = service.recipeBoardList(user_no);
            } else if ("댓글 모아보기".equals(tabType)) {
                list = service.recipeComments(user_no);
            } else if ("나의 스크랩".equals(tabType)) {
                list = service.recipeFavorite(user_no);
            }
            break;
        case "자유게시판":
            if ("작성한 글 모아보기".equals(tabType)) {
                list = service.freeBoardList(user_no);
            } else if ("댓글 모아보기".equals(tabType)) {
                list = service.freeComments(user_no);
            }
            break;
        case "피드":
        	if ("작성한 글 모아보기".equals(tabType)) {
                list = service.feedList(user_no);
            } else if ("댓글 모아보기".equals(tabType)) {
                list = service.feedComments(user_no);
            }
            break;
//        case "식당":
//        	break;
        default:
            // 처리할 수 없는 boardType에 대한 예외 처리 또는 기본 동작을 설정
            break;
    }
	    
	    result.put("list", list);
	    logger.info("list:"+list);
	    logger.info("user_no:"+user_no);
	    return result;
	}

	
	@RequestMapping(value="/myPage/delUser")
	public String deleteInfo(@RequestParam int user_no) {
		service.delUser(user_no);
		logger.info("user_no:"+user_no);
		return "redirect:/";
	}
	
	
}
