package kr.co.invegan.board.controller;

import java.lang.System.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.service.FeedService;

@Controller
public class FeedController {
	@Autowired FeedService service;
	org.slf4j.Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/feedWrite") // feedWrite 페이지에 대한 URL 매핑을 추가
	public String feedWrite(Model model) {
		logger.info("feedWrite 접근");
		// 필요한 모델 데이터를 추가
		return "feedWrite"; // feedWrite.jsp로 이동
	}
	
	@RequestMapping(value="/write")
	public String feedPost(Model model, @RequestParam String caption , @RequestParam("image") MultipartFile image) {
		logger.info("feedPost 접근 ");
		logger.info("내용 :"+caption);
		logger.info("이미지 :"+image);
		
		return "feedWrite";
		
	}
	
}
