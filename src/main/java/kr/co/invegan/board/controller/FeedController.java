package kr.co.invegan.board.controller;

import java.lang.System.Logger;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.dto.FeedDTO;
import kr.co.invegan.board.dto.FeedListDTO;
import kr.co.invegan.board.dto.PhotoDTO;
import kr.co.invegan.board.service.FeedService;

@Controller
@RequestMapping("/feed")
public class FeedController {
	@Autowired FeedService service;
	org.slf4j.Logger logger = LoggerFactory.getLogger(getClass());
	
//	@RequestMapping(value = "writejsp") // feedWrite 페이지에 대한 URL 매핑을 추가
//	public String writejsp(Model model) {
//		logger.info("feedWrite 접근");
//		// 필요한 모델 데이터를 추가
//		return "write.go";
//	}
	
	
	@RequestMapping(value = "write.go") // feedWrite 페이지에 대한 URL 매핑을 추가
	public String feedWrite(Model model) {
		logger.info("feedWrite 접근");
		// 필요한 모델 데이터를 추가
		
		return "feed/feedWrite"; // feedWrite.jsp로 이동
	}
	
	
	
	@RequestMapping(value = "write")
	@ResponseBody
	public String write(HttpSession session, Model model,@RequestParam HashMap<String, String> params, @RequestParam("photos") MultipartFile[] uploadimages) throws Exception {
	    logger.info("내용:" + params.get("content"));
	    logger.info("태그:" + params.get("feedTag"));
	    logger.info("이미지:" + uploadimages);
	    int userno = 1;
	    session.setAttribute("user_no", userno);
	    
	    // 나머지 로직
	    service.write(userno,params,uploadimages);
	    
	    return "success";
	}
	
	@RequestMapping(value="list.go")
	public String list() {
		
		return "feed/feedList";
	}
	
	@RequestMapping(value="feedListCall")
	@ResponseBody
	public HashMap<String, Object> feedListCall(HttpSession session){
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<FeedListDTO> list = service.list();
		result.put("list", list);
		logger.info("list :"+ list);
		logger.info("list size:"+ list.size());
		return result;
	}
	@RequestMapping(value="detail.go")
	public String detail() {
		
		
		
		return "feed/feedDetail";
	}
	
	@RequestMapping(value="feedDetailCall")
	@ResponseBody
	public HashMap<String, Object> feedDetailCall(HttpSession session, @RequestParam("post_id") int post_id){

		logger.info("상세보기 접근");
		logger.info("post id:"+post_id);
		HashMap<String, Object> result = new HashMap<String, Object>();
		ArrayList<FeedListDTO> list = service.detailList(post_id);

		
		
		result.put("list", list);
		
		
		return result;
	}
	
}
