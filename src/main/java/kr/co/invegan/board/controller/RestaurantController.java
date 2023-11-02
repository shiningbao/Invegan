package kr.co.invegan.board.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.invegan.board.service.RestaurantService;

@Controller
public class RestaurantController {
	
	
	@Autowired RestaurantService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/restaurant/list")
	public String restaurantList() {
		return "restaurant/restaurantList";
	}

	@RequestMapping(value = "/restaurant/write.go")
	public String restaurantWriteGo() {
		return "restaurant/restaurantWrite";
	}
	
	@RequestMapping(value = "/restaurant/write.do", method = RequestMethod.POST)
	@ResponseBody
	public String restaurantWrite(MultipartFile[] uploadImages, @RequestParam HashMap<String, Object> param, HttpSession session) throws Exception {
		
		// 로그인이 대체할려고 만든 부분
		String user = "1";
		session.setAttribute("user_no", user);
		
		String user_no = (String) session.getAttribute("user_no");
		logger.info("param : "+param);
		logger.info("uploadImages : "+uploadImages);
		
		service.restaurantWrite(user_no,uploadImages, param);


		return "redirect:/restaurantList";
	}
}
